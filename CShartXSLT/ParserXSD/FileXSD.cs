using CShartXSLT.ParserXSD.Model;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.IO.Packaging;
using System.Linq;
using System.Reflection;
using System.Runtime.CompilerServices;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Xml.Serialization;
using static System.Net.Mime.MediaTypeNames;

namespace CShartXSLT.ParserXSD
{
    public class FileXSD
    {
        public string FileXSDPath { get; private set; }
        public string FileContent { get; private set; }


        //List<XSDElement> xsdElementList = new List<XSDElement>() 
        //{
        //    new All(),
        //    new Annotation(),
        //    new Any(),
        //    new AnyAttribute(),
        //    new AppInfo(),
        //    new CShartXSLT.ParserXSD.Model.Attribute(),
        //    new AttributeGroup(),
        //    new Choice(),
        //    new ComplexContent(),
        //    new ComplexType(),
        //    new Documentation(),
        //    new Element(),
        //    new Field(),
        //    new CShartXSLT.ParserXSD.Model.Group(),
        //    new Import(),
        //    new Include(),
        //    new Key(),
        //    new KeyRef(),
        //    new List(),
        //    new CShartXSLT.ParserXSD.Model.Notation(),
        //    new Redefine(),
        //    new Restriction(),
        //    new Schema(),
        //    new Selector(),
        //    new Sequence(),
        //    new SimpleContent(),
        //    new SimpleType(),
        //    new Union(),
        //    new Unique()
        //};
        public FileXSD(string fileXSDPath)
        {
            
            FileXSDPath = fileXSDPath;
            FileContent = Helper.TextReader(FileXSDPath).Replace("\t", "    ");
            List<XSDElement> xsdElementList = CreateXSDElementList();
            List<XSDElement> mainElementList = new List<XSDElement>();
            do
            {
                var tagName = FindNextTag(FileContent, xsdElementList);
                var tagBlock = FindNextTagBlock(tagName);
                var targetClass = CreateTagClass(tagBlock, tagName);

                if (targetClass != null) mainElementList.Add(targetClass);
                FileContent = RemoveTagText(FileContent, tagBlock);
            }
            while (FileContent != null);
            
        }

        List<XSDElement> CreateXSDElementList()
        {
            List<XSDElement> xsdElementList = new List<XSDElement>();

            //создание объектов
            var typeList = ReflectionHelper.GetXSDElementTypes();
            foreach (Type type in typeList)
            {
                object targetObject = Activator.CreateInstance(Type.GetType(type.FullName));
                xsdElementList.Add(targetObject as XSDElement);
            }
            return xsdElementList;

        }

        /// <summary>
        /// Ищет первое вхождение XSD Тэга. Возвращает Null, если ничего не найдено
        /// </summary>
        /// <param name="text">Текст</param>
        /// <param name="xsdElementList">Лист элементов</param>
        /// <returns>Имя тэга или Null</returns>
        //TODO:Добавить проверку на пустой XSDElementList
        //TODO:Переделать через регулярные выражения или Linq
        string FindNextTag (string text, List<XSDElement> xsdElementList)
        {
            
            var rg = new Regex(@"<([\w|\W]*?)>");
            var result = rg.Matches(text); 
            
            foreach (Match tag in result)
            { 
                foreach (XSDElement element in xsdElementList)
                {
                    if (tag.Value.Contains(element.Declaration))
                    {
                        rg = new Regex(@"([ ]+)<"+element.Declaration);
                        return rg.Match(text).Value;
                    }

                }

            }
          
            return null;
        }

        //TODO:Переделать через регулярные выражения или Linq
        //TODO:Добавить проверку на Null
        string FindNextTagParameter (string tagBlock)
        {
            if (tagBlock != null)
            {
                var rg = new Regex(@"<([\w|\W]*?)>");
                string result = rg.Match(tagBlock).Value;
                foreach (PropertyInfo field in new XSDElement().GetType().GetProperties())
                {
                    rg = new Regex(@" " + field.Name.ToLower() + "=" + @"""([\w|\W]*?)""");
                    if (rg.Match(result).Success)
                        return field.Name;
                }
            }
            return null;
        }

        //TODO:Переделать через регулярные выражения или Linq
        //TODO:Добавить проверку на Null
        string FindNextTagBlock(string tagName)
        {
            if (!string.IsNullOrEmpty(tagName))
            {
                var rg = new Regex(tagName + @"([\w|\W]*?[\n\r])" + tagName.Replace("<", "</") + ">");
                var result = rg.Match(FileContent.Replace("\t", "    "));
                if (result.Success) return result.Value;
            }
            return null;
        }

        //TODO:Добавить проверку на Null
        string RemoveTagText(string text, string tagText)
        {            
            if (text != null && tagText != null) return text.Replace(tagText, ""); 
            return null;
        }

        string GetTagParameterValue(string tagBlock, string parameterName)
        {
            if (parameterName is null) return null;
            else 
            {
                var rg = new Regex(parameterName.ToLower() + @"=""([\w|\W]*?)""");
                var result = rg.Match(tagBlock);
                return result.Groups[1].Value;
            }
            
        }

        XSDElement CreateTagClass(string tagBlock, string tagName)
        {
            if (tagBlock != null && tagName != null)
            {
                tagName = tagName.Replace(" ", "").Replace("<", "");
                string tagXSDType = tagName.Remove(0, 3).Substring(0, 1).ToUpper() + tagName.Substring(4);
                XSDElement element = Activator.CreateInstance(Type.GetType("CShartXSLT.ParserXSD.Model." + tagXSDType)) as XSDElement;
                element.Content = tagBlock;
                foreach (PropertyInfo field in element.GetType().GetProperties())
                {
                    var fieldName = field.Name;
                    var permBlock = tagBlock;
                    var parameterName = FindNextTagParameter(tagBlock);

                    do
                    {
                        if (fieldName == parameterName)
                        {
                            field.SetValue(element, GetTagParameterValue(tagBlock, parameterName));
                            tagBlock = RemoveTagText(tagBlock, parameterName);
                        }
                        permBlock = RemoveTagText(permBlock, parameterName.ToLower());
                        parameterName = FindNextTagParameter(permBlock);

                    }
                    while (parameterName != null);
                }

                return element;
            }
            return null;
        }

        



    }
}
