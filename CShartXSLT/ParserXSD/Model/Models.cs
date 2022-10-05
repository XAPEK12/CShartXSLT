using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Runtime.Serialization.Formatters;
using System.Text;
using System.Threading.Tasks;

namespace CShartXSLT.ParserXSD.Model
{
    #region Перечисления
    internal enum NameSpaceEnum 
    {
        any,
        other,
        local,
        targetNamespace
    }
    internal enum ProcessContentsEnum
    {
        strict,
        lax,
        skip
    }
    internal enum FormEnum
    {
        qualified,
        unqualified
    }
    internal enum UseEnum
    {
        optional,
        prohibited,
        required
    }
    internal enum BlockEnum
    {
        extension,
        restriction,
        substitution,
        all
    }
    internal enum FinalEnum
    {
        extension,
        restriction,
        list,
        union,
        all
    }
    #endregion

    #region Типы
    internal class All : XSDElement
    {
        public All() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Annotation : XSDElement
    {
        public Annotation() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Any : XSDElement
    {
        public Any() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class AnyAttribute : XSDElement
    {
        public AnyAttribute() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class AppInfo : XSDElement
    {
        public AppInfo() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Attribute : XSDElement
    {
        public Attribute() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class AttributeGroup : XSDElement
    {
        public AttributeGroup() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Choice : XSDElement
    {
        public Choice() { Declaration = "xs:" +this.ToString().ToLower().Split('.').Last(); }
    }
    internal class ComplexContent : XSDElement
    {
        public ComplexContent() { Declaration = "xs:" + "complexContent"; }  
    }
    internal class ComplexType : XSDElement
    {
        public ComplexType() { Declaration = "xs:" + "complexType"; }
    }
    internal class Documentation : XSDElement
    {
        public Documentation() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }    
    }
    internal class Element : XSDElement
    {
        public Element() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Enumeration : XSDElement
    {
        public Enumeration() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Field : XSDElement
    {
        public Field() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }  
    }
    internal class Group : XSDElement
    {
        public Group() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Import : XSDElement
    {
        public Import() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }   
    }
    internal class Include : XSDElement
    {
        public Include() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Key : XSDElement
    {
        public Key() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Keyref : XSDElement
    {
        public Keyref() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class List : XSDElement
    {
        public List() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Notation : XSDElement
    {
        public Notation() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Redefine : XSDElement
    {
        public Redefine() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Restriction : XSDElement
    {
        public Restriction() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    //internal class Schema : XSDElement
    //{
    //    public Schema() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    //}
    internal class Selector : XSDElement
    {
        public Selector() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Sequence : XSDElement
    {
        public Sequence() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class SimpleContent : XSDElement
    {
        public SimpleContent() { Declaration = "xs:" + "simpleContent"; }
    }
    internal class SimpleType : XSDElement
    {
        public SimpleType() { Declaration = "xs:" + "simpleType"; }
    }
    internal class Union : XSDElement
    {
        public Union() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    internal class Unique : XSDElement 
    {
        public Unique() { Declaration = "xs:" + this.ToString().ToLower().Split('.').Last(); }
    }
    #endregion
}
