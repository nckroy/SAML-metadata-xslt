<?xml version="1.0" encoding="UTF-8"?>

<!-- This XSLT reports all the unique OrganizationName values in a SAML metadata aggregate which are registered by https://incommon.org
usage: xsltproc inc-orgs.xslt aggregate-name.xml
 -->

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:md="urn:oasis:names:tc:SAML:2.0:metadata"
	xmlns:mdattr="urn:oasis:names:tc:SAML:metadata:attribute"
	xmlns:mdrpi="urn:oasis:names:tc:SAML:metadata:rpi"
	xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">

	<!-- Output is plain text without empty elements -->
	<xsl:output method="text"/>

	<xsl:template match="md:EntityDescriptor/md:Extensions/mdrpi:RegistrationInfo[@registrationAuthority = 'https://incommon.org']">
		<xsl:if test="ancestor::md:EntityDescriptor/md:Organization/md:OrganizationName[not(.=preceding::*)]">
			<xsl:value-of select="ancestor::md:EntityDescriptor/md:Organization/md:OrganizationName"/>
			<xsl:text>&#10;</xsl:text>
		</xsl:if>
	</xsl:template>

	<xsl:template match="text()">
		<!-- do nothing -->
	</xsl:template>
</xsl:stylesheet>
