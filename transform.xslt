<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" omit-xml-declaration="yes"/>

  <xsl:template match="/">
  <html>
      <head>
          <title>WordCraft</title>
      </head>

      <body>
    <h1>Language School Courses</h1>
       <table>
            <thead>
                <tr>
                    <th>Course ID</th>
                    <th>Title</th>
                    <th>Language</th>
                    <th>Level</th>
                    <th>Description</th>
                    <th>Price</th>
                    <th>Lector</th>
                    <th>Start Date</th>
                    <th>Duration (Hours)</th>
                    <th>Capacity</th>
                </tr>
            </thead>
             <tbody>
                     <xsl:for-each select="languageschool/course">
                        <xsl:sort select="startDate" order="ascending"/>
                        <xsl:if test="capacity > 0">
                            <tr>
                                <td><xsl:value-of select="courseId"/></td>
                                <td><xsl:value-of select="title"/></td>
                                <td><xsl:value-of select="language"/></td>
                                <td><xsl:value-of select="level"/></td>
                                <td><xsl:value-of select="description"/></td>
                                <td><xsl:value-of select="price"/></td>
                                <td><xsl:value-of select="lectors"/></td>
                                <td><xsl:value-of select="startDate"/></td>
                                <td><xsl:value-of select="durationInHours"/></td>
                                <td><xsl:value-of select="capacity"/></td>
                                <td>
                                    <xsl:choose>
                                        <xsl:when test="price/@currency = 'USD'">
                                            <xsl:value-of select="price"/>
                                        </xsl:when>
                                        <xsl:when test="price/@currency = 'CZK'">
                                            <xsl:value-of select="price / 24.2"/>
                                        </xsl:when>
                                        <xsl:otherwise>0.00</xsl:otherwise>
                                    </xsl:choose>
                                </td>
                            </tr>
                        </xsl:if>
                    </xsl:for-each>
                </tbody>
        </table>          
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
