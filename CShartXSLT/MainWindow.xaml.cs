using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Xml;
using System.Xml.Xsl;
using System.Xml.Schema;
using System.Xml.XPath;
using System.IO;
using System.Reflection;
using System.CodeDom.Compiler;
using CShartXSLT.ParserXSD;

namespace CShartXSLT
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            FileXSD fileXSD = new FileXSD("C:\\Users\\skazakov\\source\\repos\\CShartXSLT\\CShartXSLT\\Docs\\explanatorynote-01-01.xsd");

            ////Получаем сгенерированные типы
            //var explanatoryNoteTypeList = ReflectionHelper.GetTypesWithAttribute("System.CodeDom.Compiler.GeneratedCodeAttribute");
            //var explanatoryNoteMainClass = ReflectionHelper.GetTypesWithName("ExplanatoryNote");

            ////Создаем элементы интерфейса по сгенерированным типам
            //var myWrapPannel = new WrapPanel();
            //MainGrid.Children.Add(myWrapPannel);
            
            //var stackPannelDictionary = new Dictionary<StackPanel,TextBox>();

            //foreach (Type type in explanatoryNoteTypeList)
            //{
            //    var myStackPanel = new StackPanel() { Name = type.Name, Margin = new Thickness(5) };
            //    var tbl_1 = new TextBlock() { Text = type.Name, FontWeight = FontWeights.UltraBold };                
            //    myStackPanel.Children.Add(tbl_1);
            //    myWrapPannel.Children.Add(myStackPanel);

            //    var methods = type.GetMethods(BindingFlags.Public | BindingFlags.Instance | BindingFlags.DeclaredOnly);

            //    foreach (MethodInfo method in methods)
            //    {
            //        if (method.Name.StartsWith("set"))
            //        {
            //            var myTextBox = new TextBox()
            //            {
            //                Name = method.Name,
            //                Text = method.Name
            //            };
            //            myStackPanel.Children.Add(myTextBox);
            //            //stackPannelDictionary.Add(myStackPanel, myTextBox);
            //        }
            //    }                                
            //}
           




            //Компонуем элементы
            //foreach (var child in myWrapPannel.Children)
            //{                
            //    if (child.GetType().Name == "StackPannel")
            //    {
            //        StackPanel spChild = child as StackPanel;
            //        var childName = spChild.Name;
            //        foreach (var grandChild in spChild.Children)
            //        {
            //            if (grandChild.GetType().Name == "TextBox")
            //            {
            //                TextBox tbGrandChild = grandChild as TextBox;
            //                var grandChildName = tbGrandChild.Name;
                            
            //                if (childName == grandChildName)
            //                {
                                 
            //                }
            //            }
            //        }
            //    }
            //}
           
            
            
           
          

           
            

            





        }

        

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
            

            
           


            //DataSet ds;
            //XmlDataDocument xmlDoc;
            //XslCompiledTransform xslTran;
            //XmlElement root;
            //XPathNavigator nav;
            //XmlTextWriter writer;
            //try
            //{
            //    //Create the DataSet from the XML file
            //    ds = new DataSet();
            //    ds.ReadXml(@"C:\\Users\\skazakov\\source\\repos\\CShartXSLT\\CShartXSLT\\Docs\\Employee.xml");
            //    //Create the XML from the DataSet
            //    xmlDoc = new XmlDataDocument(ds);
            //    //Load the XSLT for Transformation
            //    xslTran = new XslCompiledTransform();
            //    xslTran.Load(@"C:\Users\skazakov\source\repos\CShartXSLT\CShartXSLT\Docs\explanatorynote-01-01.xsl");
            //    //Determine the Root object in the XML
            //    root = xmlDoc.DocumentElement;
            //    //Create the XPath Navigator to navigate throuth the XML
            //    nav = root.CreateNavigator();
            //    //First delete the RTF, if already exist
            //    if (File.Exists("Employee.rtf"))
            //    {
            //        File.Delete("Employee.rtf");
            //    }
            //    //Create the RTF by Transforming the XML and XSLT
            //    writer = new XmlTextWriter(@"C:\\Users\\skazakov\\Desktop\\1\\Employee.rtf", System.Text.Encoding.Default);
            //    xslTran.Transform(nav, writer);
            //    //Close the Writer after Transformation
            //    writer.Close();
            //    //Release all objects
            //    writer = null;
            //    nav = null;
            //    root = null;
            //    xmlDoc = null;
            //    ds = null;
            //    MessageBox.Show("Document created successfully.....");
            //}
            //catch (Exception ex)
            //{
            //    writer = null;
            //    nav = null;
            //    root = null;
            //    xmlDoc = null;
            //    ds = null;
            //    MessageBox.Show(ex.StackTrace);
            //}


        }
    }
}
