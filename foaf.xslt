<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    version="1.0"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#">

<xsl:template match="rdf:RDF">
    <html>
    <head>
        <title>FOAF RDF Visualization</title>
    </head>
    <body>
        <h1>FOAF RDF Visualization</h1>
        <ul>
            <xsl:for-each select="foaf:Person">
                <li>
                    <h2><xsl:value-of select="foaf:name"/></h2>
                    <p>Homepage: <a href="{foaf:homepage}" target="_blank"><xsl:value-of select="foaf:homepage"/></a></p>
                    <p>Email: <xsl:value-of select="foaf:mbox_sha1sum"/></p>
                    <p>Current Project: <a href="{foaf:currentProject}" target="_blank"><xsl:value-of select="foaf:currentProject"/></a></p>
                </li>
            </xsl:for-each>
        </ul>
        <h2>Connections</h2>
        <ul>
            <xsl:for-each select="foaf:knows/foaf:Person">
                <li>
                    <h3><xsl:value-of select="foaf:name"/></h3>
                    <p>Email: <xsl:value-of select="foaf:mbox_sha1sum"/></p>
                    <p><a href="{rdfs:seeAlso/@rdf:resource}">Lien vers la homepage</a></p>
                </li>
            </xsl:for-each>
        </ul>
    </body>
    </html>
</xsl:template>

</xsl:stylesheet>

