<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2022r2

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:tbf="http://www.altova.com/MapForce/UDF/tbf" xmlns:user="http://www.altova.com/MapForce/UDF/user" xmlns:vmf="http://www.altova.com/MapForce/UDF/vmf" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns0="urn:hl7-org:v3" exclude-result-prefixes="tbf user vmf xs fn ns0">
	<xsl:template name="tbf:tbf1_Simple-CD">
		<xsl:param name="input" select="()"/>
		<xsl:for-each select="$input/@code">
			<xsl:attribute name="code" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@codeSystem">
			<xsl:attribute name="codeSystem" select="fn:string(.)"/>
		</xsl:for-each>
		<xsl:for-each select="$input/@displayName">
			<xsl:attribute name="displayName" select="fn:string(.)"/>
		</xsl:for-each>
	</xsl:template>
	<xsl:template name="user:createOrganizationAffiliation">
		<xsl:param name="participatingId" select="()"/>
		<xsl:param name="SimpleCD" select="()"/>
		<OrganizationAffiliation xmlns="http://hl7.org/fhir">
			<organization>
				<reference>
					<xsl:attribute name="value" namespace="" select="'#'"/>
				</reference>
			</organization>
			<participatingOrganization>
				<reference>
					<xsl:attribute name="value" namespace="" select="$participatingId"/>
				</reference>
			</participatingOrganization>
			<code>
				<coding>
					<system>
						<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI('http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl'))"/>
					</system>
					<code>
						<xsl:for-each select="$SimpleCD/@code">
							<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
						</xsl:for-each>
					</code>
					<display>
						<xsl:for-each select="$SimpleCD/@displayName">
							<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
						</xsl:for-each>
					</display>
				</coding>
			</code>
		</OrganizationAffiliation>
	</xsl:template>
	<xsl:template name="user:createHealthcareService">
		<xsl:param name="OperationDefinition" select="()"/>
		<HealthcareService xmlns="http://hl7.org/fhir">
			<providedBy>
				<reference>
					<xsl:attribute name="value" namespace="" select="'#'"/>
				</reference>
			</providedBy>
			<xsl:for-each select="$OperationDefinition/ns0:code">
				<type>
					<coding>
						<system>
							<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI('http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl'))"/>
						</system>
						<code>
							<xsl:for-each select="@code">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</code>
						<display>
							<xsl:for-each select="@displayName">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</display>
					</coding>
				</type>
			</xsl:for-each>
			<xsl:for-each select="$OperationDefinition/ns0:subjectOf">
				<serviceProvisionCode>
					<xsl:for-each select="ns0:approval/ns0:code">
						<coding>
							<system>
								<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI('http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl'))"/>
							</system>
							<code>
								<xsl:for-each select="@code">
									<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
								</xsl:for-each>
							</code>
							<display>
								<xsl:for-each select="@displayName">
									<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
								</xsl:for-each>
							</display>
						</coding>
					</xsl:for-each>
				</serviceProvisionCode>
			</xsl:for-each>
		</HealthcareService>
	</xsl:template>
	<xsl:template name="user:createEstablishmentOrganization">
		<xsl:param name="EstablishmentOrganization" select="()"/>
		<xsl:variable name="var14_assignedOrganization" as="node()*" select="$EstablishmentOrganization/ns0:assignedOrganization"/>
		<xsl:variable name="var15_http___hl__org_fhir_us_spl_Cod_as_string" as="xs:string" select="xs:string(xs:anyURI('http://hl7.org/fhir/us/spl/CodeSystem/codesystem-organizationTypes'))"/>
		<Organization xmlns="http://hl7.org/fhir">
			<xsl:for-each select="$EstablishmentOrganization/ns0:performance">
				<contained>
					<xsl:for-each select="ns0:actDefinition">
						<xsl:variable name="var1_resultof_createHealthcareService" as="node()?">
							<xsl:call-template name="user:createHealthcareService">
								<xsl:with-param name="OperationDefinition" as="node()">
									<Organization.OperationDefinition xmlns="urn:hl7-org:v3">
										<xsl:sequence select="(./@node(), ./node())"/>
									</Organization.OperationDefinition>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var1_resultof_createHealthcareService">
							<HealthcareService>
								<xsl:sequence select="(./@node(), ./node())"/>
							</HealthcareService>
						</xsl:for-each>
					</xsl:for-each>
				</contained>
			</xsl:for-each>
			<xsl:for-each select="$var14_assignedOrganization/ns0:assignedEntity">
				<xsl:variable name="var6_cur" as="node()" select="."/>
				<xsl:for-each select="ns0:assignedOrganization">
					<xsl:variable name="var5_idx" as="xs:integer" select="position()"/>
					<contained>
						<xsl:for-each select="$var6_cur/ns0:performance/ns0:actDefinition/ns0:code">
							<xsl:variable name="var4_cur" as="node()" select="."/>
							<xsl:for-each select="@code">
								<xsl:variable name="var2_resultof_vmf__inputtoresult" as="xs:string?">
									<xsl:call-template name="vmf:vmf1_inputtoresult">
										<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var2_resultof_vmf__inputtoresult">
									<xsl:variable name="var3_resultof_createOrganizationAffiliation" as="node()?">
										<xsl:call-template name="user:createOrganizationAffiliation">
											<xsl:with-param name="participatingId" select="fn:concat(fn:concat('#', .), xs:string($var5_idx))" as="xs:string"/>
											<xsl:with-param name="SimpleCD" as="node()">
												<Simple-CD xmlns="urn:hl7-org:v3">
													<xsl:call-template name="tbf:tbf1_Simple-CD">
														<xsl:with-param name="input" select="$var4_cur" as="node()"/>
													</xsl:call-template>
												</Simple-CD>
											</xsl:with-param>
										</xsl:call-template>
									</xsl:variable>
									<xsl:for-each select="$var3_resultof_createOrganizationAffiliation">
										<OrganizationAffiliation>
											<xsl:sequence select="(./@node(), ./node())"/>
										</OrganizationAffiliation>
									</xsl:for-each>
								</xsl:for-each>
							</xsl:for-each>
						</xsl:for-each>
					</contained>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var14_assignedOrganization/ns0:assignedEntity">
				<xsl:variable name="var12_cur" as="node()" select="."/>
				<xsl:for-each select="ns0:assignedOrganization">
					<xsl:variable name="var11_idx" as="xs:integer" select="position()"/>
					<xsl:variable name="var10_performance" as="node()*" select="$var12_cur/ns0:performance"/>
					<contained>
						<Organization>
							<id>
								<xsl:for-each select="$var10_performance/ns0:actDefinition/ns0:code/@code">
									<xsl:variable name="var7_resultof_vmf__inputtoresult" as="xs:string?">
										<xsl:call-template name="vmf:vmf2_inputtoresult">
											<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
										</xsl:call-template>
									</xsl:variable>
									<xsl:for-each select="$var7_resultof_vmf__inputtoresult">
										<xsl:attribute name="value" namespace="" select="fn:concat(., xs:string($var11_idx))"/>
									</xsl:for-each>
								</xsl:for-each>
							</id>
							<xsl:for-each select="ns0:id">
								<identifier>
									<system>
										<xsl:for-each select="@root">
											<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:concat('urn:oid:', fn:string(.))))"/>
										</xsl:for-each>
									</system>
									<value>
										<xsl:for-each select="@extension">
											<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
										</xsl:for-each>
									</value>
								</identifier>
							</xsl:for-each>
							<type>
								<coding>
									<system>
										<xsl:attribute name="value" namespace="" select="$var15_http___hl__org_fhir_us_spl_Cod_as_string"/>
									</system>
									<code>
										<xsl:for-each select="$var10_performance/ns0:actDefinition/ns0:code/@code">
											<xsl:variable name="var8_resultof_vmf__inputtoresult" as="xs:string?">
												<xsl:call-template name="vmf:vmf2_inputtoresult">
													<xsl:with-param name="input" select="fn:string(.)" as="xs:string"/>
												</xsl:call-template>
											</xsl:variable>
											<xsl:for-each select="$var8_resultof_vmf__inputtoresult">
												<xsl:attribute name="value" namespace="" select="."/>
											</xsl:for-each>
										</xsl:for-each>
									</code>
								</coding>
							</type>
							<xsl:for-each select="ns0:name">
								<name>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</name>
							</xsl:for-each>
							<xsl:for-each select="ns0:telecom">
								<xsl:variable name="var9_resultof_parseTelecom" as="node()?">
									<xsl:call-template name="user:parseTelecom">
										<xsl:with-param name="SimpleTEL" as="node()">
											<Simple-TEL xmlns="urn:hl7-org:v3">
												<xsl:sequence select="(./@node(), ./node())"/>
											</Simple-TEL>
										</xsl:with-param>
									</xsl:call-template>
								</xsl:variable>
								<xsl:for-each select="$var9_resultof_parseTelecom">
									<telecom>
										<xsl:sequence select="(./@node(), ./node())"/>
									</telecom>
								</xsl:for-each>
							</xsl:for-each>
						</Organization>
					</contained>
				</xsl:for-each>
			</xsl:for-each>
			<xsl:for-each select="$var14_assignedOrganization/ns0:id">
				<identifier>
					<system>
						<xsl:for-each select="@root">
							<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:concat('urn:oid:', fn:string(.))))"/>
						</xsl:for-each>
					</system>
					<value>
						<xsl:for-each select="@extension">
							<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
						</xsl:for-each>
					</value>
				</identifier>
			</xsl:for-each>
			<type>
				<coding>
					<system>
						<xsl:attribute name="value" namespace="" select="$var15_http___hl__org_fhir_us_spl_Cod_as_string"/>
					</system>
					<code>
						<xsl:attribute name="value" namespace="" select="'Establishment'"/>
					</code>
				</coding>
			</type>
			<name>
				<xsl:for-each select="($var14_assignedOrganization/ns0:name/node())[fn:boolean(self::text())]">
					<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
				</xsl:for-each>
			</name>
			<xsl:for-each select="$var14_assignedOrganization/ns0:addr">
				<address>
					<xsl:for-each select="ns0:streetAddressLine">
						<line>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</line>
					</xsl:for-each>
					<xsl:for-each select="ns0:city">
						<city>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</city>
					</xsl:for-each>
					<xsl:for-each select="ns0:state">
						<state>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</state>
					</xsl:for-each>
					<xsl:for-each select="ns0:postalCode">
						<postalCode>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</postalCode>
					</xsl:for-each>
					<xsl:for-each select="ns0:country">
						<country>
							<xsl:for-each select="(./node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</country>
					</xsl:for-each>
				</address>
			</xsl:for-each>
			<xsl:for-each select="$var14_assignedOrganization/ns0:contactParty">
				<contact>
					<name>
						<text>
							<xsl:for-each select="(./ns0:contactPerson/ns0:name/node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</text>
					</name>
					<xsl:for-each select="ns0:telecom">
						<xsl:variable name="var13_resultof_parseTelecom" as="node()?">
							<xsl:call-template name="user:parseTelecom">
								<xsl:with-param name="SimpleTEL" as="node()">
									<Simple-TEL xmlns="urn:hl7-org:v3">
										<xsl:sequence select="(./@node(), ./node())"/>
									</Simple-TEL>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var13_resultof_parseTelecom">
							<telecom>
								<xsl:sequence select="(./@node(), ./node())"/>
							</telecom>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns0:addr">
						<address>
							<xsl:for-each select="ns0:streetAddressLine">
								<line>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</line>
							</xsl:for-each>
							<xsl:for-each select="ns0:city">
								<city>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</city>
							</xsl:for-each>
							<xsl:for-each select="ns0:state">
								<state>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</state>
							</xsl:for-each>
							<xsl:for-each select="ns0:postalCode">
								<postalCode>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</postalCode>
							</xsl:for-each>
							<xsl:for-each select="ns0:country">
								<country>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</country>
							</xsl:for-each>
						</address>
					</xsl:for-each>
				</contact>
			</xsl:for-each>
		</Organization>
	</xsl:template>
	<xsl:template name="user:parseTelecom">
		<xsl:param name="SimpleTEL" select="()"/>
		<xsl:variable name="var3_value" as="node()?" select="$SimpleTEL/@value"/>
		<ContactPoint xmlns="http://hl7.org/fhir">
			<system>
				<xsl:for-each select="$var3_value">
					<xsl:attribute name="value" namespace="">
						<xsl:call-template name="vmf:vmf3_inputtoresult">
							<xsl:with-param name="input" select="fn:substring-before(xs:string(xs:anyURI(fn:string(.))), ':')" as="xs:string"/>
						</xsl:call-template>
					</xsl:attribute>
				</xsl:for-each>
			</system>
			<value>
				<xsl:for-each select="$var3_value">
					<xsl:variable name="var2_cur_as_string" as="xs:string" select="xs:string(xs:anyURI(fn:string(.)))"/>
					<xsl:variable name="var1_resultof_vmf__inputtoresult" as="xs:string">
						<xsl:call-template name="vmf:vmf3_inputtoresult">
							<xsl:with-param name="input" select="fn:substring-before($var2_cur_as_string, ':')" as="xs:string"/>
						</xsl:call-template>
					</xsl:variable>
					<xsl:attribute name="value" namespace="">
						<xsl:choose>
							<xsl:when test="($var1_resultof_vmf__inputtoresult = 'url')">
								<xsl:sequence select="$var2_cur_as_string"/>
							</xsl:when>
							<xsl:otherwise>
								<xsl:sequence select="fn:substring-after($var2_cur_as_string, ':')"/>
							</xsl:otherwise>
						</xsl:choose>
					</xsl:attribute>
				</xsl:for-each>
			</value>
		</ContactPoint>
	</xsl:template>
	<xsl:template name="user:createRegistrant">
		<xsl:param name="RegistrantOrganization" select="()"/>
		<Organization xmlns="http://hl7.org/fhir">
			<xsl:for-each select="$RegistrantOrganization/ns0:id">
				<identifier>
					<system>
						<xsl:for-each select="@root">
							<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:concat('urn:oid:', fn:string(.))))"/>
						</xsl:for-each>
					</system>
					<value>
						<xsl:for-each select="@extension">
							<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
						</xsl:for-each>
					</value>
				</identifier>
			</xsl:for-each>
			<type>
				<coding>
					<system>
						<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI('http://hl7.org/fhir/us/spl/CodeSystem/codesystem-organizationTypes'))"/>
					</system>
					<code>
						<xsl:attribute name="value" namespace="" select="'EstablishmentRegistrant'"/>
					</code>
				</coding>
			</type>
			<name>
				<xsl:for-each select="($RegistrantOrganization/ns0:name/node())[fn:boolean(self::text())]">
					<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
				</xsl:for-each>
			</name>
			<xsl:for-each select="$RegistrantOrganization/ns0:contactParty">
				<contact>
					<name>
						<text>
							<xsl:for-each select="(./ns0:contactPerson/ns0:name/node())[fn:boolean(self::text())]">
								<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
							</xsl:for-each>
						</text>
					</name>
					<xsl:for-each select="ns0:telecom">
						<xsl:variable name="var1_resultof_parseTelecom" as="node()?">
							<xsl:call-template name="user:parseTelecom">
								<xsl:with-param name="SimpleTEL" as="node()">
									<Simple-TEL xmlns="urn:hl7-org:v3">
										<xsl:sequence select="(./@node(), ./node())"/>
									</Simple-TEL>
								</xsl:with-param>
							</xsl:call-template>
						</xsl:variable>
						<xsl:for-each select="$var1_resultof_parseTelecom">
							<telecom>
								<xsl:sequence select="(./@node(), ./node())"/>
							</telecom>
						</xsl:for-each>
					</xsl:for-each>
					<xsl:for-each select="ns0:addr">
						<address>
							<xsl:for-each select="ns0:streetAddressLine">
								<line>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</line>
							</xsl:for-each>
							<xsl:for-each select="ns0:city">
								<city>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</city>
							</xsl:for-each>
							<xsl:for-each select="ns0:state">
								<state>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</state>
							</xsl:for-each>
							<xsl:for-each select="ns0:postalCode">
								<postalCode>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</postalCode>
							</xsl:for-each>
							<xsl:for-each select="ns0:country">
								<country>
									<xsl:for-each select="(./node())[fn:boolean(self::text())]">
										<xsl:attribute name="value" namespace="" select="fn:string(.)"/>
									</xsl:for-each>
								</country>
							</xsl:for-each>
						</address>
					</xsl:for-each>
				</contact>
			</xsl:for-each>
		</Organization>
	</xsl:template>
	<xsl:template name="vmf:vmf1_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='C73330'">
				<xsl:copy-of select="'USAgent'"/>
			</xsl:when>
			<xsl:when test="$input='C73599'">
				<xsl:copy-of select="'Importer'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf2_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='C73330'">
				<xsl:copy-of select="'USAgent'"/>
			</xsl:when>
			<xsl:when test="$input='C73599'">
				<xsl:copy-of select="'Importer'"/>
			</xsl:when>
		</xsl:choose>
	</xsl:template>
	<xsl:template name="vmf:vmf3_inputtoresult">
		<xsl:param name="input" select="()"/>
		<xsl:choose>
			<xsl:when test="$input='tel'">
				<xsl:copy-of select="'phone'"/>
			</xsl:when>
			<xsl:when test="$input='mailto'">
				<xsl:copy-of select="'email'"/>
			</xsl:when>
			<xsl:when test="$input='fax'">
				<xsl:copy-of select="'fax'"/>
			</xsl:when>
			<xsl:otherwise>
				<xsl:copy-of select="'url'"/>
			</xsl:otherwise>
		</xsl:choose>
	</xsl:template>
	<xsl:output method="xml" encoding="UTF-8" byte-order-mark="no" indent="yes"/>
	<xsl:template match="/">
		<Bundle xmlns="http://hl7.org/fhir" xmlns:xhtml="http://www.w3.org/1999/xhtml">
			<xsl:for-each select="ns0:document">
				<xsl:variable name="var3_author" as="node()*" select="ns0:author"/>
				<type>
					<xsl:attribute name="value" namespace="" select="'collection'"/>
				</type>
				<xsl:for-each select="$var3_author/ns0:assignedEntity/ns0:representedOrganization/ns0:assignedEntity/ns0:assignedOrganization">
					<xsl:variable name="var1_resultof_createRegistrant" as="node()?">
						<xsl:call-template name="user:createRegistrant">
							<xsl:with-param name="RegistrantOrganization" as="node()">
								<EstablishmentRegistration.RegistrantOrganization xmlns="urn:hl7-org:v3">
									<xsl:sequence select="(./@node(), ./node())"/>
								</EstablishmentRegistration.RegistrantOrganization>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<entry>
						<resource>
							<xsl:for-each select="$var1_resultof_createRegistrant">
								<Organization>
									<xsl:sequence select="(./@node(), ./node())"/>
								</Organization>
							</xsl:for-each>
						</resource>
					</entry>
				</xsl:for-each>
				<xsl:for-each select="$var3_author/ns0:assignedEntity/ns0:representedOrganization/ns0:assignedEntity/ns0:assignedOrganization/ns0:assignedEntity">
					<xsl:variable name="var2_resultof_createEstablishmentOrganization" as="node()?">
						<xsl:call-template name="user:createEstablishmentOrganization">
							<xsl:with-param name="EstablishmentOrganization" as="node()">
								<EstablishmentRegistration.EstablishmentEntity xmlns="urn:hl7-org:v3">
									<xsl:sequence select="(./@node(), ./node())"/>
								</EstablishmentRegistration.EstablishmentEntity>
							</xsl:with-param>
						</xsl:call-template>
					</xsl:variable>
					<entry>
						<resource>
							<xsl:for-each select="$var2_resultof_createEstablishmentOrganization">
								<Organization>
									<xsl:sequence select="(./@node(), ./node())"/>
								</Organization>
							</xsl:for-each>
						</resource>
					</entry>
				</xsl:for-each>
			</xsl:for-each>
		</Bundle>
	</xsl:template>
</xsl:stylesheet>