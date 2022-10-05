using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace CShartXSLT
{
    /// <summary>
    /// Кастомные методы рефлексии
    /// </summary>
    internal static class ReflectionHelper
    {
        /// <summary>
        /// Возвращает типы, в которых присутствует заданный аттрибут
        /// </summary>
        /// <param name="attributeName">Полное имя аттрибута</param>
        /// <returns></returns>
        internal static IEnumerable<Type> GetTypesWithAttribute(string attributeName)
        {
            //TODO: Проверка на null
            //TODO: Выбор по имени и ЗНАЧЕНИЮ аттрибута
            IEnumerable<Type> typeList = new List<Type>();
            typeList = Assembly.GetExecutingAssembly().GetTypes()
                .Where(t => t.GetCustomAttributes(false).Any(y => y.ToString() == attributeName));
            return typeList;
        }


        /// <summary>
        /// Возвращает типы с заданным именем
        /// </summary>
        /// <param name="typeName">Имя типа</param>
        /// <returns></returns>
        internal static IEnumerable<Type> GetTypesWithName(string typeName)
        {
            //TODO: Проыерка на null
            IEnumerable<Type> types = Assembly.GetExecutingAssembly().GetTypes()
                .Where(t => t.Name == typeName);
            return types;
        }

        /// <summary>
        /// Возвращает типы из пространства имен 
        /// </summary>
        /// <param name="nameSpace">Пространство имен</param>
        /// <returns></returns>
        internal static IEnumerable<Type> GetTypesWithNamespace(string nameSpace)
        {
            //TODO: Проыерка на null
            IEnumerable<Type> types = Assembly.GetExecutingAssembly().GetTypes()
                .Where(t => t.Namespace == nameSpace);
            return types;
        }
        /// <summary>
        /// Возвращает все типы XSDElements
        /// </summary>
        /// <returns></returns>
        internal static IEnumerable<Type> GetXSDElementTypes()
        {
            return ReflectionHelper.GetTypesWithNamespace("CShartXSLT.ParserXSD.Model")
               .Where(t => t.BaseType.Name == "XSDElement");
        }


    }
}
