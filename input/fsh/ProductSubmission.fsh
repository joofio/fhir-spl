Profile: ProductSubmissionBundle
Parent: Bundle
Description: "A profile that represents the Bundle that contains the Product Submission document."
* identifier 1..1 MS
* type MS
* type = #document
* timestamp 1..1 MS
* entry 2..*
* entry ^slicing.discriminator.type = #profile
* entry ^slicing.discriminator.path = "resource"
* entry ^slicing.rules = #open
* entry ^slicing.description = "The specific bundle entries that are needed for a Product Submission document."
* entry contains Composition 1..1 MS and Labeler 1..1 MS and Product 0..* MS
* entry[Composition].resource only ProductSubmissionDocument
* entry[Labeler].resource only IdentifiedLabeler
* entry[Product].resource only SubmittedMedicinalProduct


Profile: ProductSubmissionDocument
Parent: Composition
Description: "A profile that represents a document that is required for Product Submission to the FDA."

* extension contains VersionNumber named versionNumber 1..1 MS
* type MS
* type from SPLDocumentCodes (required)
* title MS
* identifier 1..1 MS
* author 1..1 MS
* author only Reference(IdentifiedLabeler)
* section 1..* MS
* section.extension contains SectionIdentifier named sectionID 0..1 MS and SectionEffectiveTime named sectionTime 0..1 MS
* section.code 1..1 MS
* section.code from SPLSectionCodes (required)
* section.title MS
* section.text MS
* section.entry MS
* section.section MS
* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section ^slicing.description = "Slice based on the different sections that are needed in a SPL document."
* section contains ProductSection 0..1 and LabelDisplay 0..1 and OtherSections 0..*
* section[ProductSection].entry 0..1 MS
* section[ProductSection].entry only Reference(SubmittedMedicinalProduct)
* section[ProductSection].code = http://loinc.org#48780-1 (exactly)
* section[ProductSection].title 0..0
* section[ProductSection].text 0..1
* section[LabelDisplay].entry 0..0
* section[LabelDisplay].code = http://loinc.org#51945-4 (exactly)
* section[LabelDisplay].text 1..1
* section[LabelDisplay].entry 0..0
* section[OtherSections].text 1..1
* section[OtherSections].entry 0..0

Extension: VersionNumber
Id: versionNumber
Description: "Adding a version number to documents."
* value[x] only string

Extension: SectionIdentifier
Id: sectionIdentifier
Description: "Providing an identifier for a section."
* value[x] only Identifier

Extension: SectionEffectiveTime
Id: sectionEffectiveTime
Description: "Providing an effective time for a section."
* value[x] only dateTime or Period
 
ValueSet: SPLSectionCodes
Id: splSectionCodes
Title: "SPL Section Codes"
Description: "Section Codes for SPL Product Submission documents"
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."
* include codes from system http://loinc.org where SYSTEM  = "FDA package insert"

ValueSet: SPLDocumentCodes
Id: splDocumentCodes
Title: "SPL Document Codes"
Description: "Document Codes for SPL Product Submission documents"
* ^copyright = "This material contains content from LOINC (http://loinc.org). LOINC is copyright © 1995-2020, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc."
* include codes from system http://loinc.org where SYSTEM = "FDA product label"
