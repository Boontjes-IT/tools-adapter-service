<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/"
    exclude-result-prefixes="xsl soapenv">
        
    <xsl:strip-space elements="*"/>
    <xsl:output indent="yes" method="xml" version="1.0" encoding="UTF-8" omit-xml-declaration="yes"/>
    <xsl:param name="XPATH-STRING" />
    
    <xsl:template match="/">
        <root>
            <xpath-string><xsl:value-of select="$XPATH-STRING"/></xpath-string>
            <xpath-result>
                <xsl:call-templates name="xpathstring">
                    <xsl:with-param name="xpath" select="$XPATH-STRING"/>
                </xsl:call-templates>
           </xpath-result>
            <body-input><xsl:copy-of select="."/></body-input>
        </root>
    </xsl:template>
    
    
    <xsl:template name="xpathstring">
        <xsl:param name="xpath"/>
        <xpath-result>
            <xsl:apply-templates select="$xpath"/>
        </xpath-result>
    </xsl:template>
    
    <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()"/>
        </xsl:copy>
    </xsl:template> 
    
</xsl:stylesheet>