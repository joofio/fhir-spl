<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2022r2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:ns0="http://hl7.org/fhir" xmlns:tbf="http://www.altova.com/MapForce/UDF/tbf" xmlns:user="http://www.altova.com/MapForce/UDF/user" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns1="urn:hl7-org:v3" exclude-result-prefixes="ns0 tbf user vmf xs fn ns1">
	<xsl:template name="tbf:tbf110_Identifier-II">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@root">
			<xsl:attribute name="root" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@extension">
			<xsl:attribute name="extension" select="fn:string(.)"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="user:filterDUNSNumber">
		<xsl:param name="fhirsingle" select="()"/>
		<xsl:variable name="var3_system" as="node()*" select="$fhirsingle/ns0:system"/>
		<xsl:variable name="var1_map_of_system" as="xs:boolean*">
			<xsl:for-each select="$var3_system/@value">
				<xsl:sequence select="('urn:oid:1.3.6.1.4.1.519.1' = xs:string(xs:anyURI(fn:string(.))))"/>
			</xsl:for-each>
		</xsl:variable>
		<xsl:if test="fn:exists(($var1_map_of_system)[.])">
			<Identifier-II>
				<xsl:for-each select="$var3_system/@value">
					<xsl:variable name="var2_resultof_stripUrn" as="xs:string?">
						<xsl:call-template name="user:stripUrn">
							<xsl:with-param name="input" select="xs:string(xs:anyURI(fn:string(.)))" as="xs:string"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:for-each select="$var2_resultof_stripUrn">
						<xsl:attribute name="root" select="."/>
					</xsl:for-each>
				</xsl:for-each>
				<xsl:for-each select="$fhirsingle/ns0:value/@value">
					<xsl:attribute name="extension" select="fn:string(.)"/>
				</xsl:for-each>
			</Identifier-II>
		</xsl:if>
	</xsl:template>
	<xsl:template name="user:stripUrn">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="fn:starts-with($input, 'urn:oid:')">
				<xsl:sequence select="fn:substring-after($input, 'urn:oid:')"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:sequence select="$input"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="user:convertOrganization">
		<xsl:param name="Organization" select="()"/>
		<xsl:variable name="var14_identifier" as="node()*" select="$Organization/ns0:identifier"/>
		<xsl:variable name="var15_contact" as="node()*" select="$Organization/ns0:contact"/>
		<xsl:variable name="var16_contained" as="node()*" select="$Organization/ns0:contained"/>
		<xsl:variable name="var17_address" as="node()*" select="$Organization/ns0:address"/>
		<xsl:variable name="var13_create_name_of_name" as="node()*">
			<xsl:for-each select="$Organization/ns0:name">
				<name xmlns="urn:hl7-org:v3">
					<xsl:for-each select="@value">
						<xsl:sequence select="fn:string(.)"/>
					</xsl:for-each>
				</name>
			</xsl:for-each>
		</xsl:variable>
		<LabelerRequest.LabelerOrganization xmlns="urn:hl7-org:v3">
			<xsl:for-each select="$var14_identifier">
				<id>
					<xsl:for-each select="ns0:system/@value">
						<xsl:variable name="var1_resultof_stripUrn" as="xs:string?">
							<xsl:call-template name="user:stripUrn">
								<xsl:with-param name="input" select="xs:string(xs:anyURI(fn:string(.)))" as="xs:string"/>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var1_resultof_stripUrn">
							<xsl:attribute name="root" namespace="" select="."/>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns0:value/@value">
						<xsl:attribute name="extension" namespace="" select="fn:string(.)"/>
					</xsl:for-each>
				</id>
			</xsl:for-each>
			<xsl:sequence select="$var13_create_name_of_name"/>
			<contactParty>
				<addr>
					<xsl:for-each select="$var15_contact/ns0:address/ns0:country">
						<country>
							<xsl:for-each select="@value">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</country>
					</xsl:for-each>
					<xsl:for-each select="$var15_contact/ns0:address/ns0:state">
						<state>
							<xsl:for-each select="@value">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</state>
					</xsl:for-each>
					<xsl:for-each select="$var15_contact/ns0:address/ns0:city">
						<city>
							<xsl:for-each select="@value">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</city>
					</xsl:for-each>
					<xsl:for-each select="$var15_contact/ns0:address/ns0:postalCode">
						<postalCode>
							<xsl:for-each select="@value">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</postalCode>
					</xsl:for-each>
					<xsl:for-each select="$var15_contact/ns0:address/ns0:line">
						<streetAddressLine>
							<xsl:for-each select="@value">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</streetAddressLine>
					</xsl:for-each>
				</addr>
				<xsl:for-each select="$var15_contact/ns0:telecom">
					<xsl:variable name="var4_cur" as="node()" select="."/>
					<telecom>
						<xsl:for-each select="ns0:system/@value">
							<xsl:variable name="var2_resultof_vmf___inputtoresult" as="xs:string?">
								<xsl:call-template name="vmf:vmf12_inputtoresult">
									<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
								</xsl:call-template>
							</xsl:variable>
							<xsl:for-each select="$var2_resultof_vmf___inputtoresult">
								<xsl:variable name="var3_cur" as="xs:string" select="."/>
								<xsl:for-each select="$var4_cur/ns0:value/@value">
									<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:concat($var3_cur, fn:string(.))))"/>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</telecom>
				</xsl:for-each>
				<contactPerson>
					<xsl:for-each select="$var15_contact/ns0:name">
						<name>
							<xsl:for-each select="ns0:text/@value">
								<xsl:sequence select="fn:string(.)"/>
							</xsl:for-each>
						</name>
					</xsl:for-each>
				</contactPerson>
			</contactParty>
			<assignedEntity>
				<assignedOrganization>
					<assignedEntity>
						<assignedOrganization>
							<xsl:for-each select="$var14_identifier">
								<xsl:variable name="var5_resultof_filterDUNSNumber" as="node()?">
									<xsl:call-template name="user:filterDUNSNumber">
										<xsl:with-param name="fhirsingle" as="node()">
											<identifier xmlns="http://hl7.org/fhir">
												<xsl:sequence select="(./@node(), ./node())"/>
											</identifier>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var5_resultof_filterDUNSNumber">
									<id>
										<xsl:call-template name="tbf:tbf110_Identifier-II">
											<xsl:with-param name="input" select="." as="node()"/>
										</xsl:call-template>
									</id>
								</xsl:for-each>
							</xsl:for-each>
							<xsl:sequence select="$var13_create_name_of_name"/>
							<addr>
								<xsl:for-each select="$var17_address/ns0:country">
									<country>
										<xsl:for-each select="@value">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</country>
								</xsl:for-each>
								<xsl:for-each select="$var17_address/ns0:state">
									<state>
										<xsl:for-each select="@value">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</state>
								</xsl:for-each>
								<xsl:for-each select="$var17_address/ns0:city">
									<city>
										<xsl:for-each select="@value">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</city>
								</xsl:for-each>
								<xsl:for-each select="$var17_address/ns0:postalCode">
									<postalCode>
										<xsl:for-each select="@value">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</postalCode>
								</xsl:for-each>
								<xsl:for-each select="$var17_address/ns0:line">
									<streetAddressLine>
										<xsl:for-each select="@value">
											<xsl:sequence select="fn:string(.)"/>
										</xsl:for-each>
									</streetAddressLine>
								</xsl:for-each>
							</addr>
							<xsl:for-each select="$var16_contained/ns0:Organization">
								<xsl:variable name="var10_identifier" as="node()*" select="ns0:identifier"/>
								<assignedEntity>
									<assignedOrganization>
										<id>
											<xsl:for-each select="$var10_identifier/ns0:system/@value">
												<xsl:variable name="var6_resultof_stripUrn" as="xs:string?">
													<xsl:call-template name="user:stripUrn">
														<xsl:with-param name="input" select="xs:string(xs:anyURI(fn:string(.)))" as="xs:string"/>
													</xsl:call-template>
												</xsl:variable>
												<xsl:for-each select="$var6_resultof_stripUrn">
													<xsl:attribute name="root" namespace="" select="."/>
												</xsl:for-each>
											</xsl:for-each>
											<xsl:for-each select="$var10_identifier/ns0:value/@value">
												<xsl:attribute name="extension" namespace="" select="fn:string(.)"/>
											</xsl:for-each>
										</id>
										<xsl:for-each select="ns0:name">
											<name>
												<xsl:for-each select="@value">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</name>
										</xsl:for-each>
										<xsl:for-each select="ns0:telecom">
											<xsl:variable name="var9_cur" as="node()" select="."/>
											<telecom>
												<xsl:for-each select="ns0:system/@value">
													<xsl:variable name="var7_resultof_vmf___inputtoresult" as="xs:string?">
														<xsl:call-template name="vmf:vmf12_inputtoresult">
															<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
														</xsl:call-template>
													</xsl:variable>
													<xsl:for-each select="$var7_resultof_vmf___inputtoresult">
														<xsl:variable name="var8_cur" as="xs:string" select="."/>
														<xsl:for-each select="$var9_cur/ns0:value/@value">
															<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:concat($var8_cur, fn:string(.))))"/>
														</xsl:for-each>
													</xsl:for-each>
												</xsl:for-each>
											</telecom>
										</xsl:for-each>
									</assignedOrganization>
									<performance>
										<actDefinition>
											<code>
												<xsl:attribute name="code" namespace="" select="'C73330'"/>
												<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.3.26.1.1'"/>
												<xsl:attribute name="displayName" namespace="" select="'united states agent'"/>
											</code>
										</actDefinition>
									</performance>
								</assignedEntity>
							</xsl:for-each>
						</assignedOrganization>
						<xsl:for-each select="$var16_contained/ns0:HealthcareService">
							<performance>
								<actDefinition>
									<xsl:for-each select="ns0:type">
										<xsl:variable name="var11_coding" as="node()*" select="ns0:coding"/>
										<code>
											<xsl:for-each select="$var11_coding/ns0:code/@value">
												<xsl:attribute name="code" namespace="" select="fn:string(.)"/>
											</xsl:for-each>
											<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.3.26.1.1'"/>
											<xsl:for-each select="$var11_coding/ns0:display/@value">
												<xsl:attribute name="displayName" namespace="" select="fn:string(.)"/>
											</xsl:for-each>
										</code>
									</xsl:for-each>
									<xsl:for-each select="ns0:serviceProvisionCode">
										<xsl:variable name="var12_coding" as="node()*" select="ns0:coding"/>
										<subjectOf>
											<approval>
												<code>
													<xsl:for-each select="$var12_coding/ns0:code/@value">
														<xsl:attribute name="code" namespace="" select="fn:string(.)"/>
													</xsl:for-each>
													<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.3.26.1.1'"/>
													<xsl:for-each select="$var12_coding/ns0:display/@value">
														<xsl:attribute name="displayName" namespace="" select="fn:string(.)"/>
													</xsl:for-each>
												</code>
											</approval>
										</subjectOf>
									</xsl:for-each>
								</actDefinition>
							</performance>
						</xsl:for-each>
					</assignedEntity>
				</assignedOrganization>
			</assignedEntity>
		</LabelerRequest.LabelerOrganization>
	</xsl:template>
	<xsl:template name="vmf:vmf12_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='email'">
				<xsl:copy-of select="'mailto:'"/>
			</xsl:when>
			<xsl:when test="$input='phone'">
				<xsl:copy-of select="'tel:'"/>
			</xsl:when>
			<xsl:when test="$input='fax'">
				<xsl:copy-of select="'fax:'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:param name="documentIdentifier" as="xs:string" required="yes"/>
	<xsl:param name="splDate" as="xs:date" required="yes"/>
	<xsl:param name="setIdentifier" as="xs:string" required="yes"/>
	<xsl:param name="version" as="xs:string" required="yes"/>
	<xsl:template match="/">
		<xsl:variable name="var4_Bundle" as="node()?" select="ns0:Bundle"/>
		<xsl:processing-instruction name="{'xml-stylesheet'}" select="'href=&quot;https://www.accessdata.fda.gov/spl/stylesheet/spl.xsl&quot; type=&quot;text/xml&quot;'"/>
		<document xmlns="urn:hl7-org:v3">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'urn:hl7-org:v3 https://www.accessdata.fda.gov/spl/schema/spl.xsd'"/>
			<id>
				<xsl:attribute name="root" namespace="" select="$documentIdentifier"/>
			</id>
			<code>
				<xsl:for-each select="$var4_Bundle/ns0:entry/ns0:resource/ns0:MessageHeader/ns0:eventCoding/ns0:code/@value">
					<xsl:attribute name="code" namespace="" select="fn:string(.)"/>
				</xsl:for-each>
				<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.6.1'"/>
				<xsl:for-each select="$var4_Bundle/ns0:entry/ns0:resource/ns0:MessageHeader/ns0:eventCoding/ns0:display/@value">
					<xsl:attribute name="displayName" namespace="" select="fn:string(.)"/>
				</xsl:for-each>
			</code>
			<effectiveTime>
				<xsl:attribute name="value" namespace="" select="format-date($splDate, '[Y][M,2][D,2]', 'en', (), ())"/>
			</effectiveTime>
			<setId>
				<xsl:attribute name="root" namespace="" select="$setIdentifier"/>
			</setId>
			<versionNumber>
				<xsl:attribute name="value" namespace="" select="$version"/>
			</versionNumber>
			<xsl:for-each select="$var4_Bundle/ns0:entry/ns0:resource/ns0:Organization">
				<xsl:variable name="var2_resultof_convertOrganization" as="node()?">
					<xsl:call-template name="user:convertOrganization">
						<xsl:with-param name="Organization" as="node()">
							<Organization xmlns="http://hl7.org/fhir">
								<xsl:sequence select="(./@node(), ./node())"/>
							</Organization>
						</xsl:with-param>
					</xsl:call-template>
				</xsl:variable>
				<xsl:for-each select="$var2_resultof_convertOrganization">
					<xsl:variable name="var1_cur" as="node()" select="."/>
					<author>
						<time>
							<xsl:sequence select="()"/>
						</time>
						<xsl:for-each select="ns1:assignedEntity">
							<assignedEntity>
								<xsl:for-each select="@classCode">
									<xsl:attribute name="classCode" namespace="" select="fn:string(.)"/>
								</xsl:for-each>
								<representedOrganization>
									<xsl:sequence select="($var1_cur/@node(), $var1_cur/node())"/>
								</representedOrganization>
							</assignedEntity>
						</xsl:for-each>
					</author>
				</xsl:for-each>
			</xsl:for-each>
			<component>
				<xsl:for-each select="$var4_Bundle/ns0:entry/ns0:resource/ns0:Organization">
					<xsl:variable name="var3_resultof_convertOrganization" as="node()?">
						<xsl:call-template name="user:convertOrganization">
							<xsl:with-param name="Organization" as="node()">
								<Organization xmlns="http://hl7.org/fhir">
									<xsl:sequence select="(./@node(), ./node())"/>
								</Organization>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<xsl:for-each select="$var3_resultof_convertOrganization">
						<structuredBody>
							<xsl:sequence select="()"/>
						</structuredBody>
					</xsl:for-each>
				</xsl:for-each>
			</component>
		</document>
	</xsl:template>
</xsl:stylesheet>
