using System;
using System.CodeDom;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Shapes;

namespace CShartXSLT
{
    internal static class Helper
    {
        public static string TextReader (string filePath)
        {
            if (filePath is null)
            {
                throw new ArgumentNullException(nameof(filePath));
            }
            else
            {
                using (StreamReader reader = new StreamReader(filePath))
                {
                    string text = reader.ReadToEnd();
                    return(text);
                }
            }
        }

        //public static Type[] GetFields()
        //{


        //    Assembly SampleAssembly;
        //    SampleAssembly = Assembly.
        //    //SampleAssembly = Assembly.ReflectionOnlyLoadFrom("C:\\Users\\skazakov\\source\\repos\\CShartXSLT\\CShartXSLT\\Docs\\explanatorynote-01-01.cs"); //error happens here

        //    //foreach (Type tp in SampleAssembly.GetTypes())
        //    //{
        //    //    Console.WriteLine(tp.Name);
        //    //}

        //    return SampleAssembly.GetTypes();
        //}

        //public static Type[] GetFields()
        //{

        //    Type[] typelist = (CodeNamespace)Assembly.GetExecutingAssembly().GetFile("")

                

        //    //"TestReflection" искомое пространство
        //    Type[] typelist = Assembly.GetExecutingAssembly().GetTypes().Where(t => t.Name.StartsWith("t")).ToArray();
        //    typelist.Append(Assembly.GetExecutingAssembly().GetType("ExplanatoryNote"));



        //    //foreach (Type type in typelist)
        //    //{
        //    //    //создание объекта
        //    //    object targetObject = Activator.CreateInstance(Type.GetType(type.FullName));

        //    //    ////что бы получить public методы без базовых(наследованных от object)
        //    //    //var methods = type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);
        //    //    //foreach (var methodInfo in methods)
        //    //    //{
        //    //    //    //вызов
        //    //    //    methodInfo.Invoke(targetObject, new object[] { });
        //    //    //}
        //    //}

        //    return typelist;
        //}
    }
}
