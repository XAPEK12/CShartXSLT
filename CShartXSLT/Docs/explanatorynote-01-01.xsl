<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" omit-xml-declaration="yes"/>

    <xsl:template match="/">

        <xsl:apply-templates select="ExplanatoryNote"/>

    </xsl:template>

    <xsl:template match="ExplanatoryNote">
        
       <xsl:variable name="Object" select="NonIndustrialObject | IndustrialObject | LinearObject"/>
        
        <!-- Начало основного шаблона -->
        <html>
            <head>
                <style type="text/css">
                    h1 {
                        font-family: Times New Roman;
                        font-size: 20pt;
                        font-weight: bold;
                        text-align: center;
                        width: 100%;
                        margin-top: 0px;
                    }
                    p {
                        font-family: Times New Roman;
                        font-size: 14pt;
                        margin-bottom: 5px;
                        text-indent: 30px;
                        margin-top: 0;
                        text-align: justify;
                    }
                    body {
                        font-family: Times New Roman;
                        font-size: 14pt;
                        margin: 0;
                    }
                    .title {
                        font-size: 16pt;
                        font-weight: bold;
                        text-align: center;
                        text-indent: 0px;
                        padding-top: 10px;
                        padding-bottom: 10px;
                    }
                    .subtitle
                    {
                        font-size: 14pt;
                        font-weight: bold;
                        text-align: center;
                        text-indent: 0px;
                        padding-top: 10px;
                        padding-bottom: 10px;
                        font-style: italic;
                    }
                    .imagecomment {
                        font-family: Times New Roman;
                        font-size: 12pt;
                        margin-bottom: 5px;
                        text-indent: 0px;
                        margin-top: 0px;
                        margin-bottom: 10px;
                        text-align: center;
                    }
                    .no-first-line {
                        text-indent: 0px;
                    }
                    .content
                    {
                        font-size: 14pt;
                        text-align: left;
                        text-indent: 0px;
                    }
                    .content_1
                    {
                        font-size: 14pt;
                        text-align: left;
                        text-indent: 20px;
                        margin-left: 20px;
                        font-style: italic;
                    }
                    .field {
                        font-weight: bold;
                    }
                    .center {
                        text-align: center;
                        text-indent: 0px;
                    }
                    .right {
                        text-align: right;
                    }
                    .left {
                        text-align: left;
                    }
                    .organization {
                        text-align: left;
                        text-indent: 0px;
                    }
                    .expert {
                        text-align: left;
                        text-indent: 0px;
                        font-size: 12pt;
                    }
                    .title_org_name {
                        font-size: 16pt;
                        text-align: center;
                        font-weight: bold;
                        text-indent: 0px;
                    }
                    .title_org_name {
                        font-size: 16pt;
                        text-align: center;
                        font-weight: bold;
                        text-indent: 0px;
                    }
                    .title_org_data {
                        font-size: 14pt;
                        text-align: center;
                    }
                    .pagebreak {
                        page-break-before: always;
                    }
                    .frame {
                        border: 1px solid black;
                        padding: 30px;
                    }
                    
                    table {
                        border-collapse: collapse;
                        width: 100%;
                        margin: 0em 0;
                        font-family: Times New Roman;
                        font-size: 12pt;
                    }
                    td {
                        border: 1px solid black;
                        padding: 0.2em 0.5em;
                        vertical-align: top;
                        font-family: Times New Roman;
                        font-size: 11pt;
                    }
                    td.noborder {
                        border: 0px solid black;
                        padding: 0.2em 0.5em;
                        vertical-align: top;
                        font-family: Times New Roman;
                        font-size: 11pt;
                    }
                    td.main {
                        border: 0px;
                        padding: 0.2em 0.5em;
                        vertical-align: top;
                    }
                    td.number {
                        border: 1px solid black;
                        font-family: Times New Roman;
                        font-size: 18pt;
                        text-align: center;
                    }
                    td.title {
                        border: 1px solid black;
                        padding: 0.2em 0.5em;
                        vertical-align: center;
                        align: center;
                        font-family: Times New Roman;
                        font-size: 11pt;
                        font-weight: bold;
                    }
                    td.subtitle {
                        border: 1px solid black;
                        padding: 0.2em 0.5em;
                        vertical-align: center;
                        align: center;
                        font-family: Times New Roman;
                        font-size: 11pt;
                        font-weight: bold;
                        font-style: italic;
                    }
                    img {
                        max-width: 90%;
                        align: center;
                        padding-top: 10px;
                        padding-bottom: 10px;
                    }
                    a {
                        text-decoration: none;
                        color: black;
                    }
                    a:hover {
                        text-decoration: underline;
                    }</style>
            </head>
            <title>Пояснительная записка</title>
            <body>
               <div align="center" style="width: 800px; position: absolute; left: 50%; margin-left: -400px;">

                    <!-- Начало титульного листа -->
                    <br/>
                    <div class="frame">
                        <p class="title_org_name">
                            <xsl:value-of select="IssueAuthor/Organization/OrgFullName"/>
                        </p>
                        <br/>
                        <br/>
                        <br/>
                        <p class="title">
                            <xsl:value-of select="$Object/Name"/>
                        </p>
                        <br/>
                        <br/>
                        <br/>
                        <p class="title">ПРОЕКТНАЯ ДОКУМЕНТАЦИЯ</p>
                        <br/>
                        <p class="title">Раздел 1. «Пояснительняа записка»</p>
                        <br/>
                        <p class="title">
                            <xsl:value-of select="ExplanatoryNoteNumber"/>
                        </p>
                        <br/>
                        <a name="ConstructionType"/>
                        <p class="center">
                            <span class="field">Вид работ: </span>
                            <xsl:call-template name="MakeWorkType">
                                <xsl:with-param name="Code" select="$Object/ConstructionType"/>
                            </xsl:call-template>
                        </p>
                        <br/>
                        <br/>

                        <xsl:if test="ExplanatoryNoteModifications">
                            <a name="ExplanatoryNoteModifications"/>
                            <table style="width: 300px; align: left; padding: 20px;" align="left">
                                <tr>
                                    <td colspan="2" class="title">Внесеные изменения</td>
                                </tr>
                                <tr>
                                    <td style="width: 150px;" class="title">Номер изменения</td>
                                    <td style="width: 150px;" class="title">Дата изменения</td>
                                </tr>
                                <xsl:for-each select="ExplanatoryNoteModifications/Modification">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="ModificationNumber"/>
                                        </td>
                                        <td>
                                            <xsl:call-template name="formatdate">
                                                <xsl:with-param name="DateTimeStr" select="ModificationDate"/>
                                            </xsl:call-template>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                            <br/>
                            <br/>
                        </xsl:if>

                        <a name="Signers"/>
                        <table>
                            <xsl:for-each select="Signers/Signer">
                                <tr>
                                    <td class="noborder">
                                        <p class="left">
                                            <xsl:value-of select="./Position"/>
                                        </p>
                                    </td>
                                    <td class="noborder">
                                        <p class="right">
                                            <xsl:value-of select="./FamilyName"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="./FirstName"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="./SecondName"/>
                                        </p>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                        <br/>
                        <a name="ExplanatoryNoteYear"/>
                        <p class="center">
                            <xsl:value-of select="ExplanatoryNoteYear"/>
                        </p>
                    </div>
                    <div class="pagebreak"> </div>
                    <br/>
                    <br/>
                    <!-- Конец титульного листа -->

                    <p class="title">Содержание:</p>

                    <table>
                        <xsl:if test="UsedAbbreviations">
                            <tr>
                                <td class="content">
                                    <a href="#UsedAbbreviations">Перечень использованных сокращений</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <tr>
                            <td class="content">
                                <a href="#Author">Сведения о лице (лицах), разработавшем(их) проектную документацию, застройщике, техническом заказчике</a>
                            </td>
                        </tr>

                        <tr>
                            <td class="content">
                                <a href="#ProjectDocumentationContent">Состав проектной документации</a>
                            </td>
                        </tr>

                        <xsl:if test="//Model">
                            <tr>
                                <td class="content">
                                    <a href="#Model">Сведения о составе 3D модели объекта</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="UsedNorms">
                            <tr>
                                <td class="content">
                                    <a href="#UsedNorms">Перечень документов по стандартизации, используемых полностью или частично на добровольной основе для соблюдения требований технических регламентов (из числа документов по стандартизации, включенных в перечни документов в области
                                        стандартизации, в результате применения которых на добровольной основе обеспечивается соблюдение требований технических регламентов)</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <tr>
                            <td class="content">
                                <a href="#ProjectDecisionDocuments">Основания для разработки проектной документации</a>
                            </td>
                        </tr>

                        <tr>
                            <td class="content">
                                <a href="#ProjectInitialDocuments">Состав исходно-разрешительной документации</a>
                            </td>
                        </tr>
                        
                        <xsl:if test="AdditionalData">
                            <tr>
                                <td class="content">
                                    <a href="#AdditionalData">Перечень дополнительных материалов</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="FinanceSources">
                            <tr>
                                <td class="content">
                                    <a href="#FinanceSources">Сведения об источнике (источниках) и размере финансирования строительства (реконструкции, капитального ремонта, сноса) объекта капитального строительства</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="$Object/ClimateConditions">
                            <tr>
                                <td class="content">
                                    <a href="#ClimateConditions">Сведения о климатической, географической и инженерно-геологической характеристике района, на территории которого предполагается осуществлять строительство объекта</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/ClimateConditions/DangerousNatureProcesses">
                            <tr>
                                <td class="content">
                                    <a href="#DangerousNatureProcesses">Возможность опасных природных процессов и явлений и техногенных воздействий на территории, на которой будут осуществляться строительство, реконструкция и эксплуатация здания или сооружения</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="IndustrialObject or NonIndustrialObject">
                            <tr>
                                <td class="content">
                                    <a href="#Object">Сведения об объекте капитального строительства, его функциональном назначении, составе и характеристики производства, номенклатуре выпускаемой продукции (работ, услуг)</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="LinearObject">
                            <tr>
                                <td class="content">
                                    <a href="#Object">Сведения о линейном объекте</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/Functions or $Object/LinearObjectNote">
                            <tr>
                                <td class="content">
                                    <a href="#Functions">Сведения о линейном объекте</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test=" $Object/FunctionsFeature">
                            <tr>
                                <td class="content">
                                    <a href="#FunctionsFeatures">Сведения о принадлежности к объектам транспортной инфраструктуры и к другим объектам, функционально-технологические особенности которых влияют на их безопасность</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                            <xsl:if test="$Object/PowerIndicator">
                                <tr>
                                    <td class="content">
                                        <a href="#PowerIndicator">Сведения о проектной мощности объекта капитального стрительства</a>
                                    </td>
                                </tr>
                            </xsl:if>

                            <xsl:if test="$Object/TEI">
                                <tr>
                                    <td class="content">
                                        <a href="#TEI">Технико-экономические показатели объекта капитального строительства</a>
                                    </td>
                                </tr>
                            </xsl:if>

                        <xsl:if test="$Object/DangerousIndustrialObject">
                                <tr>
                                    <td class="content">
                                        <a href="#DangerousIndustrialObject">Сведения о принадлежности к опасным производственным объектам</a>
                                    </td>
                                </tr>
                            </xsl:if>
                        
                        <xsl:if test="$Object/EnergyEfficiency">
                            <tr>
                                <td class="content">
                                    <a href="#EnergyEfficiency">Сведения о классе энергетической эффективности  и о повышении энергетической эффективности</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/LinearObjectCategory">
                            <tr>
                                <td class="content">
                                    <a href="#LinearObjectCategory">Сведения о категории линейного объекта</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/LinearObjectClass">
                            <tr>
                                <td class="content">
                                    <a href="#LinearObjectClass">Сведения о классе линейного объекта</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/FireDangerCategory">
                            <tr>
                                <td class="content">
                                    <a href="#FireDangerCategory">Сведения о пожарной и взрывопожарной опасности</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/PeoplePermanentStay">
                            <tr>
                                <td class="content">
                                    <a href="#PeoplePermanentStay">Сведения о наличии помещений с постоянным пребыванием людей</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/ResponsibilityLevel">
                            <tr>
                                <td class="content">
                                    <a href="#ResponsibilityLevel">Сведения об уровне ответсвенности</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/ObjectParts">
                            <tr>
                                <td class="content">
                                    <a href="#Parts">Сведения об составе сложного (составного) объекта капитального строительства</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/LinearObject/Routes">
                            <tr>
                                <td class="content">
                                    <a href="#Routes">Описание вариантов маршрутов прохождения линейного объекта по территории района строительства, обоснование выбранного варианта трассы</a>
                                </td>
                            </tr>
                        </xsl:if>


                        <xsl:if test="$Object/Resources">
                                <tr>
                                    <td class="content">
                                        <a href="#Resources">Cведения о потребности объекта капитального строительства в топливе, газе, воде и электрической энергии</a>
                                    </td>
                                </tr>
                            </xsl:if>

                        <xsl:if test="$Object/RawResources">
                                <tr>
                                    <td class="content">
                                        <a href="#RawResources">Сведения о сырьевой базе, потребности производства в воде, топливно-энергетических ресурсах</a>
                                    </td>
                                </tr>
                            </xsl:if>

                        <xsl:if test="$Object/ResourceUseInfo">
                                <tr>
                                    <td class="content">
                                        <a href="#ResourceUseInfo">Сведения о комплексном использовании сырья, вторичных энергоресурсов, отходов производства</a>
                                    </td>
                                </tr>
                            </xsl:if>

                        <xsl:if test="$Object/RenewableSourceInfo">
                                <tr>
                                    <td class="content">
                                        <a href="#RenewableSourceInfo">Сведения об использовании возобновляемых источников энергии и вторичных энергетических ресурсов</a>
                                    </td>
                                </tr>
                            </xsl:if>

                        <xsl:if test="$Object/LandCategory">
                            <tr>
                                <td class="content">
                                    <a href="#LandCategory">Сведения о категории земель, на которых планируется разместить (размещен) объект капитального строительства</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/LandInfo">
                            <tr>
                                <td class="content">
                                    <a href="#LandInfo">Сведения о земельных участках, изымаемых для государственных или муниципальных нужд, о земельных участках, в отношении которых устанавливается сервитут, публичный сервитут и (или) заключается договор аренды (субаренды)</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="$Object/LandFunds">
                            <tr>
                                <td class="content">
                                    <a href="#LandFunds">Cведения о размере средств, требующихся для возмещения убытков правообладателям земельных участков и (или) для внесения в качестве арендной платы, платы за сервитут, публичный сервитут и (или) для выкупа земельных участков</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/PatentsUsed">
                            <tr>
                                <td class="content">
                                    <a href="#PatentsUsed">Сведения об использованных в проекте изобретениях, результатах проведенных патентных исследований</a>
                                </td>
                            </tr>
                        </xsl:if>
                                               
                        <xsl:if test="ProjectInitialDocuments/Document[DocType = '19.01' or DocType = '19.02'] or SpecialRequirements">
                            <tr>
                                <td class="content">
                                    <a href="#PatentsUsed">Сведения о наличии разработанных и согласованных специальных технических условий</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/StaffNote">
                            <tr>
                                <td class="content">
                                    <a href="#StaffNote">Данные о численности работников на объекте капитального строительства и их профессионально-квалификационном составе, числе рабочих мест и другие данные, установленные заданием на проектирование и характеризующие объект капитального строительства</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/SoftwareUsed">
                            <tr>
                                <td class="content">
                                    <a href="#SoftwareUsed">Сведения о компьютерных программах, которые использовались выполнении расчетов конструктивных элементов зданий, строений и сооружений</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/StagesInfo">
                            <tr>
                                <td class="content">
                                    <a href="#StagesInfo">
                                        <xsl:if test="LinearObject">Описание принципиальных проектных решений, обеспечивающих надежность линейного объекта, последовательность его строительства, намечаемые этапы строительства и планируемые сроки ввода их в эксплуатацию</xsl:if>
                                        <xsl:if test="IndustrialObject or NonIndustrialObject">Сведения об этапах строительства объекта капитального строительства (обоснование возможности осуществления строительства по этапам)</xsl:if>
                                    </a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="$Object/DestroyFunds">
                            <tr>
                                <td class="content">
                                    <a href="#DestroyFunds">Сведения о предполагаемых затратах, связанных со сносом зданий и сооружений, переселением людей, переносом сетей инженерно-технического обеспечения</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/EnergyEfficiencyLinks">
                            <tr>
                                <td class="content">
                                    <a href="#EnergyEfficiencyLinks">Сведения о разделах и пунктах проектной документации, содержащих решения и мероприятия по обеспечению соблюдения требований энергетической эффективности и оснащенности зданий, строений, сооружений приборами учета используемых энергетических ресурсов</a>
                                </td>
                            </tr>
                        </xsl:if>                        

                        <xsl:if test="$Object/IndustrialSafetyLinks">
                            <tr>
                                <td class="content">
                                    <a href="#IndustrialSafetyLinks">Сведения о разделах и пунктах проектной документации, содержащих решения и мероприятия по обеспечению соблюдения требований промышленной безопасности</a>
                                </td>
                            </tr>
                        </xsl:if> 

                        <xsl:if test="$Object/LandReclamationLink">
                            <tr>
                                <td class="content">
                                    <a href="#IndustrialSafetyLinks">Сведения о наличии проекта рекультивации земель</a>
                                </td>
                            </tr>
                        </xsl:if> 
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/ObjectList">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesObjectList">Список объектов производственного и непроизводственного назначения, входящих в состав проектируемой атомной станции</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/NuclearSafety">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesNuclearSafety">Общие сведения о требованиях к системам, обеспечивающим ядерную и радиационную безопасность атомной станции</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/OperationalLimits">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesOperationalLimits">Исходные данные, пределы безопасной эксплуатации и эксплуатационные пределы оборудования и систем</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/NuclearPlantControl">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesNuclearPlantControl">Сведения об организации управления атомной станцией, ее эксплуатационном, ремонтном, техническом обслуживании, штатном расписании, требованиях к персоналу и условиях труда работников</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/ReactorPlant">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesReactorPlant">Основные сведения о реакторной установке, применяемой на атомной станции, об исходных технических требованиях на оборудование, применяемое на атомной станции, об основном и вспомогательном оборудовании основных технологических контуров атомной станции</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/NuclearSafitySoftware">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesNuclearSafitySoftware">Сведения о компьютерных программах, которые использовались для анализов безопасности атомной станции, об аттестации и верификации применяемых компьютерных программ, о системах сертификации, стандартизации и метрологическом обеспечении, о разработке
                                        программы обеспечения качества, отчета по обоснованию безопасности и вероятностных анализов безопасности атомной станции первого и второго уровней, о стационарной системе непрерывного мониторинга технического состояния объекта капитального строительства</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms">
                            <tr>
                                <td class="content">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms1">Сведения о программах мониторинга</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/GeotechnicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms1">Геотехнический мониторинг, включая мониторинг кренов и осадок</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/HydrogeologicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms2">Гидрогеологический мониторинг</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/SeismologicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms3">Сейсмологический мониторинг</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/MeteorologicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms4">Метеорологический мониторингг</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/AerologicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms5">Аэрологический мониторинг</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/HydrologicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms6">Гидрологический мониторинг</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/GeodynamicalMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms7">Геодинамический мониторинг</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/NuclearPlantFeatures/MonitoringPrograms/TechnogenicMonitoring">
                            <tr>
                                <td class="content_1">
                                    <a href="#NuclearPlantFeaturesNuclearMonitoringPrograms8">Периодический контроль параметров внешних техногенных воздействий</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/GasNetworksFeatures/StrengthCalculation">
                            <tr>
                                <td class="content">
                                    <a href="#GasNetworksFeaturesStrengthCalculation">Расчет трубопроводов на прочность и устойчивость</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/GasNetworksFeatures/EnvironmentalProtection">
                            <tr>
                                <td class="content">
                                    <a href="#GasNetworksFeaturesEnvironmentalProtection">Перечень мероприятий по охране окружающей среды, включающий мероприятия по предотвращению и (или) снижению возможного негативного воздействия на окружающую среду при эксплуатации линейного объекта и рациональному использованию природных ресурсов на период строительства и эксплуатации линейного объекта</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/GasNetworksFeatures/FireSafety">
                            <tr>
                                <td class="content">
                                    <a href="#GasNetworksFeaturesFireSafety">Перечень мероприятий по обеспечению пожарной безопасности</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/GasNetworksFeatures/OperationalSafety">
                            <tr>
                                <td class="content">
                                    <a href="#GasNetworksFeaturesOperationalSafety">Перечень мероприятий по безопасной эксплуатации линейного объекта</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/GasNetworksFeatures/PerairFrequency">
                            <tr>
                                <td class="content">
                                    <a href="#GasNetworksFeaturesPerairFrequency">Нормативная периодичность выполнения работ по капитальному ремонту линейного объекта</a>
                                </td>
                            </tr>
                        </xsl:if>
                        
                        <xsl:if test="$Object/EngineeringTerritoryProtection">
                            <tr>
                                <td class="content">
                                    <a href="#EngineeringTerritoryProtection">Описание принципиальных проектных решений по инженерной защите территории при строительстве, реконструкции автомобильных дорог</a>
                                </td>
                            </tr>
                        </xsl:if>

                        <xsl:if test="DesignerNote">
                            <xsl:for-each select="DesignerNote">
                                <xsl:if test="@Title">
                                    <tr>
                                        <td class="content">
                                            <a>
                                                <xsl:attribute name="href">#Note<xsl:value-of select="position()"/></xsl:attribute>
                                                <xsl:value-of select="@Title"/>
                                            </a>
                                        </td>
                                    </tr>
                                </xsl:if>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="DesignerAssurance">
                            <tr>
                                <td class="content">
                                    <a href="#DesignerAssurance">Заверение проектной организации о том, что проектная документация разработана в соответствии с градостроительным планом земельного участка, заданием на проектирование, градостроительным регламентом, документами об использовании
                                        земельного участка для строительства (в случае если на земельный участок не распространяется действие градостроительного регламента или в отношении его не устанавливается градостроительный регламент), техническими регламентами, в том числе устанавливающими
                                        требования по обеспечению безопасной эксплуатации зданий, строений, сооружений и безопасного использования прилегающих к ним территорий, и с соблюдением технических условий.</a>
                                </td>
                            </tr>
                        </xsl:if>
                    </table>

                    <div class="pagebreak"> </div>
                    <br/>
                    <br/>

                    <!-- Список использованных сокращений -->
                    <xsl:if test="UsedAbbreviations">
                        <a name="UsedAbbreviations"/>
                        <p class="title">Перечень использованных сокращений:</p>
                        <xsl:apply-templates select="UsedAbbreviations"/>
                        <br/>
                        <br/>
                    </xsl:if>

                    <!-- Сведения об авторе пояснительно записки, застройщике, техническом заказчике -->
                    <a name="IssueAuthor"/>
                    <p class="field no-first-line">Генеральный проектировщик:</p>
                    <xsl:for-each select="IssueAuthor">
                        <p class="organization">
                            <xsl:choose>
                                <xsl:when test="Organization">
                                    <xsl:apply-templates select="Organization"/>
                                </xsl:when>
                                <xsl:when test="ForeignOrganization">
                                    <xsl:apply-templates select="ForeignOrganization"/>
                                </xsl:when>
                                <xsl:when test="IP">
                                    <xsl:apply-templates select="IP"/>
                                </xsl:when>
                                <xsl:when test="Person">
                                    <xsl:apply-templates select="Person"/>
                                </xsl:when>
                            </xsl:choose>
                        </p>
                        <p class="no-first-line">
                        <xsl:if test="SROMembership">
                            <xsl:apply-templates select="SROMembership"/>
                        </xsl:if>
                        </p>
                        <br/>
                    </xsl:for-each>

                    <a name="ProjectDocumentationAuthors"/>
                    <xsl:if test="ProjectDocumentationAuthors">
                        <p class="field no-first-line">Сведения о лицах, принимавших участие в разработке проектной документации:</p>
                        <xsl:for-each select="ProjectDocumentationAuthors/ProjectDocumentationAuthor">
                            <p class="organization">
                                <xsl:choose>
                                    <xsl:when test="Organization">
                                        <xsl:apply-templates select="Organization"/>
                                    </xsl:when>
                                    <xsl:when test="ForeignOrganization">
                                        <xsl:apply-templates select="ForeignOrganization"/>
                                    </xsl:when>
                                    <xsl:when test="IP">
                                        <xsl:apply-templates select="IP"/>
                                    </xsl:when>
                                    <xsl:when test="Person">
                                        <xsl:apply-templates select="Person"/>
                                    </xsl:when>
                                </xsl:choose>
                            </p>
                            <p class="no-first-line">
                            <xsl:if test="SROMembership">
                                <xsl:apply-templates select="SROMembership"/>
                            </xsl:if>
                            </p>
                            <br/>
                        </xsl:for-each>
                    </xsl:if>

                    <a name="Developer"/>
                    <xsl:if test="Developer">
                        <xsl:if test="count(Developer) = 1">
                            <p class="field no-first-line">Застройщик:</p>
                        </xsl:if>
                        <xsl:if test="count(Developer) &gt; 1">
                            <p class="field no-first-line">Застройщики:</p>
                        </xsl:if>
                        <xsl:for-each select="Developer">
                            <p class="organization">
                                <xsl:choose>
                                    <xsl:when test="Organization">
                                        <xsl:apply-templates select="Organization"/>
                                    </xsl:when>
                                    <xsl:when test="ForeignOrganization">
                                        <xsl:apply-templates select="ForeignOrganization"/>
                                    </xsl:when>
                                    <xsl:when test="IP">
                                        <xsl:apply-templates select="IP"/>
                                    </xsl:when>
                                    <xsl:when test="Person">
                                        <xsl:apply-templates select="Person"/>
                                    </xsl:when>
                                </xsl:choose>
                            </p>
                            <br/>
                        </xsl:for-each>
                    </xsl:if>

                    <a name="TechnicalCustomer"/>
                    <xsl:if test="TechnicalCustomer">
                        <xsl:if test="count(TechnicalCustomer) = 1">
                            <p class="field  no-first-line">Технический заказчик:</p>
                        </xsl:if>
                        <xsl:if test="count(TechnicalCustomer) &gt; 1">
                            <p class="field  no-first-line">Технические заказчики:</p>
                        </xsl:if>
                        <xsl:for-each select="TechnicalCustomer">
                            <p class="organization">
                                <xsl:choose>
                                    <xsl:when test="Organization">
                                        <xsl:apply-templates select="Organization"/>
                                    </xsl:when>
                                    <xsl:when test="ForeignOrganization">
                                        <xsl:apply-templates select="ForeignOrganization"/>
                                    </xsl:when>
                                </xsl:choose>
                            </p>
                            <p class="no-first-line">
                            <xsl:if test="SROMembership">
                                <xsl:apply-templates select="SROMembership"/>
                            </xsl:if>
                            </p>
                            <br/>
                        </xsl:for-each>
                    </xsl:if>
                    <div class="pagebreak"/>
                    <br/>
                    <br/>

                    <!-- Сведения о составе проектной документации -->
                    <a name="ProjectDocumentationContent"/>
                    <p class="title">Состав проектной документации</p>
                    <xsl:choose>
                        <xsl:when test="NonIndustrialObject">
                            <xsl:call-template name="NonLinearProjectDocumentContent">
                                <xsl:with-param name="DocumentationContent" select="$Object/ProjectDocumentation"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="IndustrialObject">
                            <xsl:call-template name="NonLinearProjectDocumentContent">
                                <xsl:with-param name="DocumentationContent" select="$Object/ProjectDocumentation"/>
                            </xsl:call-template>
                        </xsl:when>
                        <xsl:when test="LinearObject">
                            <xsl:call-template name="LinearProjectDocumentContent">
                                <xsl:with-param name="DocumentationContent" select="$Object/ProjectDocumentation"/>
                            </xsl:call-template>
                        </xsl:when>
                    </xsl:choose>
                    <br/>

                    <!-- Сведения о составе 3D - модели  -->
                    <xsl:if test="//Model">
                        <a name="Model"/>
                        <p class="title">Сведения о составе 3D модели объекта</p>

                        <table>
                            <tr>
                                <td class="title" width="50%">Объект / Составная часть объекта</td>
                                <td class="title" width="50%">Сведения о составе модели</td>
                            </tr>

                            <xsl:for-each select="//Model">
                                <xsl:variable name="FileCount" select="count(ModelFile)"/>
                                <xsl:for-each select="ModelFile">
                                    <tr>
                                        <xsl:if test="position() = 1">
                                            <td>
                                                <xsl:attribute name="rowspan">
                                                    <xsl:value-of select="$FileCount"/>
                                                </xsl:attribute>
                                                <xsl:value-of select="../../Name"/>
                                                <br/>
                                                <xsl:value-of select="../Description"/>
                                            </td>
                                        </xsl:if>
                                        <td> Имя файла: <xsl:value-of select="FileName"/><br/> Тип модели: <xsl:value-of select="FileFormat"/><br/> Контрольная сумма: <xsl:value-of select="FileChecksum"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </xsl:for-each>

                        </table>

                    </xsl:if>

                    <xsl:if test="UsedNorms">
                        <a name="UsedNorms"/>
                        <p class="title">Перечень документов по стандартизации, используемых полностью или частично на добровольной основе для соблюдения требований технических регламентов (из числа документов по стандартизации, включенных в перечни документов в области стандартизации, в результате
                            применения которых на добровольной основе обеспечивается соблюдение требований технических регламентов)</p>
                        <xsl:for-each select="UsedNorms/UsedNorm">
                            <p>
                                <xsl:number value="position()" format="1. "/>
                                <xsl:value-of select="."/>
                            </p>
                        </xsl:for-each>
                        <br/>
                        <br/>
                    </xsl:if>

                    <a name="ProjectDecisionDocuments"/>
                    <p class="title">Основания для разработки проектной документации</p>
                    <table>
                        <tr>
                            <td style="width: 10%;" class="title">№ п/п</td>
                            <td style="width: 50%;" class="title">Наименование и реквизиты документа</td>
                            <td style="width: 25%;" class="title">Имя файла документа (подписи документа)</td>
                            <td class="title">Контрольная сумма файла документа (подписи документа)</td>
                        </tr>

                        <xsl:for-each select="ProjectDecisionDocuments/Document">
                            <xsl:sort select="DocType"/>
                            <xsl:call-template name="MakeDocFileTable"/>
                        </xsl:for-each>

                    </table>

                    <a name="ProjectInitialDocuments"/>
                    <p class="title">Состав исходно-разрешительной документации</p>
                    <table>
                        <tr>
                            <td style="width: 10%;" class="title">№ п/п</td>
                            <td style="width: 50%;" class="title">Наименование и реквизиты документа</td>
                            <td style="width: 25%;" class="title">Имя файла документа (подписи документа)</td>
                            <td class="title">Контрольная сумма файла документа (подписи документа)</td>
                        </tr>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType = '05.03']">
                            <tr>
                                <td colspan="4" class="title">Задание на проектирование</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType = '05.03']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '17.00' and DocType &lt; '17.00']">
                            <tr>
                                <td colspan="4" class="title">Правоустанавливающие документы</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '17.00' and DocType &lt; '18.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '03.00' and DocType &lt; '04.00']">
                            <tr>
                                <td colspan="4" class="title">Документы по планировке территории, в том числе градостроительный план земельного участка</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '03.00' and DocType &lt; '04.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '02.00' and DocType &lt; '03.00']">
                            <tr>
                                <td colspan="4" class="title">Заключения экспертизы</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '02.00' and DocType &lt; '03.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '05.00' and DocType &lt; '06.00']">
                            <tr>
                                <td colspan="4" class="title">Задания и программы инженерных изысканий</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '05.01' and DocType &lt; '06.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="EngineeringSurveyDocuments/Document[DocType &gt; '06.00' and DocType &lt; '07.00']">
                            <tr>
                                <a name="EngineeringSurveyDocuments"/>
                                <td colspan="4" class="title">Отчетная документация по результатам инженерных изысканий</td>
                            </tr>
                            <xsl:for-each select="EngineeringSurveyDocuments/Document[DocType &gt; '06.00' and DocType &lt; '07.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '04.00' and DocType &lt; '05.00']">
                            <tr>
                                <td colspan="4" class="title">Технические условия предусмотренные частью 7 статьи 48 Градостроительного кодекса Российской Федерации и иными нормативными правовыми актами, документы о согласовании отступлений от положений технических условий</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '04.00' and DocType &lt; '05.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '19.00' and DocType &lt; '20.00']">
                            <tr>
                                <td colspan="4" class="title">Специальные технические условия предусмотренные частью 7 статьи 48 Градостроительного кодекса Российской Федерации и иными нормативными правовыми актами, документы о согласовании отступлений от положений специальных технических
                                    условий</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '19.00' and DocType &lt; '20.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '12.00' and DocType &lt; '13.00']">
                            <tr>
                                <td colspan="4" class="title">Документы в отношении типовой проектной документации повторного использования</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '12.00' and DocType &lt; '13.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '13.00' and DocType &lt; '14.00']">
                            <tr>
                                <td colspan="4" class="title">Решения и обоснования сноса объектов капитального строительства</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '13.00' and DocType &lt; '14.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '20.00' and DocType &lt; '21.00']">
                            <tr>
                                <td colspan="4" class="title">Разрешения</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '20.00' and DocType &lt; '21.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '18.00' and DocType &lt; '19.00']">
                            <tr>
                                <td colspan="4" class="title">Обоснование безопасности опасного производственного объекта</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '18.00' and DocType &lt; '19.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '22.00' and DocType &lt; '23.00']">
                            <tr>
                                <td colspan="4" class="title">Документы в области организации транспортной инфраструктуры</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '22.00' and DocType &lt; '23.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '23.00' and DocType &lt; '24.00']">
                            <tr>
                                <td colspan="4" class="title">Документы в отношении объектов культурного наследия</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '23.00' and DocType &lt; '24.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '21.00' and DocType &lt; '22.00']">
                            <tr>
                                <td colspan="4" class="title">Документы в сфере охраны окружающей среды и недрапользования</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '21.00' and DocType &lt; '22.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '10.00' and DocType &lt; '11.00']">
                            <tr>
                                <td colspan="4" class="title">Выписка из реестра членов саморегулируемой организации</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '10.00' and DocType &lt; '11.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType &gt; '24.00' and DocType &lt; '25.00']">
                            <tr>
                                <td colspan="4" class="title">Расчеты</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '24.00' and DocType &lt; '25.00']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType = '99.99']">
                            <tr>
                                <td colspan="4" class="title">Иные исходно-разрешительные документы</td>
                            </tr>
                            <xsl:for-each select="ProjectInitialDocuments/Document[DocType = '99.99']">
                                <xsl:sort select="DocType"/>
                                <xsl:call-template name="MakeDocFileTable"/>
                            </xsl:for-each>
                        </xsl:if>
                    </table>
                <br/>
                    
                    <xsl:if test="AdditionalData">
                        <a name="AdditionalData"/>
                        <p class="title">Перечень дополнительных материалов</p>
                        <table style="border-style: solid; border-width:1px; border-collapse: collapse; align: center;">
                            <tr>
                                <td style="width: 65%" class="title">Описание материала</td>
                                <td style="width: 35%" class="title">Имя файла материала (подписи)</td>
                            </tr>
                            
                            <xsl:for-each select="AdditionalData/Data">
                                <xsl:apply-templates select="."/>
                            </xsl:for-each>
                        </table>
                        <br/>
                    </xsl:if>

                    <xsl:if test="FinanceSources">
                        <a name="FinanceSources"/>
                        <p class="title">Сведения об источнике (источниках) и размере финансирования строительства (реконструкции, капитального ремонта, сноса) объекта капитального строительства</p>

                        <table style="border-style: solid; border-width:1px; border-collapse: collapse; align: center;">
                            <tr>
                                <td style="width: 40%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;">Источник финансирования <xsl:if test="FinanceSources/FinanceComment">
                                        <sup>*</sup>
                                    </xsl:if>
                                </td>
                                <td style="width: 40%; border-style: solid; border-width:1px; font-weight: bold;text-align: center;">Наименование уровня бюджета/ Сведения о юридическом лице (владельце средств)</td>
                                <td style="width: 20%; border-style: solid; border-width:1px; font-weight: bold;text-align: center;">Доля финансирования, %</td>
                            </tr>

                            <xsl:for-each select="FinanceSources/BudgetSource">
                                <tr>
                                    <td>Бюджетные средства</td>
                                    <td>
                                        <xsl:value-of select="BudgetLevel"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="SourceRatio"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                            <xsl:for-each select="FinanceSources/StateCustomerSource">
                                <tr>
                                    <td>Средства юридических лиц, перечисленных в части 2 статьи 8.3 Градостроительного кодекса Российской Федерации</td>
                                    <td>
                                        <xsl:apply-templates select="Owner/Organization"/>
                                        <xsl:apply-templates select="Owner/ForeignOrganization"/>
                                        <xsl:apply-templates select="Owner/IP"/>
                                        <xsl:apply-templates select="Owner/Person"/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="SourceRatio"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                            <xsl:for-each select="FinanceSources/PrivateSource">
                                <tr>
                                    <td>Средства, не входящие в перечень, указанный в части 2 статьи 8.3 Градостроительного кодекса Российской Федерации</td>
                                    <td> </td>
                                    <td>
                                        <xsl:value-of select="SourceRatio"/>
                                    </td>
                                </tr>
                            </xsl:for-each>

                        </table>
                    </xsl:if>

                    <xsl:if test="$Object/ClimateConditions">
                        <a name="ClimateConditions"/>
                        <p class="title">Сведения о климатической, географической и инженерно-геологической характеристике района, на территории которого предполагается осуществлять строительство объекта</p>

                        <xsl:if test="$Object/ClimateConditions/ClimateDistrict">
                            <p>Климатический район, подрайон: <xsl:text> </xsl:text>
                                <xsl:for-each select="$Object/ClimateConditions/ClimateDistrict">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>

                        <xsl:if test="$Object/ClimateConditions/GeologicalConditions">
                            <p>Категория сложности инженерно-геологических условий: <xsl:text> </xsl:text>
                                <xsl:for-each select="$Object/ClimateConditions/GeologicalConditions">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>

                        <xsl:if test="$Object/ClimateConditions/WindDistrict">
                            <p>Ветровой район: <xsl:text> </xsl:text>
                                <xsl:for-each select="$Object/ClimateConditions/WindDistrict">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>

                        <xsl:if test="$Object/ClimateConditions/SnowDistrict">
                            <p>Снеговой район: <xsl:text> </xsl:text>
                                <xsl:for-each select="$Object/ClimateConditions/SnowDistrict">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>

                        <xsl:if test="$Object/ClimateConditions/SeismicActivity">
                            <p>Интенсивность сейсмических воздействий: <xsl:text> </xsl:text>
                                <xsl:for-each select="$Object/ClimateConditions/SeismicActivity">
                                    <xsl:value-of select="."/>
                                    <xsl:if test="position() != last()">, </xsl:if>
                                </xsl:for-each>
                            </p>
                        </xsl:if>
                        <br/>
                        <br/>
                        <xsl:apply-templates select="$Object/ClimateConditions/ClimateNote"/>
                        <br/>
                        <br/>
                    </xsl:if>

                    <xsl:if test="$Object/ClimateConditions/DangerousNatureProcesses">
                        <a name="DangerousNatureProcesses"/>
                        <p class="title">Возможность опасных природных процессов и явлений и техногенных воздействий на территории, на которой будут осуществляться строительство, реконструкция и эксплуатация здания или сооружения</p>
                        <xsl:apply-templates select="$Object/ClimateConditions/DangerousNatureProcesses"/>
                        <br/>
                        <br/>
                    </xsl:if>

                    <!-- Сведения об объекте, функцональном назначении -->
                    <!-- Нелинейный объект -->
                    <a name="Object"/>
                    <xsl:if test="IndustrialObject or NonIndustrialObject">
                        <p class="title">Сведения об объекте капитального строительства, его функциональном назначении, составе и характеристики производства, номенклатуре выпускаемой продукции (работ, услуг)</p>
                        <br/>
                        <p>
                            <span class="field">Наименование объекта капитального строительства: </span>
                            <xsl:value-of select="$Object/Name"/>
                        </p>
                        <p>
                            <span class="field">Почтовый (строительный) адрес (местоположение) объекта капитального строительства: </span>
                            <xsl:apply-templates select="$Object/Address"/>
                        </p>
                        <br/>
                    </xsl:if>

                    <!-- Линейный объект -->
                    <xsl:if test="LinearObject">
                        <a name="LinearObject"/>
                        <p class="title">Сведения о линейном объекте</p>
                        <br/>
                        <p>
                            <span class="field">Наименование объекта капитального строительства: </span>
                            <xsl:value-of select="$Object/Name"/>
                        </p>
                        <br/>
                        <p class="field">Почтовый (строительный) адрес (местоположение) объекта капитального строительства: </p>
                        <br/>
                        <p>
                            <span class="field">Местоположение начального пункта: </span>
                            <xsl:apply-templates select="$Object/Address"/>
                        </p>
                        <br/>
                        <p>
                            <span class="field">Местоположение конечного пункта: </span>
                            <xsl:apply-templates select="$Object/FinishAddress"/>
                        </p>
                        <br/>
                        <br/>
                    </xsl:if>

                    <a name="Functions"/>
                    <xsl:call-template name="PrintFunctions">
                        <xsl:with-param name="Functions" select="$Object/Functions"/>
                    </xsl:call-template>
                    <br/>

                    <xsl:if test="$Object/LinearObjectNote">
                        <xsl:apply-templates select="$Object/LinearObjectNote"/>
                    </xsl:if>

                    <xsl:if test="$Object/FunctionsFeatures">
                        <a name="FunctionsFeatures"/>
                        <p class="title">Сведения о принадлежности к объектам транспортной инфраструктуры и к другим объектам, функционально-технологические особенности которых влияют на их безопасность</p>

                        <xsl:apply-templates select="$Object/FunctionsFeatures"/>
                    </xsl:if>

                    <xsl:if test="$Object/PowerIndicator">
                        <a name="PowerIndicator"/>
                        <p class="title">Сведения о проектной мощности объекта капитального стрительства</p>
                        <table style="border-style: solid; border-width:1px; border-collapse: collapse; align: center;">
                            <tr>
                                <td style="width: 50%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;">Наименование показателя мощности</td>
                                <td style="width: 25%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;">Значение </td>
                            </tr>
                            <xsl:apply-templates select="$Object/PowerIndicator"/>
                        </table>
                        <br/>
                        <br/>
                    </xsl:if>

                    <xsl:if test="$Object/TEI">
                        <a name="TEI"/>
                        <p class="title">Технико-экономические показатели объекта капитального строительства</p>
                        <table style="border-style: solid; border-width:1px; border-collapse: collapse; align: center;">
                            <tr>
                                <td style="width: 50%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;">Наименование технико-экономического показателя</td>
                                <td style="width: 25%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;">Значение </td>
                            </tr>
                            <xsl:apply-templates select="$Object/TEI"/>
                        </table>
                        <br/>
                    </xsl:if>

                    <xsl:if test="$Object/EnergyEfficiency">
                        <a name="EnergyEfficiency"/>
                        <p class="title">Сведения о классе энергетической эффективности  и о повышении энергетической эффективности</p>
                        <p>Класс энергоэффективности: <xsl:value-of select="$Object/EnergyEfficiency/EnergyEfficiencyClass"/></p>
                        <br/>
                        <xsl:if test="$Object/EnergyEfficiency/EnergyEfficiencyImproving">
                            <xsl:apply-templates select="$Object/FunctionsFeatures/EnergyEfficiencyImproving"/>
                        </xsl:if>
                    </xsl:if>

                    <xsl:if test="$Object/DangerousIndustrialObject">
                        <a name="DangerousIndustrialObject"/>
                        <p class="title">Сведения о принадлежности к опасным производственным объектам</p>
                        <p>Класс опасности производственного объекта: <xsl:value-of select="$Object/DangerousIndustrialObject"/></p>
                    </xsl:if>
                    
                    <xsl:if test="$Object/LinearObjectCategory">
                        <a name="LinearObjectCategory"/>
                        <p class="title">Сведения о категории линейного объекта</p>
                        <xsl:apply-templates select="$Object/LinearObjectCategory"/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/LinearObjectClass">
                        <a name="LinearObjectClass"/>
                        <p class="title">Сведения о классе линейного объекта</p>
                        <xsl:apply-templates select="$Object/LinearObjectClass"/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/FireDangerCategory">
                        <a name="FireDangerCategory"/>
                        <p class="title">Сведения о пожарной и взрывопожарной опасности</p>
                        <p>Класс взрывопожарной опасности: <xsl:value-of select="$Object/FireDangerCategory"/></p>
                        <br/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/PeoplePermanentStay">
                        <a name="PeoplePermanentStay"/>
                        <p class="title">Сведения о наличии помещений с постоянным пребыванием людей</p>
                        <xsl:apply-templates select="$Object/PeoplePermanentStay"/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/ResponsibilityLevel">
                        <a name="ResponsibilityLevel"/>
                        <p class="title">Сведения об уровне ответственности</p>
                        <p>Уровень ответсвенности: <xsl:value-of select="$Object/ResponsibilityLevel"/></p>
                        <br/>                        
                    </xsl:if>

                    <xsl:if test="$Object/ObjectParts">
                        <a name="Parts"/>
                        <p class="title">В состав объекта входят следующие объекты капитального строительства:</p>
                        <xsl:apply-templates select="$Object/ObjectParts">
                            <xsl:with-param name="level" select="1."/>
                        </xsl:apply-templates>
                    </xsl:if>
                    
                    <xsl:if test="$Object/Routes">
                        <a name="Routes"/>
                        <xsl:if test="$Object/Routes/RoutesNote">
                            <p class="title">Описание вариантов маршрутов прохождения линейного объекта по территории района строительства, обоснование выбранного варианта трассы</p>
                            <xsl:apply-templates select="$Object/Routes/RoutesNote"/>
                        </xsl:if>
                        
                        <xsl:for-each select="$Object/Routes/Route">
                            <p class="subtitle">
                                <xsl:value-of select="Name"/>
                            </p>
                            <xsl:apply-templates select="Note"/>
                        </xsl:for-each>
                    </xsl:if>
                    
                    <xsl:if test="$Object/Resources">
                        <a name="Resources"/>
                            <p class="title">Cведения о потребности объекта капитального строительства в топливе, газе, воде и электрической энергии</p>
                        <xsl:apply-templates select="$Object/Resources/Note"/>
                            <table>
                                <tr>
                                    <td style="width: 10%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;"> № п/п </td>
                                    <td style="width: 65%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;"> Наименование ресурса (единица измерения) </td>
                                    <td style="width: 25%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;"> Требуемый объем </td>
                                </tr>
                                
                                <xsl:for-each select="//Resources/Resource">
                                    <tr>
                                        <td>
                                            <xsl:number value="position()" format="1. "/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Name"/> (<xsl:value-of select="Measure"/>) </td>
                                        <td>
                                            <xsl:value-of select="Value"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                            <br/>
                            <br/>
                        
                    </xsl:if>
                    
                    <xsl:if test="$Object/RawResources">
                        <a name="RawResources"/>
                        <p class="title">Сведения о сырьевой базе, потребности производства в воде, топливно-энергетических ресурсах</p>
                        
                        <xsl:apply-templates select="$Object/RawResources/Note"/>
                        
                        <table>
                            <tr>
                                <td style="width: 10%;" class="title">№ п/п</td>
                                <td style="width: 65%;" class="title">Наименование сырья, ресурса (единица измерения)</td>
                                <td style="width: 25%;" class="title">Требуемый объем</td>
                            </tr>
                            <xsl:for-each select="$Object/RawResources/Resource">
                                <tr>
                                    <td>
                                        <xsl:number value="position()" format="1. "/>
                                    </td>
                                    <td>
                                        <xsl:value-of select="Name"/> (<xsl:value-of select="Measure"/>) </td>
                                    <td>
                                        <xsl:value-of select="Value"/>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:if>
                    
                    <xsl:if test="$Object/ResourceUseInfo">
                        <a name="ResourceUseInfo"/>
                        <p class="title">Сведения о комплексном использовании сырья, вторичных энергоресурсов, отходов производства</p>
                        <p>
                            <xsl:apply-templates select="$Object//ResourceUseInfo"/>
                        </p>
                    </xsl:if>
                    
                    <xsl:if test="$Object//RenewableSourceInfo">
                        <a name="RenewableSourceInfo"/>
                        <p class="title">Сведения об использовании возобновляемых источников энергии и вторичных энергетических ресурсов</p>
                        <p>
                            <xsl:apply-templates select="$Object//RenewableSourceInfo"/>
                        </p>
                    </xsl:if>

                    <xsl:if test="$Object/LandCategory">
                        <a name="LandCategory"/>
                        <p class="title">Сведения о категории земель, на которых планируется разместить (размещен) объект капитального строительства</p>
                        <xsl:call-template name="MakeLandCategory">
                            <xsl:with-param name="Code" select="$Object/LandCategory"/>
                        </xsl:call-template>
                    </xsl:if>
  

                    <xsl:if test="$Object/LandInfo">
                        <a name="LandInfo"/>
                        <p class="title">Сведения о земельных участках, изымаемых для государственных или муниципальных нужд, о земельных участках, в отношении которых устанавливается сервитут, публичный сервитут и (или) заключается договор аренды (субаренды)</p>

                        <xsl:apply-templates select="$Object/LandInfo/CommonLandInfo"/>
                        <xsl:if test="$Object/LandInfo/LandAreaInfo">
                            <table>
                                <tr>
                                    <td style="width: 30%;">
                                        <p class="center field">Кадастровый номер земельного участка (категория земель)</p>
                                    </td>
                                    <td style="width: 70%;">
                                        <p class="center field">Описание участка</p>
                                    </td>
                                </tr>

                                <xsl:for-each select="$Object/LandInfo/LandAreaInfo">
                                    <tr>
                                        <td>
                                            <xsl:value-of select="CadastralNumber"/><br/> (Категория земель - <xsl:call-template name="MakeLandCategory"><xsl:with-param name="Code" select="LandCategory"/></xsl:call-template>) </td>
                                        <td>
                                            <xsl:value-of select="UsingNote"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                            <br/><br/>
                        </xsl:if>
                    </xsl:if>

                    <xsl:if test="$Object/LandFunds">
                        <a name="LandFunds"/>
                        <p class="title">Cведения о размере средств, требующихся для возмещения убытков правообладателям земельных участков и (или) для внесения в качестве арендной платы, платы за сервитут, публичный сервитут и (или) для выкупа земельных участков</p>
                        <xsl:apply-templates select="$Object/LandFunds"/>
                    </xsl:if>

                    <xsl:if test="$Object/PatentsUsed">
                        <a name="PatentsUsed"/>
                        <p class="title">Сведения об использованных в проекте изобретениях, результатах проведенных патентных исследований</p>
                        <xsl:apply-templates select="$Object/PatentsUsed"/>
                        <br/>
                    </xsl:if> 
                    
                    <xsl:if test="ProjectInitialDocuments/Document[DocType = '19.01' or DocType = '19.02'] or SpecialRequirements">
                        <a name="SpecialRequirements"/>
                        <p class="title">Сведения о наличии разработанных и согласованных специальных технических условий</p>
                        <xsl:if test="$Object/SpecialRequirements">
                            <xsl:apply-templates select="$Object/SpecialRequirements"/>
                        </xsl:if>

                        <xsl:if test="ProjectInitialDocuments/Document[DocType = '19.01' or DocType = '19.02']">
                            <p class="title">Специальные технические условия</p>
                            <table>
                                <tr>
                                    <td style="width: 10%;"> № п/п </td>
                                    <td style="width: 50%;"> Наименование и реквизиты документа </td>
                                </tr>
                                <xsl:for-each select="ProjectInitialDocuments/Document[DocType &gt; '19.00' and DocType &lt; '20.00']">
                                    <xsl:sort select="DocType"/>
                                    <tr>
                                        <td>
                                            <xsl:number value="position()" format="1. "/>
                                        </td>
                                        <td>
                                            <xsl:apply-templates select="."/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                            <br/>
                        </xsl:if>

                    </xsl:if>
                    
                    <xsl:if test="$Object/StaffNote">
                        <a name="StaffNote"/>
                        <p class="title">Данные о численности работников на объекте капитального строительства и их профессионально-квалификационном составе, числе рабочих мест и другие данные, установленные заданием на проектирование и характеризующие объект капитального строительства</p>
                        <xsl:apply-templates select="$Object/StaffNote"/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/SoftwareUsed">
                        <a name="SoftwareUsed"/>
                        <p class="title">Сведения о компьютерных программах, которые использовались выполнении расчетов конструктивных элементов зданий, строений и сооружений</p>
                        <xsl:apply-templates select="$Object/SoftwareUsed/SoftwareNote"/>
                        <xsl:if test="$Object/SoftwareUsed/Software">
                            <table>
                                <tr>
                                    <td class="title" style="width: 10%;">№ п/п</td>
                                    <td class="title" style="width: 40%;">Наименование программного обеспечения (версия)</td>
                                    <td class="title" style="width: 50%;">Сведения при подготовки какой части проектной документации использовался программный продукт</td>
                                </tr>

                                <xsl:for-each select="$Object/SoftwareUsed/Software">
                                    <tr>
                                        <td>
                                            <xsl:number value="position()" format="1. "/>
                                        </td>
                                        <td>
                                            <xsl:value-of select="Name"/>
                                            <xsl:if test="Version"> (версия <xsl:value-of select="Version"/>)</xsl:if>
                                        </td>
                                        <td>
                                            <xsl:value-of select="UsingNote"/>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>
                        </xsl:if>
                        <br/>
                    </xsl:if>

                    <xsl:if test="$Object/StagesInfo">
                        <a name="StagesInfo"/>
                        <xsl:if test="LinearObject">
                            <p class="title">Описание принципиальных проектных решений, обеспечивающих надежность линейного объекта, последовательность его строительства, намечаемые этапы строительства и планируемые сроки ввода их в эксплуатацию</p>
                        </xsl:if>
                        <xsl:if test="not(LinearObject)">
                            <p class="title">Сведения об этапах строительства объекта капитального строительства (обоснование возможности осуществления строительства по этапам)</p>
                        </xsl:if>
                        <xsl:apply-templates select="$Object/StagesInfo/ReasonNote"/>
                        <xsl:if test="$Object/StagesInfo/Stage">
                            <xsl:for-each select="$Object/StagesInfo/Stage">
                                <p class="subtitle no-first-line">
                                    <xsl:value-of select="Number"/>
                                </p>
                                <xsl:if test="BeginDate">
                                    <p class="no-first-line">Дата начала: <xsl:call-template name="formatdate"><xsl:with-param name="DateTimeStr" select="BeginDate"/></xsl:call-template></p>
                                </xsl:if>
                                <xsl:if test="EndDate">
                                    <p class="no-first-line">Дата окончания: <xsl:call-template name="formatdate"><xsl:with-param name="DateTimeStr" select="EndDate"/></xsl:call-template></p>
                                </xsl:if>
                                <xsl:if test="OperationDate">
                                    <p class="no-first-line">Дата ввода в эксплуатацию: <xsl:call-template name="formatdate"><xsl:with-param name="DateTimeStr" select="OperationDate"/></xsl:call-template></p>
                                </xsl:if>
                                <xsl:apply-templates select="Note"/>
                            </xsl:for-each>
                        </xsl:if>
                    </xsl:if>
                    
                    <xsl:if test="$Object/DestroyFunds">
                        <a name="DestroyFunds"/>
                        <p class="title">Сведения о предполагаемых затратах, связанных со сносом зданий и сооружений, переселением людей, переносом сетей инженерно-технического обеспечения</p>
                        <xsl:apply-templates select="$Object/DestroyFunds"/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/EnergyEfficiencyLinks">
                        <a name="EnergyEfficiencyLinks"/>
                        <p class="title">Сведения о разделах и пунктах проектной документации, содержащих решения и мероприятия по обеспечению соблюдения требований энергетической эффективности и оснащенности зданий, строений, сооружений приборами учета используемых энергетических ресурсов</p>
                        <xsl:for-each select="$Object/EnergyEfficiencyLinks/ProjectDocumentationLink">
                            <xsl:variable name="Num" select="DocNumber"/>
                            <p><xsl:number value="position()" format="1. "/><xsl:text> </xsl:text><xsl:value-of select="DocSectionLink"/><xsl:text>, </xsl:text><xsl:value-of select="$Object/ProjectDocumentation//Document[DocNumber=$Num]/DocNumber"/><xsl:text> </xsl:text><xsl:value-of select="$Object/ProjectDocumentation//Document[DocNumber=$Num]/DocName"/></p>
                        </xsl:for-each>
                        <br/>
                        <br/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/IndustrialSafetyLinks">
                        <a name="IndustrialSafetyLinks"/>
                        <p class="title">Сведения о разделах и пунктах проектной документации, содержащих решения и мероприятия по обеспечению соблюдения требований промышленной безопасности</p>
                        <xsl:for-each select="$Object/IndustrialSafetyLinks/ProjectDocumentationLink">
                            <xsl:variable name="Num" select="DocNumber"/>
                            <p><xsl:number value="position()" format="1. "/><xsl:text> </xsl:text><xsl:value-of select="DocSectionLink"/><xsl:text>, </xsl:text><xsl:value-of select="$Object/ProjectDocumentation//Document[DocNumber=$Num]/DocNumber"/><xsl:text> </xsl:text><xsl:value-of select="$Object/ProjectDocumentation//Document[DocNumber=$Num]/DocName"/></p>
                        </xsl:for-each>
                        <br/>
                        <br/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/LandReclamationLink">
                        <a name="LandReclamationLink"/>
                        <p class="title">Сведения о наличии проекта рекультивации земель</p>
                        <xsl:apply-templates select="$Object/LandReclamationLink"/>
                    </xsl:if>
                    
                    <xsl:if test="$Object/NuclearPlantFeatures">
                        <a name="NuclearPlantFeaturesObjectList"/>
                        <p class="title">Список объектов производственного и непроизводственного назначения, входящих в состав проектируемой атомной станции</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/ObjectList"/>
                        
                        <a name="NuclearPlantFeaturesNuclearSafety"/>
                        <p class="title">Общие сведения о требованиях к системам, обеспечивающим ядерную и радиационную безопасность атомной станции</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/NuclearSafety"/>
      
                        <a name="NuclearPlantFeaturesOperationalLimits"/>
                        <p class="title">Исходные данные, пределы безопасной эксплуатации и эксплуатационные пределы оборудования и систем</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/OperationalLimits"/>
 
                        <a name="NuclearPlantFeaturesNuclearPlantControl"/>
                        <p class="title">Сведения об организации управления атомной станцией, ее эксплуатационном, ремонтном, техническом обслуживании, штатном расписании, требованиях к персоналу и условиях труда работников</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/NuclearPlantControl"/>

                        <a name="NuclearPlantFeaturesReactorPlant"/>
                        <p class="title">Основные сведения о реакторной установке, применяемой на атомной станции, об исходных технических требованиях на оборудование, применяемое на атомной станции, об основном и вспомогательном оборудовании основных технологических контуров атомной станции</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/ReactorPlant"/>

                        <a name="NuclearPlantFeaturesNuclearSafitySoftware"/>
                        <p class="title">Сведения о компьютерных программах, которые использовались для анализов безопасности атомной станции, об аттестации и верификации применяемых компьютерных программ, о системах сертификации, стандартизации и метрологическом обеспечении, о разработке
                            программы обеспечения качества, отчета по обоснованию безопасности и вероятностных анализов безопасности атомной станции первого и второго уровней, о стационарной системе непрерывного мониторинга технического состояния объекта капитального строительства</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/NuclearSafitySoftware"/>
                        
                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms1"/>
                        <p class="title">Сведения о программах мониторинга</p>
                        <p class="subtitle">Геотехнический мониторинг, включая мониторинг кренов и осадок:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/GeotechnicalMonitoring"/>
 
                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms2"/>
                        <p class="subtitle">Гидрогеологический мониторинг:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/HydrogeologicalMonitoring"/>
 
                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms3"/>
                        <p class="subtitle">Сейсмологический мониторинг:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/SeismologicalMonitoring"/>
 
                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms4"/>
                        <p class="subtitle">Метеорологический мониторинг:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/MeteorologicalMonitoring"/>
 
                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms5"/>
                        <p class="subtitle">Аэрологический мониторинг:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/AerologicalMonitoring"/>

                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms6"/>
                        <p class="subtitle">Гидрологический мониторинг:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/HydrologicalMonitoring"/>

                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms7"/>
                        <p class="subtitle">Геодинамический мониторинг:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/GeodynamicalMonitoring"/>

                        <a name="NuclearPlantFeaturesNuclearMonitoringPrograms8"/>
                        <p class="subtitle">Периодический контроль параметров внешних техногенных воздействий:</p>
                        <xsl:apply-templates select="$Object/NuclearPlantFeatures/MonitoringPrograms/TechnogenicMonitoring"/>
                    </xsl:if>

                    <xsl:if test="$Object/GasNetworksFeatures">
                        <a name="GasNetworksFeaturesStrengthCalculation"/>
                        <p class="title">Расчет трубопроводов на прочность и устойчивость</p>
                        <xsl:apply-templates select="$Object/GasNetworksFeatures/StrengthCalculation"/>

                        <a name="GasNetworksFeaturesEnvironmentalProtection"/>
                        <p class="title">Перечень мероприятий по охране окружающей среды, включающий мероприятия по предотвращению и (или) снижению возможного негативного воздействия на окружающую среду при эксплуатации линейного объекта и рациональному использованию природных ресурсов на период строительства и эксплуатации линейного объекта</p>
                        <xsl:apply-templates select="$Object/GasNetworksFeatures/EnvironmentalProtection"/>

                        <a name="GasNetworksFeaturesFireSafety"/>
                        <p class="title">Перечень мероприятий по обеспечению пожарной безопасности</p>
                        <xsl:apply-templates select="$Object/GasNetworksFeatures/FireSafety"/>

                        <a name="GasNetworksFeaturesOperationalSafety"/>
                        <p class="title">Перечень мероприятий по безопасной эксплуатации линейного объекта</p>
                        <xsl:apply-templates select="$Object/GasNetworksFeatures/OperationalSafety"/>

                        <a name="GasNetworksFeaturesPerairFrequency"/>
                        <p class="title">Нормативная периодичность выполнения работ по капитальному ремонту линейного объекта</p>
                        <xsl:apply-templates select="$Object/GasNetworksFeatures/PerairFrequency"/>

                    </xsl:if>
                    
                    <xsl:if test="$Object/EngineeringTerritoryProtection">
                        <a name="EngineeringTerritoryProtection"/>
                        <p class="title">Описание принципиальных проектных решений по инженерной защите территории при строительстве, реконструкции автомобильных дорог</p>
                        <xsl:apply-templates select="$Object/EngineeringTerritoryProtection"/>
                    </xsl:if>

                    <xsl:if test="DesignerNote">
                        <xsl:for-each select="DesignerNote">
                            <a>
                                <xsl:attribute name="name">Note<xsl:value-of select="position()"/></xsl:attribute>
                            </a>
                            <xsl:apply-templates select="."/>
                        </xsl:for-each>
                    </xsl:if>

                    <xsl:if test="DesignerAssurance">
                        <a name="DesignerAssurance"/>
                        <xsl:apply-templates select="DesignerAssurance/Assurance"/>
                        <table>
                            <xsl:for-each select="DesignerAssurance/Signer">
                                <tr>
                                    <td class="noborder">
                                        <p class="left">
                                            <xsl:value-of select="./Position"/>
                                        </p>
                                    </td>
                                    <td class="noborder">
                                        <p class="right">
                                            <xsl:value-of select="./FamilyName"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="./FirstName"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="./SecondName"/>
                                        </p>
                                    </td>
                                </tr>
                            </xsl:for-each>
                        </table>
                    </xsl:if>


                </div>
            </body>
        </html>

    </xsl:template>

    <!-- Конец основного шаблона -->


    <!-- Вывод сведений о документе и его авторе -->
    <xsl:template match="Document">
        <xsl:value-of select="DocName"/>
        <xsl:choose>
            <xsl:when test="DocChanges != ''"> (<xsl:value-of select="DocChanges"/>) </xsl:when>
        </xsl:choose>
        <xsl:if test="DocDate">
            <xsl:if test="DocDate != ''">
                <xsl:text> от </xsl:text>
                <xsl:call-template name="formatdate">
                    <xsl:with-param name="DateTimeStr" select="DocDate"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
        <xsl:if test="DocNumber">
            <xsl:if test="DocNumber != ''">
                <xsl:text> № </xsl:text>
                <xsl:value-of select="DocNumber"/>
            </xsl:if>
        </xsl:if>
        <xsl:if test="DocIssueAuthor">
            <xsl:if test="DocIssueAuthor != ''">, <xsl:value-of select="DocIssueAuthor"/>
            </xsl:if>
        </xsl:if>

        <xsl:if test="FullDocIssueAuthor">
            <xsl:if test="FullDocIssueAuthor != ''"><br/>Подготовлен:<br/>
                <xsl:apply-templates select="FullDocIssueAuthor/Organization"/>
                <xsl:apply-templates select="FullDocIssueAuthor/ForeignOrganization"/>
                <xsl:if test="FullDocIssueAuthor/IP">
                    <xsl:value-of select="FullDocIssueAuthor/IP/FamilyName"/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[ ]]></xsl:text>
                    <xsl:value-of select="FullDocIssueAuthor/IP/FirstName"/>
                    <xsl:text disable-output-escaping="yes"><![CDATA[ ]]></xsl:text>
                    <xsl:value-of select="FullDocIssueAuthor/IP/SecondName"/>
                </xsl:if>
                <br/>
                <xsl:if test="FullDocIssueAuthor/SROMembership">
                    <xsl:apply-templates select="FullDocIssueAuthor/SROMembership"/>
                </xsl:if>
            </xsl:if>
            
        </xsl:if>
    </xsl:template>

    <xsl:template name="TableDocument">
        <xsl:variable name="FileNumber" select="count(File) + count(File/SignFile)"/>
        <xsl:variable name="Pos" select="position()"/>
        <xsl:for-each select="File">
            <tr>
                <xsl:if test="position() = 1">
                    <td>
                        <xsl:if test="$FileNumber != 1">
                            <xsl:attribute name="rowspan">
                                <xsl:value-of select="$FileNumber"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="$Pos"/>
                    </td>
                </xsl:if>
                <td>
                    <xsl:value-of select="FileName"/>
                </td>
                <td>
                    <xsl:value-of select="FileFormat"/>
                </td>
                <td class="center">
                    <xsl:value-of select="FileChecksum"/>
                </td>
                <xsl:if test="position() = 1">
                    <td>
                        <xsl:if test="$FileNumber != 1">
                            <xsl:attribute name="rowspan"><xsl:value-of select="$FileNumber"/></xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="../DocNumber"/> от <xsl:call-template name="formatdate">
                            <xsl:with-param name="DateTimeStr" select="../DocDate"/>
                        </xsl:call-template><br/>
                        <xsl:value-of select="../DocName"/>
                    </td>
                </xsl:if>
            </tr>
            <xsl:for-each select="SignFile">
                <tr>
                    <td style="font-style: italic;">
                        <xsl:value-of select="FileName"/>
                    </td>
                    <td style="font-style: italic;">
                        <xsl:value-of select="FileFormat"/>
                    </td>
                    <td class="center" style="font-style: italic;">
                        <xsl:value-of select="FileChecksum"/>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="Address">

        <!--  Если в адресе есть неформализованное описание адреса выводится оно, если нет, то формируется строка из составных частей -->
        <xsl:if test="position() != 1">; </xsl:if>
        <xsl:if test="Country">
            <xsl:value-of select="Country"/>
            <xsl:if test="Region != '00' or District or City or Settlement or Street or Building or Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="Region != '00'">
            <xsl:call-template name="MakeRegion">
                <xsl:with-param name="Code" select="Region"/>
            </xsl:call-template>
            <xsl:if test="District or City or Settlement or Street or Building or Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="District">
            <xsl:value-of select="District"/>
            <xsl:if test="City or Settlement or Street or Building or Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="City">
            <xsl:value-of select="City"/>
            <xsl:if test="Settlement or Street or Building or Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="Settlement">
            <xsl:value-of select="Settlement"/>
            <xsl:if test="Street or Building or Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="Street">
            <xsl:value-of select="Street"/>
            <xsl:if test="Building or Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="Building">
            <xsl:value-of select="Building"/>
            <xsl:if test="Room or Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="Room">
            <xsl:value-of select="Room"/>
            <xsl:if test="Note">, </xsl:if>
        </xsl:if>
        <xsl:if test="Note">
            <xsl:value-of select="Note"/>
        </xsl:if>

    </xsl:template>

    <!-- Вывод технико-экономическом показателе -->
    <xsl:template match="TEI | PowerIndicator | Resource">
        <tr>
            <td>
                <xsl:value-of select="Name"/>
            </td>
            <td class="center">
                <xsl:value-of select="Value"/>
                <xsl:if test="OldValue"><br/>Предыдущее значение: <xsl:value-of select="OldValue"/></xsl:if>
            </td>
        </tr>
    </xsl:template>

    <!-- Вывод сведений о юридическом лице -->
    <xsl:template match="Organization | ExpertOrganization">
        <span class="field">Наименование: </span>
        <xsl:value-of select="OrgFullName"/>
        <br/>
        <span class="field">ОГРН: </span>
        <xsl:value-of select="OrgOGRN"/>
        <br/>
        <span class="field">ИНН: </span>
        <xsl:value-of select="OrgINN"/>
        <br/>
        <span class="field">КПП: </span>
        <xsl:value-of select="OrgKPP"/>
        <br/>
        <xsl:if test="Email">
            <xsl:if test="Email != ''">
                <span class="field">Адрес электронной почты: </span>
                <xsl:value-of select="Email"/>
                <br/>
            </xsl:if>
        </xsl:if>
        <span class="field">Место нахождения и адрес: </span>
        <xsl:apply-templates select="Address"/>
    </xsl:template>

    <!-- Вывод сведений об иностранном юридическом лице -->
    <xsl:template match="ForeignOrganization">
        <span class="field">Наименование: </span>
        <xsl:value-of select="OrgFullName"/>
        <br/>
        <span class="field">ИНН: </span>
        <xsl:value-of select="OrgINN"/>
        <br/>
        <span class="field">КПП: </span>
        <xsl:value-of select="OrgKPP"/>
        <br/>
        <xsl:if test="Email">
            <xsl:if test="Email != ''">
                <span class="field">Адрес электронной почты: </span>
                <xsl:value-of select="Email"/>
                <br/>
            </xsl:if>
        </xsl:if>
        <span class="field">Адрес: </span>
        <xsl:if test="Address">
            <xsl:apply-templates select="Address"/>
        </xsl:if>

    </xsl:template>

    <!-- Вывод сведений об индивидуальном предпринимателе -->
    <xsl:template match="IP">
        <span class="field">Индивидуальный предприниматель: </span>
        <xsl:value-of select="FamilyName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="FirstName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="SecondName"/>
        <br/>
        <span class="field">ОГРНИП: </span>
        <xsl:value-of select="OGRNIP"/>
        <br/>
        <xsl:if test="Email">
            <xsl:if test="Email != ''">
                <span class="field">Адрес электронной почты: </span>
                <xsl:value-of select="Email"/>

                <br/>
            </xsl:if>
        </xsl:if>
        <span class="field">Адрес: </span>
        <xsl:apply-templates select="PostAddress"/>
    </xsl:template>

    <!-- Вывод сведений о физическом лице-->
    <xsl:template match="Person">
        <span class="field">ФИО: </span>
        <xsl:value-of select="FamilyName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="FirstName"/>
        <xsl:text> </xsl:text>
        <xsl:value-of select="SecondName"/>
        <br/>
        <span class="field">СНИЛС: </span>
        <xsl:value-of select="SNILS"/>
        <br/>
        <xsl:if test="Email">
            <xsl:if test="Email != ''">
                <span class="field">Адрес электронной почты: </span>
                <xsl:value-of select="Email"/>
                <br/>
            </xsl:if>
        </xsl:if>
        <span class="field">Адрес: </span>
        <xsl:apply-templates select="PostAddress"/>
    </xsl:template>

    <!-- Вывод наименования инженерных изысканий -->
    <xsl:template name="MakeRII">
        <xsl:param name="TypeCode"/>
        <xsl:if test="$TypeCode = '06.01' or $TypeCode = 1">Инженерно-геодезические изыскания</xsl:if>
        <xsl:if test="$TypeCode = '06.02' or $TypeCode = 2">Инженерно-геологические изыскания</xsl:if>
        <xsl:if test="$TypeCode = '06.03' or $TypeCode = 3">Инженерно-гидрометеоролические изыскания</xsl:if>
        <xsl:if test="$TypeCode = '06.04' or $TypeCode = 4">Инженерно-экологические изыскания</xsl:if>
        <xsl:if test="$TypeCode = '06.05' or $TypeCode = 5">Инженерно-геотехнические изыскания</xsl:if>
        <xsl:if test="$TypeCode = '06.06' or $TypeCode = 6">Геотехнические исследования</xsl:if>
        <xsl:if test="$TypeCode = '06.07' or $TypeCode = 7">Обследования состояния грунтов оснований зданий и сооружений, их строительных конструкций</xsl:if>
        <xsl:if test="$TypeCode = '06.08' or $TypeCode = 8">Поиск и разведка подземных вод для целей водоснабжения</xsl:if>
        <xsl:if test="$TypeCode = '06.09' or $TypeCode = 9">Локальный мониторинг компонентов окружающей среды</xsl:if>
        <xsl:if test="$TypeCode = '06.10' or $TypeCode = 10">Разведка грунтовых строительных материалов</xsl:if>
        <xsl:if test="$TypeCode = '06.11' or $TypeCode = 11">Локальные обследования загрязнения грунтов и грунтовых вод</xsl:if>
    </xsl:template>

    <!-- Вывод наименования разделов проектной документации -->
    <xsl:template name="MakeProjectSection">
        <xsl:param name="Code"/>
        <xsl:if test="$Code = '07.01'">Раздел 1. Пояснительная записка</xsl:if>
        <xsl:if test="$Code = '07.02'">Раздел 2. Схема планировочной организации земельного участка</xsl:if>
        <xsl:if test="$Code = '07.03'">Раздел 3. Архитектурные решения</xsl:if>
        <xsl:if test="$Code = '07.04'">Раздел 4. Конструктивные и объемно-планировочные решения</xsl:if>
        <xsl:if test="$Code = '07.05'">Система электроснабжения</xsl:if>
        <xsl:if test="$Code = '07.06'">Система водоснабжения</xsl:if>
        <xsl:if test="$Code = '07.07'">Система водоотведения</xsl:if>
        <xsl:if test="$Code = '07.08'">Отопление, вентиляция и кондиционирование воздуха, тепловые сети</xsl:if>
        <xsl:if test="$Code = '07.09'">Сети связи</xsl:if>
        <xsl:if test="$Code = '07.10'">Система газоснабжения</xsl:if>
        <xsl:if test="$Code = '07.12'">Раздел 6. Проект организации строительства</xsl:if>
        <xsl:if test="$Code = '07.13'">Раздел 7. Проект организации работ по сносу или демонтажу объектов капитального строительства</xsl:if>
        <xsl:if test="$Code = '07.14'">Раздел 8. Перечень мероприятий по охране окружающей среды</xsl:if>
        <xsl:if test="$Code = '07.15'">Раздел 9. Мероприятия по обеспечению пожарной безопасности</xsl:if>
        <xsl:if test="$Code = '07.16'">Раздел 10. Мероприятия по обеспечению доступа инвалидов</xsl:if>
        <xsl:if test="$Code = '07.17'">Раздел 10.1. Мероприятия по обеспечению соблюдения требований энергетической эффективности и требований оснащенности зданий, строений и сооружений приборами учета используемых энергетических ресурсов</xsl:if>
        <xsl:if test="$Code = '07.18'">Раздел 11. Смета на строительство объектов капитального строительства</xsl:if>
        <xsl:if test="$Code = '07.19'">Раздел 12. Иная документация в случаях, предусмотренных федеральными законами</xsl:if>
        <xsl:if test="$Code = '08.01'">Раздел 1. Пояснительная записка</xsl:if>
        <xsl:if test="$Code = '08.02'">Раздел 2. Проект полосы отвода</xsl:if>
        <xsl:if test="$Code = '08.03'">Раздел 3. Технологические и конструктивные решения линейного объекта. Искусственные сооружения.</xsl:if>
        <xsl:if test="$Code = '08.04'">Раздел 4. Здания, строения и сооружения, входящие в инфраструктуру линейного объекта.</xsl:if>
        <xsl:if test="$Code = '08.05'">Раздел 5. Проект организации строительства</xsl:if>
        <xsl:if test="$Code = '08.06'">Раздел 6. Проект организации работ по сносу (демонтажу) линейного объекта</xsl:if>
        <xsl:if test="$Code = '08.07'">Раздел 7. Мероприятия по охране окружающей среды</xsl:if>
        <xsl:if test="$Code = '08.08'">Раздел 8. Мероприятия по обеспечению пожарной безопасности</xsl:if>
        <xsl:if test="$Code = '08.09'">Раздел 9. Смета на строительство</xsl:if>
        <xsl:if test="$Code = '08.10'">Раздел 10. Иная документация в случаях, предусмотренных федеральными законами</xsl:if>
        <xsl:if test="$Code = '13.01'">Проект организации работ по сносу объекта капитального строительства</xsl:if>
        <xsl:if test="$Code = '13.02'">Смета на снос объекта капитального строительства</xsl:if>
    </xsl:template>


    <!-- Вывод даты в формате ДД.ММ.ГГГГ-->
    <xsl:template name="formatdate">
        <xsl:param name="DateTimeStr"/>

        <xsl:if test="$DateTimeStr != ''">
            <xsl:variable name="mm">
                <xsl:value-of select="substring($DateTimeStr, 9, 2)"/>
            </xsl:variable>

            <xsl:variable name="dd">
                <xsl:value-of select="substring($DateTimeStr, 6, 2)"/>
            </xsl:variable>

            <xsl:variable name="yyyy">
                <xsl:value-of select="substring($DateTimeStr, 1, 4)"/>
            </xsl:variable>

            <xsl:value-of select="concat($mm, '.', $dd, '.', $yyyy)"/>
        </xsl:if>
    </xsl:template>

    <!-- Вывод заголовка экспертизы -->
    <xsl:template name="MakeTitle">
        <xsl:param name="Result"/>
        <xsl:param name="Form"/>
        <xsl:param name="Stage"/>
        <xsl:choose>
            <xsl:when test="$Result = 1"> Положительное </xsl:when>
            <xsl:when test="$Result = 2"> Отрицательное </xsl:when>
        </xsl:choose> заключение <xsl:choose>
            <xsl:when test="$Stage = 2"> повторной </xsl:when>
        </xsl:choose>
        <xsl:choose>
            <xsl:when test="$Form = 1"> государственной </xsl:when>
            <xsl:when test="$Form = 2"> негосударственной </xsl:when>
        </xsl:choose> экспертизы <xsl:choose>
            <xsl:when test="$Stage = 3">
                <br/>по результатам экспертного сопровождения </xsl:when>
        </xsl:choose>
    </xsl:template>


    <!-- Вывод наименования субъекта Российской Федерации -->
    <xsl:template name="MakeRegion">
        <xsl:param name="Code"/>

        <xsl:choose>
            <xsl:when test="$Code = 1">Республика Адыгея (Адыгея)</xsl:when>
            <xsl:when test="$Code = 2">Республика Башкортостан</xsl:when>
            <xsl:when test="$Code = 3">Республика Бурятия</xsl:when>
            <xsl:when test="$Code = 4">Республика Алтай</xsl:when>
            <xsl:when test="$Code = 5">Республика Дагестан</xsl:when>
            <xsl:when test="$Code = 6">Республика Ингушетия</xsl:when>
            <xsl:when test="$Code = 7">Кабардино-Балкарская Республика</xsl:when>
            <xsl:when test="$Code = 8">Республика Калмыкия</xsl:when>
            <xsl:when test="$Code = 9">Карачаево-Черкесская Республика</xsl:when>
            <xsl:when test="$Code = 10">Республика Карелия</xsl:when>
            <xsl:when test="$Code = 11">Республика Коми</xsl:when>
            <xsl:when test="$Code = 11">Республика Марий Эл</xsl:when>
            <xsl:when test="$Code = 13">Республика Мордовия</xsl:when>
            <xsl:when test="$Code = 14">Республика Саха (Якутия)</xsl:when>
            <xsl:when test="$Code = 15">Республика Северная Осетия-Алания</xsl:when>
            <xsl:when test="$Code = 16">Республика Татарстан (Татарстан)</xsl:when>
            <xsl:when test="$Code = 17">Республика Тыва</xsl:when>
            <xsl:when test="$Code = 18">Удмуртская Республика</xsl:when>
            <xsl:when test="$Code = 19">Республика Хакасия</xsl:when>
            <xsl:when test="$Code = 20">Чеченская Республика</xsl:when>
            <xsl:when test="$Code = 21">Чувашская Республика-Чувашия</xsl:when>
            <xsl:when test="$Code = 22">Алтайский край</xsl:when>
            <xsl:when test="$Code = 23">Краснодарский край</xsl:when>
            <xsl:when test="$Code = 24">Красноярский край</xsl:when>
            <xsl:when test="$Code = 25">Приморский край</xsl:when>
            <xsl:when test="$Code = 26">Ставропольский край</xsl:when>
            <xsl:when test="$Code = 27">Хабаровский край</xsl:when>
            <xsl:when test="$Code = 28">Амурская область</xsl:when>
            <xsl:when test="$Code = 29">Архангельская область</xsl:when>
            <xsl:when test="$Code = 30">Астраханская область</xsl:when>
            <xsl:when test="$Code = 31">Белгородская область</xsl:when>
            <xsl:when test="$Code = 32">Брянская область</xsl:when>
            <xsl:when test="$Code = 33">Владимирская область</xsl:when>
            <xsl:when test="$Code = 34">Волгоградская область</xsl:when>
            <xsl:when test="$Code = 35">Вологодская область</xsl:when>
            <xsl:when test="$Code = 36">Воронежская область</xsl:when>
            <xsl:when test="$Code = 37">Ивановская область</xsl:when>
            <xsl:when test="$Code = 38">Иркутская область</xsl:when>
            <xsl:when test="$Code = 39">Калининградская область</xsl:when>
            <xsl:when test="$Code = 40">Калужская область</xsl:when>
            <xsl:when test="$Code = 41">Камчатский край</xsl:when>
            <xsl:when test="$Code = 42">Кемеровская область - Кузбасс</xsl:when>
            <xsl:when test="$Code = 43">Кировская область</xsl:when>
            <xsl:when test="$Code = 44">Костромская область</xsl:when>
            <xsl:when test="$Code = 45">Курганская область</xsl:when>
            <xsl:when test="$Code = 46">Курская область</xsl:when>
            <xsl:when test="$Code = 47">Ленинградская область</xsl:when>
            <xsl:when test="$Code = 48">Липецкая область</xsl:when>
            <xsl:when test="$Code = 49">Магаданская область</xsl:when>
            <xsl:when test="$Code = 50">Московская область</xsl:when>
            <xsl:when test="$Code = 51">Мурманская область</xsl:when>
            <xsl:when test="$Code = 52">Нижегородская область</xsl:when>
            <xsl:when test="$Code = 53">Новгородская область</xsl:when>
            <xsl:when test="$Code = 54">Новосибирская область</xsl:when>
            <xsl:when test="$Code = 55">Омская область</xsl:when>
            <xsl:when test="$Code = 56">Оренбургская область</xsl:when>
            <xsl:when test="$Code = 57">Орловская область</xsl:when>
            <xsl:when test="$Code = 58">Пензенская область</xsl:when>
            <xsl:when test="$Code = 59">Пермский край</xsl:when>
            <xsl:when test="$Code = 60">Псковская область</xsl:when>
            <xsl:when test="$Code = 61">Ростовская область</xsl:when>
            <xsl:when test="$Code = 62">Рязанская область</xsl:when>
            <xsl:when test="$Code = 63">Самарская область</xsl:when>
            <xsl:when test="$Code = 64">Саратовская область</xsl:when>
            <xsl:when test="$Code = 65">Сахалинская область</xsl:when>
            <xsl:when test="$Code = 66">Свердловская область</xsl:when>
            <xsl:when test="$Code = 67">Смоленская область</xsl:when>
            <xsl:when test="$Code = 68">Тамбовская область</xsl:when>
            <xsl:when test="$Code = 69">Тверская область</xsl:when>
            <xsl:when test="$Code = 70">Томская область</xsl:when>
            <xsl:when test="$Code = 71">Тульская область</xsl:when>
            <xsl:when test="$Code = 72">Тюменская область</xsl:when>
            <xsl:when test="$Code = 73">Ульяновская область</xsl:when>
            <xsl:when test="$Code = 74">Челябинская область</xsl:when>
            <xsl:when test="$Code = 75">Забайкальский край</xsl:when>
            <xsl:when test="$Code = 76">Ярославская область</xsl:when>
            <xsl:when test="$Code = 77">Москва</xsl:when>
            <xsl:when test="$Code = 78">Санкт-Петербург</xsl:when>
            <xsl:when test="$Code = 79">Еврейская автономная область</xsl:when>
            <xsl:when test="$Code = 83">Ненецкий автономный округ</xsl:when>
            <xsl:when test="$Code = 86">Ханты-Мансийский автономный округ - Югра</xsl:when>
            <xsl:when test="$Code = 87">Чукотский автономный округ</xsl:when>
            <xsl:when test="$Code = 89">Ямало-Ненецкий автономный округ</xsl:when>
            <xsl:when test="$Code = 91">Республика Крым</xsl:when>
            <xsl:when test="$Code = 92">Севастополь</xsl:when>
        </xsl:choose>
    </xsl:template>
 
    <!-- Вывод вида работ -->
    <xsl:template name="MakeWorkType">
        <xsl:param name="Code"/>
        <xsl:choose>
            <xsl:when test="$Code = 1">Строительство</xsl:when>
            <xsl:when test="$Code = 2">Реконструкция</xsl:when>
            <xsl:when test="$Code = 3">Капитальный ремонт</xsl:when>
            <xsl:when test="$Code = 4">Снос объекта капитального строительства</xsl:when>
            <xsl:when test="$Code = 5">Сохранение объекта культурного наследия</xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Вывод предмета экспертизы -->
    <xsl:template name="MakeExaminationType">
        <xsl:param name="Code"/>
        <xsl:choose>
            <xsl:when test="$Code = 1">оценка соответствия результатов инженерных изысканий требованиям технических регламентов</xsl:when>
            <xsl:when test="$Code = 2">оценка соответствия проектной документации установленным требованиям</xsl:when>
            <xsl:when test="$Code = 3">проверка достоверности определения сметной стоимости</xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Вывод объекта экспертизы -->
    <xsl:template name="MakeObjectType">
        <xsl:param name="Code"/>
        <xsl:choose>
            <xsl:when test="$Code = 1">результаты инженерных изысканий</xsl:when>
            <xsl:when test="$Code = 2">проектная документация</xsl:when>
            <xsl:when test="$Code = 3">проектная документация и результаты инженерных изысканий</xsl:when>
        </xsl:choose>
    </xsl:template>

    <!-- Вывод текстов по абзацам -->
    <xsl:template name="StringReplace">
        <xsl:param name="input"/>
        <xsl:choose>
            <xsl:when test="contains($input, '&#xA;')">
                <p>
                    <xsl:value-of select="substring-before($input, '&#xA;')"/>
                </p>
                <xsl:call-template name="StringReplace">
                    <xsl:with-param name="input" select="substring-after($input, '&#xA;')"/>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:value-of select="$input"/>
                </p>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template match="EstimatedCost">

        <!-- Вывод сведений о сметной стоимости (без детализации) -->
        <xsl:if test="EstimatedCompleteCostBefore">
            <table>
                <tr>
                    <td class="title" rowspan="2" width="40%">Структура затрат</td>
                    <td class="title" colspan="3" width="60%">Сметная стоимость, тыс. рублей</td>
                </tr>
                <tr>
                    <td class="title">на дату представления сметной документации</td>
                    <td class="title">на дату утверждения заключения экспертизы</td>
                    <td class="title">изменение(+/-)</td>
                </tr>
                <tr>
                    <td class="left">Всего</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedCompleteCostBefore"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedCompleteCostPost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedCompleteCostBefore) - number(EstimatedCompleteCostPost)"/>
                    </td>
                </tr>
            </table>
        </xsl:if>

        <!-- Вывод сведений о сметной стоимости (с детализации при проведении ПДОСС) -->
        <xsl:if test="EstimatedComplexCostBefore">
            <table>
                <tr>
                    <td class="title" rowspan="2" width="40%">Структура затрат</td>
                    <td class="title" colspan="3" width="60%">Сметная стоимость, тыс. рублей</td>
                </tr>
                <tr>
                    <td class="title">на дату представления сметной документации</td>
                    <td class="title">на дату утверждения заключения экспертизы</td>
                    <td class="title">изменение(+/-)</td>
                </tr>
                <tr>
                    <td class="title" colspan="4">В базисном уровне цен</td>
                </tr>
                <tr>
                    <td class="left">Всего</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/CostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/CostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/CostBasic) - number(EstimatedComplexCostPost/CostBasic)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">в том числе:</td>
                    <td class="center"/>
                    <td class="center"/>
                    <td class="center"/>
                </tr>
                <tr>
                    <td class="left">- строительно-монтажные работы</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/WorksCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/WorksCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/WorksCostBasic) - number(EstimatedComplexCostPost/WorksCostBasic)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- оборудование</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/HardwareCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/HardwareCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/HardwareCostBasic) - number(EstimatedComplexCostPost/HardwareCostBasic)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- прочие затраты,</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/OtherCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/OtherCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/OtherCostBasic) - number(EstimatedComplexCostPost/OtherCostBasic)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left" style="padding-left: 20px;">в том числе проектно-изыскательские работы</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/ProjectWorksCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/ProjectWorksCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/ProjectWorksCostBasic) - number(EstimatedComplexCostPost/ProjectWorksCostBasic)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- возвратные суммы</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/BackSumCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/BackSumCostBasic"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/BackSumCostBasic) - number(EstimatedComplexCostPost/BackSumCostBasic)"/>
                    </td>
                </tr>
                <tr>
                    <td class="title" colspan="4">В текущем уровне цен</td>
                </tr>
                <tr>
                    <td class="left">Всего</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/Cost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/Cost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/Cost) - number(EstimatedComplexCostPost/Cost)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">в том числе:</td>
                    <td class="center"/>
                    <td class="center"/>
                    <td class="center"/>
                </tr>
                <tr>
                    <td class="left">- строительно-монтажные работы</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/WorksCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/WorksCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/WorksCost) - number(EstimatedComplexCostPost/WorksCost)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- оборудование</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/HardwareCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/HardwareCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/HardwareCost) - number(EstimatedComplexCostPost/HardwareCost)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- прочие затраты,</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/OtherCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/OtherCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/OtherCost) - number(EstimatedComplexCostPost/OtherCost)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left" style="padding-left: 20px;">в том числе проектно-изыскательские работы</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/ProjectWorksCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/ProjectWorksCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/ProjectWorksCost) - number(EstimatedComplexCostPost/ProjectWorksCost)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- налог на добавленную стоимость</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/NDSCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/NDSCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/NDSCost) - number(EstimatedComplexCostPost/NDSCost)"/>
                    </td>
                </tr>
                <tr>
                    <td class="left">- возвратные суммы</td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostBefore/BackSumCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="EstimatedComplexCostPost/BackSumCost"/>
                    </td>
                    <td class="center">
                        <xsl:value-of select="number(EstimatedComplexCostBefore/BackSumCost) - number(EstimatedComplexCostPost/BackSumCost)"/>
                    </td>
                </tr>
            </table>
        </xsl:if>

    </xsl:template>


    <xsl:template name="EngineeringSurveysDocTable">
        <xsl:param name="Code"/>
        <xsl:if test="Documents/Document[DocType = $Code and File]">
            <tr>
                <td colspan="5">
                    <p class="title">
                        <xsl:choose>
                            <xsl:when test="$Code = '06.99'"> Иные отчетные материалы </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="MakeRII">
                                    <xsl:with-param name="TypeCode" select="$Code"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </p>
                </td>
            </tr>
            <xsl:for-each select="Documents/Document[DocType = $Code and File]">
                <xsl:call-template name="TableDocument"/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>

    <xsl:template name="ProjectDocumentsDocTable">
        <xsl:param name="Code"/>
        <xsl:if test="Documents/Document[DocType = $Code and File]">
            <tr>
                <td colspan="5">
                    <p class="title">
                        <xsl:call-template name="MakeProjectSection">
                            <xsl:with-param name="Code" select="$Code"/>
                        </xsl:call-template>
                    </p>
                </td>
            </tr>
            <xsl:for-each select="Documents/Document[DocType = $Code and File]">
                <xsl:call-template name="TableDocument"/>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>


    <xsl:template name="EngineeringSurveysReports">
        <xsl:param name="Code"/>
        <xsl:if test="Documents/Document[DocType = $Code and File]">
            <tr>
                <td colspan="3">
                    <p class="title">
                        <xsl:choose>
                            <xsl:when test="$Code = '06.99'"> Иные отчетные материалы </xsl:when>
                            <xsl:otherwise>
                                <xsl:call-template name="MakeRII">
                                    <xsl:with-param name="TypeCode" select="$Code"/>
                                </xsl:call-template>
                            </xsl:otherwise>
                        </xsl:choose>
                    </p>
                </td>
            </tr>
            <xsl:for-each select="Documents/Document[DocType = $Code and File]">
                <xsl:sort select="DocDate"/>
                <tr>
                    <td>
                        <xsl:value-of select="DocName"/>
                    </td>
                    <td class="center">
                        <xsl:call-template name="formatdate">
                            <xsl:with-param name="DateTimeStr" select="DocDate"/>
                        </xsl:call-template>
                    </td>
                    <td>
                        <xsl:apply-templates select="FullDocIssueAuthor/Organization"/>
                        <xsl:apply-templates select="FullDocIssueAuthor/ForeignOrganization"/>
                        <xsl:apply-templates select="FullDocIssueAuthor/IP"/>
                        <xsl:apply-templates select="FullDocIssueAuthor/Person"/>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:if>
    </xsl:template>


    <xsl:template name="MakeDocFileTable">
        <xsl:variable name="FileNumber" select="count(File) + count(File/SignFile)"/>
        <xsl:variable name="Pos" select="position()"/>
        <xsl:if test="$FileNumber!=0">
        <xsl:for-each select="File">
            <tr>
                <xsl:if test="position() = 1">
                    <td>
                        <xsl:if test="$FileNumber != 1">
                            <xsl:attribute name="rowspan">
                                <xsl:value-of select="$FileNumber"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:number value="$Pos"/>
                    </td>
                    <td class="no-first-line">
                        <xsl:if test="$FileNumber != 1">
                            <xsl:attribute name="rowspan">
                                <xsl:value-of select="$FileNumber"/>
                            </xsl:attribute>
                        </xsl:if>
                        <xsl:apply-templates select=".."/>
                    </td>
                </xsl:if>
                <td>
                    <xsl:value-of select="FileName"/>
                </td>
                <td class="center">
                    <xsl:value-of select="FileChecksum"/>
                </td>
			</tr>
                <xsl:for-each select="SignFile">
                    <tr>
                        <td style="font-style: italic;">
                            <xsl:value-of select="FileName"/>
                        </td>
                        <td class="center" style="font-style: italic;">
                            <xsl:value-of select="FileChecksum"/>
                        </td>
                    </tr>
                </xsl:for-each>
        </xsl:for-each>
        </xsl:if>
        <xsl:if test="$FileNumber=0 and Included">
            <tr>
                <td>
                    <xsl:number value="$Pos"/>
                </td>
                <td>
                    <xsl:apply-templates select="."/>
                </td>
                <td colspan="2">
                    <xsl:value-of select="Included"/>
                </td>
            </tr>
        </xsl:if>
        <xsl:if test="$FileNumber=0 and Link">
            <tr>
                <td>
                    <xsl:number value="$Pos"/>
                </td>
                <td>
                    <xsl:apply-templates select="."/>
                </td>
                <td colspan="2">
                    Документ опубликован: <br/>
                    <xsl:value-of select="Link"/>
                </td>
            </tr>
        </xsl:if>
    </xsl:template>
    <xsl:template name="MakeLandCategory">
        <xsl:param name="Code"/>
        <xsl:if test="$Code = 1">Земли сельскохозяйственного назначения</xsl:if>
        <xsl:if test="$Code = 2">Земли населенных пунктов</xsl:if>
        <xsl:if test="$Code = 3">Земли промышленности, энергетики, транспорта, связи, радиовещания, телевидения, информатики, земли для обеспечения космической деятельности, земли обороны, безопасности и земли иного специального назначения</xsl:if>
        <xsl:if test="$Code = 4">Земли особо охраняемых территорий и объектов</xsl:if>
        <xsl:if test="$Code = 5">Земли лесного фонда</xsl:if>
        <xsl:if test="$Code = 6">Земли водного фонда</xsl:if>
        <xsl:if test="$Code = 7">Земли запаса</xsl:if>

    </xsl:template>

    <xsl:template name="NonLinearProjectDocumentContent">
        <xsl:param name="DocumentationContent"/>
        <xsl:if test="$DocumentationContent/*">
            <table>
                <tr>
                    <td style="width: 10%;" class="title"> Обозначение </td>
                    <td style="width: 50%;" class="title"> Наименование, исполнитель </td>
                    <td style="width: 25%;" class="title"> Имя файла документа (подписи документа) </td>
                    <td class="title"> Контрольная сумма файла документа (подписи документа) </td>
                </tr>
                <tr><td colspan="4" class="title">Раздел 1. «Пояснительняа записка»</td></tr>
				<tr>
					<td><xsl:value-of select="ExplanatoryNoteNumber"/></td>
				    <td>Раздел 1. «Пояснительняа записка»</td>
					<td> </td>
					<td> </td>
				</tr>
                <xsl:for-each select="$DocumentationContent/*">
                    <tr>
                        <td colspan="4" class="title">
                            <xsl:call-template name="NonLinearProjectDocumentsSectionName">
                                <xsl:with-param name="SectionNumber" select="name()"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <xsl:choose>
                        <xsl:when test="name() != 'Section5'">
                            <xsl:for-each select="./Document">
                                <xsl:call-template name="ProjectDocumentTableLine">
                                    <xsl:with-param name="Document" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                            <xsl:for-each select="./SubSection">
                                <xsl:call-template name="MakeSubSection">
                                    <xsl:with-param name="SubSection" select="."/>
                                </xsl:call-template>
                            </xsl:for-each>
                        </xsl:when>
                        <xsl:when test="name() = 'Section5'">
                            <xsl:for-each select="./*">
                                <tr>
                                    <td colspan="4" class="title">
                                        <xsl:call-template name="NonLinearProjectDocumentsSectionName">
                                            <xsl:with-param name="SectionNumber" select="name()"/>
                                        </xsl:call-template>
                                    </td>
                                </tr>
                                <xsl:for-each select="./Document">
                                    <xsl:call-template name="ProjectDocumentTableLine">
                                        <xsl:with-param name="Document" select="."/>
                                    </xsl:call-template>
								</xsl:for-each>
                                <xsl:for-each select="./SubSection">
                                        <xsl:call-template name="MakeSubSection">
                                            <xsl:with-param name="SubSection" select="."/>
                                        </xsl:call-template>
                                </xsl:for-each>
                            </xsl:for-each>
                        </xsl:when>
                    </xsl:choose>
                </xsl:for-each>
            </table>
        </xsl:if>
    </xsl:template>

    <xsl:template name="NonLinearProjectDocumentsSectionName">
        <xsl:param name="SectionNumber"/>
        <xsl:choose>
            <xsl:when test="$SectionNumber = 'Section2'">Раздел 2. «Схема планировочной организации земельного участка»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section3'">Раздел 3. «Объемно-планировочные и архитектурные решения»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section4'">Раздел 4. «Конструктивные решения»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section5'">Раздел 5. "Сведения об инженерном оборудовании, о сетях и системах инженерно-технического обеспечения"</xsl:when>
            <xsl:when test="$SectionNumber = 'ElectricitySupply'">Раздел 5. Подраздел «Система электроснабжения»</xsl:when>
            <xsl:when test="$SectionNumber = 'WaterSupply'">Раздел 5. Подраздел «Система водоснабжения»</xsl:when>
            <xsl:when test="$SectionNumber = 'WaterRemoval'">Раздел 5. Подраздел «Система водоотведения»</xsl:when>
            <xsl:when test="$SectionNumber = 'HeatingVentilation'">Раздел 5. Подраздел «Отопление, вентиляция и кондиционирование воздуха, тепловые сети»</xsl:when>
            <xsl:when test="$SectionNumber = 'Communication'">Раздел 5. Подраздел «Сети связи»</xsl:when>
            <xsl:when test="$SectionNumber = 'GasSupply'">Раздел 5. Подраздел «Система газоснабжения»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section6'">Раздел 6. «Технологические решения»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section7'">Раздел 7. «Проект организации строительства»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section8'">Раздел 8. «Мероприятия по охране окружающей среды»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section9'">Раздел 9. «Мероприятия по обеспечению пожарной безопасности»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section10'">Раздел 10. «Требования к обеспечению безопасной эксплуатации объектов капитального строительства»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section11'">Раздел 11. «Мероприятия по обеспечению доступа инвалидов к объекту капитального строительства»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section12'">Раздел 12. «Смета на строительство, реконструкцию, капитальный ремонт, снос объекта капитального строительства»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section13'">Раздел 13. «Иная документация в случаях, предусмотренных законодательными и иными нормативными правовыми актами Российской Федерации»</xsl:when>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="LinearProjectDocumentContent">
        <xsl:param name="DocumentationContent"/>
        <xsl:if test="$DocumentationContent/*">
            <table>
                <tr>
                    <td style="width: 10%;" class="title"> Обозначение </td>
                    <td style="width: 50%;" class="title"> Наименование, исполнитель </td>
                    <td style="width: 25%;" class="title"> Имя файла документа (подписи документа) </td>
                    <td class="title"> Контрольная сумма файла документа (подписи документа) </td>
                </tr>
                <tr><td colspan="4" class="title">Раздел 1. «Пояснительняа записка»</td></tr>
				<tr>
					<td><xsl:value-of select="ExplanatoryNoteNumber"/></td>
				    <td>Раздел 1. «Пояснительняа записка»</td>
					<td> </td>
					<td> </td>
				</tr>
				<xsl:for-each select="$DocumentationContent/*">
                    <tr>
                        <td colspan="4" class="title">
                            <xsl:call-template name="LinearProjectDocumentsSectionName">
                                <xsl:with-param name="SectionNumber" select="name()"/>
                            </xsl:call-template>
                        </td>
                    </tr>
                    <xsl:for-each select="./Document">
                        <xsl:call-template name="ProjectDocumentTableLine">
                            <xsl:with-param name="Document" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                    <xsl:for-each select="./SubSection">
                        <xsl:call-template name="MakeSubSection">
                            <xsl:with-param name="SubSection" select="."/>
                        </xsl:call-template>
                    </xsl:for-each>
                </xsl:for-each>
            </table>
        </xsl:if>
    </xsl:template>

    <xsl:template name="LinearProjectDocumentsSectionName">
        <xsl:param name="SectionNumber"/>
        <xsl:choose>
            <xsl:when test="$SectionNumber = 'Section2'">Раздел 2. «Проект полосы отвода»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section3'">Раздел 3. «Технологические и конструктивные решения линейного объекта. Искусственные сооружения»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section4'">Раздел 4. «Здания, строения и сооружения, входящие в инфраструктуру линейного объекта»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section5'">Раздел 5. «Проект организации строительства»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section6'">Раздел 6. «Мероприятия по охране окружающей среды»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section7'">Раздел 7. «Мероприятия по обеспечению пожарной безопасности»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section8'">Раздел 8. «Требования к обеспечению безопасной эксплуатации линейного объекта»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section9'">Раздел 9. «Смета на строительство, реконструкцию, капитальный ремонт, снос объекта капитального строительства»</xsl:when>
            <xsl:when test="$SectionNumber = 'Section10'">Раздел 10. «Иная документация в случаях, предусмотренных законодательными и иными нормативными правовыми актами Российской Федерации»</xsl:when>
        </xsl:choose>
    </xsl:template>
    
    <xsl:template name="MakeSubSection">
        <xsl:param name="SubSection"/>
        <tr>
            <td colspan="4" class="subtitle">
                <xsl:value-of select="$SubSection/@Name"/>
            </td>
        </tr>
        <xsl:for-each select="$SubSection/Document">
            <xsl:call-template name="ProjectDocumentTableLine">
                <xsl:with-param name="Document" select="."/>
            </xsl:call-template>
        </xsl:for-each>
        <xsl:for-each select="$SubSection/SubSection">
            <xsl:call-template name="MakeSubSection">
                <xsl:with-param name="SubSection" select="."/>
            </xsl:call-template>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="ProjectDocumentTableLine">
        <xsl:param name="Document"/>
        <xsl:variable name="FileNumber" select="count($Document/File) + count($Document/File/SignFile)"/>
        <xsl:variable name="Pos" select="position()"/>
        <xsl:for-each select="$Document/File">
            <tr>
                <xsl:if test="position() = 1">
                    <td style="width: 10%;">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="$FileNumber"/>
                        </xsl:attribute>
                        <xsl:value-of select="../DocNumber"/>
                    </td>
                    <td style="width: 50%;">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="$FileNumber"/>
                        </xsl:attribute>
                        <xsl:value-of select="../DocName"/>, <xsl:value-of select="../DocIssueAuthor"/>
                    </td>
                </xsl:if>
                <td>
                    <xsl:value-of select="FileName"/>
                </td>
                <td class="center">
                    <xsl:value-of select="FileChecksum"/>
                </td>
			 </tr>
                <xsl:for-each select="SignFile">
                    <tr>
                        <td style="font-style: italic;">
                            <xsl:value-of select="FileName"/>
                        </td>
                        <td class="center" style="font-style: italic;">
                            <xsl:value-of select="FileChecksum"/>
                        </td>
                    </tr>
                </xsl:for-each>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="Data">
        <xsl:variable name="FileNumber" select="count(File) + count(File/SignFile)"/>
        <xsl:variable name="Pos" select="position()"/>
        <xsl:for-each select="File">
            <tr>
                <xsl:if test="position() = 1">
                    <td style="width: 10%;">
                        <xsl:attribute name="rowspan">
                            <xsl:value-of select="$FileNumber"/>
                        </xsl:attribute>
                        <xsl:value-of select="../DataDescription"/>
                    </td>
                </xsl:if>
                <td>
                    <xsl:value-of select="FileName"/>
                </td>
                <td class="center">
                    <xsl:value-of select="FileChecksum"/>
                </td>
            </tr>
            <xsl:for-each select="SignFile">
                <tr>
                    <td style="font-style: italic;">
                        <xsl:value-of select="FileName"/>
                    </td>
                    <td class="center" style="font-style: italic;">
                        <xsl:value-of select="FileChecksum"/>
                    </td>
                </tr>
            </xsl:for-each>
        </xsl:for-each>
    </xsl:template>

    <xsl:template name="PrintFunctions">
        <xsl:param name="Functions"/>

        <xsl:if test="$Functions/FunctionsClass">
            <p>
                <span class="field">Функциональное назначение по классификатору объектов капитального строительства по их назначению и функционально-технологическим особенностям (для целей архитектурно-строительного проектирования и ведения единого государственного реестра заключений экспертизы
                    проектной документации объектов капитального строительства), утвержденного приказом Минстроя России от 10.07.2020 №374/пр: </span>
                <xsl:value-of select="$Functions/FunctionsClass"/>
            </p>
            <br/>
            <br/>
        </xsl:if>
        <xsl:if test="$Functions/FunctionsNote">
            <p>
                <span class="field">Функциональное назначение объекта капитального строительства: </span>
                <xsl:value-of select="$Functions/FunctionsNote"/>
            </p>
            <br/>
            <br/>
        </xsl:if>

        <xsl:if test="$Functions/ProductsNote ">
            <p class="title">Cведения о составе и характеристике производства, номенклатура выпускаемой продукции (работ, услуг)</p>
            <xsl:if test="$Functions/ProductsNote">
                <xsl:apply-templates select="$Functions/ProductsNote"/>
            </xsl:if>
        </xsl:if>
        
    </xsl:template>

    <xsl:template match="UsedAbbreviations | DesignerNote | FunctionsFeatures | DangerousNatureProcesses | 
                         PeoplePermanentStay | ResourceUseInfo | RenewableSourceInfo | LandFunds | PatentsUsed | SpecialRequirements |
                         StaffNote | DestroyFunds | LandReclamationLink | FunctionsFeatures | DangerousNatureProcesses | 
                         DangerousIndustrialObject| LinearObjectCategory | LinearObjectClass | LinearObjectNote | EngineeringTerritoryProtection | 
                         StrengthCalculation | EnvironmentalProtection | FireSafety | OperationalSafety | PerairFrequency |
                         ObjectList | NuclearSafety | NuclearSafety | OperationalLimits | NuclearPlantControl | ReactorPlant | NuclearSafitySoftware |
                         GeotechnicalMonitoring | HydrogeologicalMonitoring | SeismologicalMonitoring | MeteorologicalMonitoring |
                         AerologicalMonitoring | HydrologicalMonitoring | GeodynamicalMonitoring | TechnogenicMonitoring |
                         CommonLandInfo | SoftwareNote | ReasonNote | Note | EnergyEfficiencyImproving | ProductsNote | 
                         ImportanceNote |  ClimateNote | RoutesNote | Assurance">
        <xsl:if test="@Title">
            <p class="title">
                <xsl:value-of select="@Title"/>
            </p>
        </xsl:if>
        <xsl:for-each select="*">
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <br/>
        <br/>
    </xsl:template>

    <xsl:template match="Title">
        <p class="title">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

    <xsl:template match="Text">
        <xsl:call-template name="StringReplace">
            <xsl:with-param name="input" select="."/>
        </xsl:call-template>
    </xsl:template>

    <xsl:template match="SubTitle">
        <p class="subtitle">
            <xsl:value-of select="."/>
        </p>
    </xsl:template>

    <xsl:template match="Image">
        <img>
            <xsl:attribute name="src">
                <xsl:value-of select="concat('data:image/', @Type, ';base64,', ImageData)"/>
            </xsl:attribute>
        </img>
        <xsl:if test="Comment">
            <p class="imagecomment">
                <xsl:value-of select="Comment"/>
            </p>
        </xsl:if>
    </xsl:template>

    <xsl:template match="Table">
        <table>
            <xsl:for-each select="TitleRow | Row">
                <xsl:apply-templates select="."/>
            </xsl:for-each>
        </table>
    </xsl:template>

    <xsl:template match="Row">
        <tr>
            <xsl:for-each select="Cell">
                <xsl:apply-templates select=".">
                    <xsl:with-param name="Title" select="0"/>
                </xsl:apply-templates>
            </xsl:for-each>
        </tr>
    </xsl:template>

    <xsl:template match="TitleRow">
        <tr>
            <xsl:for-each select="Cell">
                <xsl:apply-templates select=".">
                    <xsl:with-param name="Title" select="1"/>
                </xsl:apply-templates>
            </xsl:for-each>
        </tr>
    </xsl:template>

    <xsl:template match="Cell">
        <xsl:param name="Title"/>
        <td>
            <xsl:if test="$Title = 0">
                <xsl:if test="@align">
                <xsl:attribute name="style">text-align: <xsl:value-of select="@align"/></xsl:attribute>
                </xsl:if>
                <xsl:if test="not(@align)">
                    <xsl:attribute name="style">text-align: left</xsl:attribute>
                </xsl:if>
            </xsl:if>
            <xsl:if test="$Title = 1">
                <xsl:attribute name="class">title</xsl:attribute>
            </xsl:if>
            <xsl:value-of select="."/>
        </td>
    </xsl:template>
    
    <!-- Вывод коментария по абзацам со звездачками-->
    <xsl:template name="StringReplaceComment">
        <xsl:param name="input"/>
        <xsl:param name="count"/>
        <xsl:param name="first"/>
        
        <xsl:choose>
            <xsl:when test="contains($input, '&#xA;')">
                <p>
                    <xsl:if test="$first=1">
                        <sup>
                            <xsl:call-template name="MakeFootNoteSymbols">
                                <xsl:with-param name="Count" select="$count"></xsl:with-param>
                            </xsl:call-template>
                        </sup>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:value-of select="substring-before($input, '&#xA;')"/>
                </p>
                <xsl:call-template name="StringReplaceComment">
                    <xsl:with-param name="input" select="substring-after($input, '&#xA;')"/>
                    <xsl:with-param name="count" select="0"></xsl:with-param>
                    <xsl:with-param name="first" select="number($first)+1"></xsl:with-param>
                </xsl:call-template>
            </xsl:when>
            <xsl:otherwise>
                <p>
                    <xsl:if test="$first=1">
                        <sup>
                            <xsl:call-template name="MakeFootNoteSymbols">
                                <xsl:with-param name="Count" select="$count"></xsl:with-param>
                            </xsl:call-template>
                        </sup>
                        <xsl:text> </xsl:text>
                    </xsl:if>
                    <xsl:value-of select="$input"/>
                </p><br/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>

    <xsl:template name="MakeFootNoteSymbols">
        <xsl:param name="Count"/>
        <xsl:if test="$Count!=0">
            <xsl:text>*</xsl:text>
            <xsl:if test="$Count != 1">
                <xsl:call-template name="MakeFootNoteSymbols">
                    <xsl:with-param name="Count" select="number($Count) - 1"/>
                </xsl:call-template>
            </xsl:if>
        </xsl:if>
    </xsl:template>
    
    <xsl:template match="ObjectParts">
        <xsl:param name="level"/>
        
        <hr/>
        <xsl:for-each select="ComplexPart">
            <p class="field"><xsl:value-of select="$level"/>.<xsl:value-of select="position()"/>.<br/></p>
            <xsl:apply-templates select="."/>
            <xsl:apply-templates select="ObjectParts">
                <xsl:with-param name="level" select="concat($level,'.',position())"></xsl:with-param>
            </xsl:apply-templates>
        </xsl:for-each>
        <xsl:for-each select="OKS">
            <p class="field"><xsl:value-of select="$level"/>.<xsl:value-of select="position()+count(../ComplexPart)"/>.<br/></p>
            <xsl:apply-templates select="."/>
        </xsl:for-each>
        <hr/>
    </xsl:template>
    
    <xsl:template match="ComplexPart | OKS">
        <a>
            <xsl:attribute name="name"><xsl:value-of select="@ObjectID"/></xsl:attribute>
        </a>
        <p>
            <span class="field">Наименование объекта капитального строительства: </span>
            <xsl:value-of select="Name"/>
        </p>
        <p>
            <span class="field">Адрес объекта капитального строительства: </span>
            <xsl:apply-templates select="Address"/>
        </p>
        <xsl:if test="FunctionsClass">
            <p>
                <span class="field">Функциональное назначение по классификатору объектов капитального строительства по их назначению и функционально-технологическим особенностям (для целей архитектурно-строительного проектирования и ведения единого государственного реестра
                    заключений экспертизы проектной документации объектов капитального строительства), утвержденного приказом Минстроя России от 10.07.2020 №374/пр: </span>
                <xsl:value-of select="FunctionsClass"/>
            </p>
            <br/>
        </xsl:if>
        
        <xsl:if test="FunctionsClassKSI">
            <p>
                <span class="field">Функциональное назначение по классификатору строительной информации: </span>
                <xsl:value-of select="FunctionsClassKSI"/>
            </p>
            <br/>
        </xsl:if>
        
        <xsl:if test="FunctionsFeatures">
            <a name="FunctionsFeatures"/>
            <p class="title">Сведения о принадлежности к объектам транспортной инфраструктуры и к другим объектам, функционально-технологические особенности которых влияют на их безопасность:</p>
            <xsl:apply-templates select="FunctionsFeatures"/>
        </xsl:if>
        
        <xsl:if test="DangerousIndustrialObject">
            <a name="FunctionsFeatures"/>
            <p class="title">Сведения о принадлежности к опасным производственным объектам</p>
            <p>Класс опасности производственного объекта: <xsl:value-of select="DangerousIndustrialObject"/></p>
            <br/>
            
        </xsl:if>
        
        <xsl:if test="EnergyEfficiency">
            <p class="title">Сведения о классе энергетической эффективности  и о повышении энергетической эффективности</p>
            <p>Класс энергоэффективности: <xsl:value-of select="EnergyEfficiency/EnergyEfficiencyClass"/></p>
            <br/>
            <xsl:if test="EnergyEfficiency/EnergyEfficiencyImproving">
                <xsl:apply-templates select="FunctionsFeatures/EnergyEfficiencyImproving"/>
            </xsl:if>
        </xsl:if>
        
        <xsl:if test="FireDangerCategory">
            <a name="FireDangerCategory"/>
            <p class="title">Сведения о пожарной и взрывопожарной опасности</p>
            <p>Класс взрывопожарной опасности: <xsl:value-of select="FireDangerCategory"/></p>
            <br/>
        </xsl:if>
        
        <xsl:if test="PeoplePermanentStay">
            <p class="title">Сведения о наличии помещений с постоянным пребыванием людей</p>
            <xsl:apply-templates select="PeoplePermanentStay"/>
        </xsl:if>
        
        <xsl:if test="ResponsibilityLevel">
            <p class="title">Сведения об уровне ответственности</p>
            <p>Уровень ответсвенности: <xsl:value-of select="ResponsibilityLevel"/></p>
            <br/>
        </xsl:if>
             
        <xsl:if test="PowerIndicator">
            <p class="title">Показатели мощности объекта капитального строительства </p>
            <table style="border-style: solid; border-width:1px; border-collapse: collapse; align: center;">
                <tr>
                    <td style="width: 50%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;"> Наименование технико-экономического показателя </td>
<!--                    <td style="width: 25%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;"> Единица измерения </td>
-->                    <td style="width: 25%; border-style: solid; border-width:1px; font-weight: bold;text-align: center; "> Значение </td>
                </tr>
                <xsl:apply-templates select="PowerIndicator"/>
            </table>
            <br/>
        </xsl:if>
        
        <xsl:if test="TEI">
            <p class="title">Технико-экономические показатели объекта капитального строительства </p>
            <table style="border-style: solid; border-width:1px; border-collapse: collapse; align: center;">
                <tr>
                    <td style="width: 50%; border-style: solid; border-width:1px; font-weight: bold; text-align: center;"> Наименование технико-экономического показателя </td>
                    <td style="width: 25%; border-style: solid; border-width:1px; font-weight: bold;text-align: center; "> Значение </td>
                </tr>
                <xsl:apply-templates select="TEI"/>
            </table>
            <hr/>
            <br/>
            <br/>
        </xsl:if>
    </xsl:template>
	
	<xsl:template match="SROMembership">
		<span class="no-first-line field">Является членом СРО:</span><br/>
		<xsl:for-each select="SRO">
		    <span class="no-first-line"><xsl:value-of select="@SROType"/> - <xsl:value-of select="."/></span><br/>
		</xsl:for-each>
	</xsl:template>
         
</xsl:stylesheet>
