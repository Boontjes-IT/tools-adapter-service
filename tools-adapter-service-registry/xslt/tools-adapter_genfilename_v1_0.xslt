<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    xmlns:tools="http://boontjes-it.nl/xslt-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    exclude-result-prefixes="xsl soapenv tools">
        
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="yes"/>


    <!-- programmer cases-->
    <!-- Custom function to convert a string to camelCase -->
    <xsl:function name="tools:pascalCase">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="words" select="tokenize($input, '\W+')"/>
        <xsl:variable name="camelCase">
            <xsl:for-each select="$words">
                    <xsl:value-of select="upper-case(substring(., 1, 1))"/>
                    <xsl:value-of select="lower-case(substring(., 2))"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="$camelCase"/>
    </xsl:function>
    <!-- Custom function to convert a string to camelCase -->
    <xsl:function name="tools:camelCase">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="words" select="tokenize($input, '\W+')"/>
        <xsl:variable name="camelCase">
            <xsl:for-each select="$words">
                <xsl:if test="position() > 1">
                    <xsl:value-of select="upper-case(substring(., 1, 1))"/>
                    <xsl:value-of select="lower-case(substring(., 2))"/>
                </xsl:if>
                <xsl:if test="position() = 1">
                    <xsl:value-of select="lower-case(.)"/>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="$camelCase"/>
    </xsl:function>
    <!-- Custom function to convert a string to Snake Case -->
    <xsl:function name="tools:snakeCase">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="words" select="tokenize($input, '\W+')"/>
        <xsl:variable name="snakeCase">
            <xsl:for-each select="$words">
                <xsl:variable name="word" select="translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz')"/>
                <xsl:if test="position() > 1">
                    <xsl:value-of select="'_'"/>
                </xsl:if>
                <xsl:value-of select="$word"/>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="$snakeCase"/>
    </xsl:function>
    
    
    <!--    bonus cases-->
    <!-- Custom function to convert a string to TitleCase -->
    <xsl:function name="tools:titleCase">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="words" select="tokenize($input, '\W+')"/>
        <xsl:variable name="titleCase">
            <xsl:for-each select="$words">
                <xsl:choose>
                    <!-- english middle words-->
                    <xsl:when test="contains('a an and as at but by for from in into is nor of off on onto or over so the to up via with ', concat(' ', lower-case(.), ' '))">
                        <xsl:value-of select="lower-case(.)"/>
                    </xsl:when>  
                    <!-- dutch middle words-->
                    <xsl:when test="contains(' een en in van de het met te op voor door over', concat(' ', lower-case(.), ' '))">
                        <xsl:value-of select="lower-case(.)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="upper-case(substring(., 1, 1))"/>
                        <xsl:value-of select="lower-case(substring(., 2))"/>
                    </xsl:otherwise>
                </xsl:choose>
                <xsl:if test="position() != last()">
                    <xsl:text> </xsl:text>
                </xsl:if>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="normalize-space($titleCase)"/>
    </xsl:function>
    <!-- Custom function to convert a string to Capitalized Case -->
    <xsl:function name="tools:capitalizedCase">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="words" select="tokenize($input, '\W+')"/>
        <xsl:variable name="titleCase">
            <xsl:for-each select="$words">
                <xsl:value-of select="upper-case(substring(., 1, 1))"/>
                <xsl:value-of select="lower-case(substring(., 2))"/>
                <xsl:text> </xsl:text>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="normalize-space($titleCase)"/>
    </xsl:function>
    <!-- Custom function to convert a string to Alternating Case -->
    <xsl:function name="tools:alternatingCase">
        <xsl:param name="input" as="xs:string"/>
        <xsl:variable name="length" select="string-length($input)"/>
        <xsl:variable name="alternatingCase">
            <xsl:for-each select="1 to $length">
                <xsl:variable name="char" select="substring($input, ., 1)"/>
                <xsl:choose>
                    <xsl:when test="position() mod 2 = 1">
                        <xsl:value-of select="lower-case($char)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="upper-case($char)"/>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:for-each>
        </xsl:variable>
        <xsl:value-of select="$alternatingCase"/>
    </xsl:function>
   
    <!-- file versions-->
    <!-- Custom function to generate a sequence filename with version and sequence number -->
    <xsl:function name="tools:filename_seq">
        <xsl:param name="input" as="xs:string"/>
        <xsl:param name="type" as="xs:string"/>
        <xsl:param name="version" as="xs:string"/>
        <xsl:param name="fileformat" as="xs:string"/>
        <xsl:variable name="camelCase" select="tools:camelCase($input)"/>
        <xsl:variable name="filename">
            <xsl:value-of select="concat($camelCase, '-',$type,'_', $version, '.', $fileformat)"/>
        </xsl:variable>
        <xsl:value-of select="$filename"/>
    </xsl:function>    <!-- Custom function to generate a special filename with version and sequence number -->
    <xsl:function name="tools:filename_xslt">
        <xsl:param name="canoniekFormaat" as="xs:string"/>
        <xsl:param name="interactieFormaat" as="xs:string"/>
        <xsl:param name="type" as="xs:string"/>
        <xsl:param name="version" as="xs:string"/>
        <xsl:variable name="pascalCaseInteractieFormaat" select="tools:pascalCase($interactieFormaat)"/> 
        <xsl:variable name="pascalCaseCanoniekFormaat" select="tools:pascalCase($canoniekFormaat)"/> 
        <xsl:variable name="filename">
            <xsl:choose>
            <xsl:when test="$type = 'CF-IF'">
                <xsl:value-of select="concat($pascalCaseCanoniekFormaat, '_CF-to-', $pascalCaseInteractieFormaat, '_IF_', $version, '.xslt')"/>                
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="concat($pascalCaseInteractieFormaat, '_IF-to-', $pascalCaseCanoniekFormaat, '_CF_', $version, '.xslt')"/>                
            </xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <xsl:value-of select="$filename"/>
    </xsl:function>
    
<!--    InformatieObject_CF-to-Ticket_IF_v2_0-->
    <xsl:template match="//jsonObject">
        <xsl:variable name="version">
            <xsl:choose>
                <xsl:when test="not(./version)"> <xsl:value-of select="'v1_0'"/>
                </xsl:when>
                <xsl:otherwise> <!--parameter has been supplied --> <xsl:value-of select="./version"/></xsl:otherwise>
            </xsl:choose>
        </xsl:variable>
        <jsonObject>
            <input><xsl:value-of select="./input"/></input>
            <output><xsl:value-of select="./output"/></output>
            <filename_format>
                <sequence> 
                    <inSequence><xsl:value-of select="tools:filename_seq(./input, 'inSeq', $version, 'xml')"/></inSequence>
                    <faultSequence><xsl:value-of select="tools:filename_seq(./input, 'faultSeq' , $version, 'xml')"/></faultSequence>
                </sequence>
                <xslt>
                    <xslt-IFtoCF><xsl:value-of select="tools:filename_xslt(./canoniekFormaat, ./interactieFormaat,'IF-CF', $version)"/></xslt-IFtoCF>
                    <xslt-CFtoIF><xsl:value-of select="tools:filename_xslt(./canoniekFormaat, ./interactieFormaat, 'CF-IF', $version)"/></xslt-CFtoIF>
                </xslt>
            </filename_format>
            <stats>
                <characterCount><xsl:value-of select="string-length(./string)"/></characterCount>
                <wordCount><xsl:value-of select="count(tokenize(./string, '\s+'))"/></wordCount>
                <lineCount><xsl:value-of select="count(tokenize(./string, '\n|\r\n'))"/></lineCount>
            </stats>
        </jsonObject>
    </xsl:template>    
        
</xsl:stylesheet>