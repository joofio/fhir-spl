Profile: SubmittedMedicinalProduct
Parent: MedicinalProductDefinition
Description: "A profile that allows for the submission of Medicinal Product information to the FDA."
* identifier 1..* MS
* identifier.system 1..1 MS
* identifier.value 1..1 MS
* identifier ^slicing.discriminator.type = #value
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier ^slicing.description = "Require specific types of identifiers."
* identifier contains NDCCode 1..1 MS
* identifier[NDCCode].system = "http://hl7.org/fhir/sid/ndc"

* name 1..* MS
* name.productName 1..1 MS
* name.type 1..1 MS
* name ^slicing.discriminator.type = #value
* name ^slicing.discriminator.path = "type"
* name ^slicing.rules = #open
* name ^slicing.description = "Require specific name types"
* name contains Proprietary 1..1 and NonProprietary 0..1
* name[Proprietary].type = SubmittedMedicinalProductNameTypes#PROPRIETARY
* name[Proprietary].part 0..* MS
* name[Proprietary].part.part 1..1 MS
* name[Proprietary].part.type 1..1 MS
* name[Proprietary].part ^slicing.discriminator.type = #value
* name[Proprietary].part ^slicing.discriminator.path = "type"
* name[Proprietary].part ^slicing.rules = #open
* name[Proprietary].part ^slicing.description = "Specifically call out the Suffix name part"
* name[Proprietary].part contains Suffix 0..1
* name[Proprietary].part[Suffix].type = http://terminology.hl7.org/CodeSystem/v3-EntityNamePartQualifierR2#SFX
* name[NonProprietary].type = SubmittedMedicinalProductNameTypes#NONPROPRIETARY

* crossReference 0..1 MS
* crossReference.type 1..1 MS
* crossReference.type = $NCI-T#C64637
* crossReference.product 1..1 MS
* crossReference.product from AllNDCProducts
* crossReference.product.concept 1..1 MS
* crossReference.product.reference 0..0
* route 0..* MS
* route from http://evs.nci.nih.gov/valueset/FDA/C54455 (required)
* marketingStatus 0..1 MS
* marketingStatus.dateRange 1..1 MS
* specialMeasures 0..* MS
* specialMeasures from http://evs.nci.nih.gov/valueset/FDA/C54459 (required)
* operation 0..* MS
* operation.type.concept 1..1 MS
* operation.type from http://evs.nci.nih.gov/valueset/FDA/C73600 (required)
* operation.organization 1..1 MS
* operation.organization only Reference(IdentifiedEstablishment)

Profile: SubmittedMedicinalProductMarketing
Parent: RegulatedAuthorization
Description: "Details around the marketing of a submitted medicinal product."
* identifier 1..* MS
* subject 1..1 MS
* subject only Reference(SubmittedMedicinalProduct)
* subject.extension contains ManufacturedItemReference named itemReference 0..1 MS
* type 0..1 MS
* region 0..* MS
* status MS
* statusDate MS

Extension: ManufacturedItemReference
Id: manufacturedItemReference
Title: "Manufactured Item Reference"
Description: "A reference to a manufactured item currently used in authorizations."
* value[x] 1..1 MS
* value[x] only Reference(SubmittedManufacturedItem)

Profile: SubmittedMedicinalPackaging
Parent: PackagedProductDefinition
Description: "Details around the packaging of submitted medicinal products."
* packageFor 1..1 MS
* packageFor only Reference(SubmittedMedicinalProduct)
* marketingStatus 0..1 MS
* marketingStatus.dateRange 1..1 MS
* packaging 1..1 MS
* packaging.identifier MS
* packaging.type 1..1 MS
* packaging.quantity 0..1 MS
* packaging.property 0..* MS
* packaging.property.type 1..1 MS
* packaging.property.value[x] 1..1 MS
* packaging.containedItem 0..* MS
* packaging.containedItem.item 1..1 MS
* packaging.containedItem.item only CodeableReference(SubmittedManufacturedItem)
* packaging.containedItem.amount 1..1 MS
* packaging.packaging 0..* MS

Profile: SubmittedManufacturedItem
Parent: ManufacturedItemDefinition
Description: "Details around the actual item, i.e tablet, solution, etc. that is packaged as part of the medicinal product."
* status = #active
* manufacturedDoseForm 1..1 MS
* manufacturedDoseForm from http://evs.nci.nih.gov/valueset/FDA/C54456 (required)
* extension contains ItemMarketingStatusDates named marketingStatusDates 0..1 MS
* property 0..* MS
* property.type 1..1 MS
* property.type from SubmittedMedicinalProductCharacteristicTypes (required)
* property.value[x] 1..1 MS

Extension: ItemMarketingStatusDates
Id: itemMarketingStatusDates
Title: "Manufactured Item Marketing Status Date Range"
Description: "Used to indicate the date range of the marketing status of a manufactured item.  This is being added in R5."
* value[x] 1..1 MS
* value[x] only Period

Profile: SubmittedMedicinalProductIngredient
Parent: Ingredient
Description: "Details around the ingredients of a submitted medicinal product."
* status = #active
* for 1..1 MS
* for only Reference(SubmittedManufacturedItem)
* role 1..1 MS
* substance 1..1 MS
* substance.code 1..1 MS
* substance.code only CodeableReference(SubmittedIngredientDefinition)
* substance.strength 0..1 MS
* substance.strength.presentation[x] 1..1 MS
* substance.strength.presentation[x] only Ratio
* substance.strength.referenceStrength 0..1 MS
* substance.strength.referenceStrength.substance 1..1 MS
* substance.strength.referenceStrength.substance.concept 1..1 MS
* substance.strength.referenceStrength.substance.reference 0..0
* substance.strength.referenceStrength.strength[x] 1..1 MS
* substance.strength.referenceStrength.strength[x] only Ratio

Profile: SubmittedIngredientDefinition
Parent: SubstanceDefinition
Description: "Used to represent an substance's active moiety."
* identifier 1..* MS
* name 1..1 MS
* name.name 1..1 MS
* moiety 1..2 MS
* moiety.identifier 1..1 MS
* moiety.name 1..1 MS


CodeSystem: SubmittedMedicinalProductNameTypes
Id: codesystem-submittedMedicinalProductNameTypes
Title: "Medicinal Product Name Types"
Description: "Codes that types of names for a medicinal product."
* ^caseSensitive = true
* ^experimental = false
* #PROPRIETARY "Proprietary Name"
* #NONPROPRIETARY "Generic Name (Non-Proprietary)"

CodeSystem: SubmittedMedicinalProductCharacteristicTypes
Id: codesystem-characteristicTypes
Title: "SPL Product Characteristic Types"
Description: "Codes that were specified in the SPL guide for characteristic types."
* ^caseSensitive = false
* ^experimental = false
* #SPLCOLOR "Color"
* #SPLIMPRINT "Imprint"
* #SPLSCORE "Score"
* #SPLSHAPE "Shape"
* #SPLSIZE "Size"
* #SPLCMBPRDTP "Combination Product Type"

ValueSet: SubmittedMedicinalProductCharacteristicTypes
Id: valueset-SubmittedMedicinalProductCharacteristicTypes
Description: "Codes that identify the types of characteristics allowed for Submitted Medicinal Product."
Title: "SPL Product Characteristic Types"
* ^experimental = false
* include codes from system SubmittedMedicinalProductCharacteristicTypes

ValueSet: AllNDCProducts
Id: valueset-AllNDCProducts
Description: "A value set that is all of the NDC codesystem, i.e. all NDC products"
Title: "All NDC Products"
* ^experimental = false
* include codes from system http://hl7.org/fhir/sid/ndc