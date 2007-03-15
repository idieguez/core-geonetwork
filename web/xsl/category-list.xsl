<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	
	<xsl:include href="main.xsl"/>

	<!--
	additional scripts
	-->
	<xsl:template mode="script" match="/">
		<script type="text/javascript" language="JavaScript">
			function edit(a)
			{
				document.categoryEditForm.id.value=a;
				document.categoryEditForm.submit();
			}
		
			function delete1(b)
			{
				if(confirm("Delete the category ?"))
				{
					document.categoryDeleteForm.id.value=b;
					document.categoryDeleteForm.submit();
				}
			}
		</script>
	</xsl:template>
	
	<!--
	page content
	-->
	<xsl:template name="content">
		<xsl:call-template name="formLayout">
			<xsl:with-param name="title" select="/root/gui/strings/categoryManagement"/>
			<xsl:with-param name="content">
				<xsl:call-template name="form"/>
			</xsl:with-param>
			<xsl:with-param name="buttons">
				<button class="content" onclick="load('{/root/gui/locService}/admin')"><xsl:value-of select="/root/gui/strings/back"/></button>
				&#160;
				<button class="content" onclick="load('{/root/gui/locService}/category.get')"><xsl:value-of select="/root/gui/strings/newCategory"/></button>
			</xsl:with-param>
		</xsl:call-template>
	</xsl:template>
	
	<!--
	form
	-->
	<xsl:template name="form">
		<table>
			<tr>
				<th class="padded"><xsl:value-of select="/root/gui/strings/name"/></th>
				<th class="padded"><xsl:value-of select="/root/gui/strings/operation"/></th>
			</tr>
			<xsl:for-each select="/root/response/record">
				<tr>
					<td class="padded"><xsl:value-of select="name"/></td>
					<td class="padded">
						<button class="content" onclick="load('{/root/gui/locService}/category.get?id={id}')"><xsl:value-of select="/root/gui/strings/edit"/></button>
						&#160;
						<button class="content" onclick="load('{/root/gui/locService}/category.remove?id={id}')"><xsl:value-of select="/root/gui/strings/delete"/></button>
					</td>
				</tr>
			</xsl:for-each>
		</table>
	</xsl:template>
	
</xsl:stylesheet>
