<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:foaf="https://danieltanigavel.github.io/foaf.rdf">
    
    <xsl:template match="rdf:RDF">
        <html xmlns="http://www.w3.org/1999/xhtml">
            <head>
                <title>FOAF RDF to XHTML</title>
            </head>
            <body>
                <h1>FOAF RDF Data</h1>
                <xsl:apply-templates select="foaf:Person"/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="foaf:Person">
        <div class="person">
            <h2><xsl:value-of select="foaf:name"/></h2>
            <p><strong>Homepage:</strong> <a href="{foaf:homepage}"><xsl:value-of select="foaf:homepage"/></a></p>
            <p><strong>Email:</strong> <xsl:value-of select="foaf:mbox_sha1sum"/></p>
            <h3>Knows:</h3>
            <ul>
                <xsl:apply-templates select="foaf:knows"/>
            </ul>
        </div>
    </xsl:template>
    
    <xsl:template match="foaf:knows">
        <li>
            <a href="{@rdf:about}">
                <xsl:value-of select="foaf:name"/>
            </a>
        </li>
    </xsl:template>
</xsl:stylesheet>
