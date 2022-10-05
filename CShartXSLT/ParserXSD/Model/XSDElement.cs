using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CShartXSLT.ParserXSD.Model
{
    internal class XSDElement
    {
        #region XSD аттрибуты
        public string Id { get; set; }
        public int MaxOccurs { get; set; }
        public int MinOccurs { get; set; }
        public NameSpaceEnum NameSpace { get; set; }
        public ProcessContentsEnum ProcessContents { get; set; }
        public string Source { get; set; }
        public string Default { get; set; }
        public string Fixed { get; set; }
        public FormEnum Form { get; set; }
        public string Name { get; set; }
        public string Ref { get; set; }
        public string Type { get; set; }
        public UseEnum Use { get; set; }
        public bool Mixed { get; set; }
        public bool Abstract { get; set; }
        public BlockEnum Block { get; set; }
        public FinalEnum Final { get; set; }
        public string Lang { get; set; }
        public string SubstitutionGroup { get; set; }
        public bool Nullable { get; set; }
        public string Xpath { get; set; }
        public string SchemaLocation { get; set; }
        public string Refer { get; set; }
        public string ItemType { get; set; }
        public string Public { get; set; }
        public string System { get; set; }
        public string Base { get; set; }
        public FormEnum AttributeFormDefault { get; set; }
        public FormEnum ElementFormDefault { get; set; }
        public BlockEnum BlockDefault { get; set; }
        public FinalEnum FinalDefault { get; set; }
        public string TargetNameSpace { get; set; }
        public string Xmlns { get; set; }
        public string MemberType { get; set; }
        public string Value { get; set; }
        #endregion

        #region Пользовательские поля
        public string StartSymbol { get; } = @"<";
        public string EndSymbol { get; } = @">";
        public string CloseStartSymbol { get; } = @"</";
        public string CloseEndSymbol { get; } = @"/>";
        public string Content { get; set; }
        public string Declaration { get; protected set; }
        //TODO: Операции с листом через методы
        public List<XSDElement> ChildList = new List<XSDElement>();
        //TODO: Придумать как искать родителя
        #endregion
    }
}
