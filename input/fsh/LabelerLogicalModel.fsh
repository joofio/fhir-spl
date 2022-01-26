Logical: LabelerCodeRequestLogicalModel
Parent: Element
Id: LabelerCodeRequestLogicalModel
Title: "NDC Labeler Code Request Logical Model"
Description: "An operation to request a NDC Labeler code for a registrant or private Labeler organization."

* operationId 1..1 string "Operation Identifier" "A unique identifier of an instance of a Labeler Code Request operation."
* operationEffectiveTime 1..1 dateTime "Operation Effective Time" "The time when this request operation was created."
* requestId 1..1 string "Request Identifier" "A unique identifier of a specific group of Labeler Code Request operations."
* requestVersion 1..1 string "Request Version Number" "A string identifying a specific version of the Labeler Code Request operation group."
* labeler 1..1 BackboneElement "Labeler" "The organization that is requesting the NDC Labeler Code."
  * dunsNumber 1..1 string "Labeler DUNS Number" "The Dun & Bradstreet number assigned to the Labeler organization headquarters."
  * labelerCode 0..1 string "NDC Labeler Code" "The NDC Labeler code assigned by the FDA to Labeler organization."
  * name 1..1 string "Labeler Name" "The business name of the Labeler organization."
  * address 0..1 Address "Labeler Address" "The Labeler organization's address."
  * contactParty 1..1 BackboneElement "Labeler Contact Party" "The person at the Labeler Organization to contact about this Labeler request."
    * name 1..1 string "Labeler Contact Party Name" "The name of the Labeler contact person."
    * telephone 1..1 ContactPoint "Labeler Contact Party Telephone Number" "The telephone number for the Labeler contact person."
    * email 1..1 ContactPoint "Labeler Contact Party Email Address" "The email address for the organization acting as the Labeler contact person."
  * usAgent 1..1 BackboneElement "Labeler US Agent" "An organization that acts on the behalf of a Labeler that is not located in the US."
    * dunsNumber 1..1 string "Labeler US Agent DUNS Number" "The Dun & Bradstreet number assigned to the organization acting as the labeler's US agent."
    * name 1..1 string "Labeler US Agent Name" "The name of the organization acting as the Labeler's US agent."
    * telephone 1..1 ContactPoint "Labeler US Agent Telephone Number" "The telephone number for the Labeler's US agent."
    * email 1..1 ContactPoint "Labeler US Agent Email Address" "The email address for the organization acting as the Labeler's US agent."
  * businessOperation 1..* BackboneElement "Labeler Business Operations" "Various business operations that the Labeler organization performs."
    * code 1..1 CodeableConcept "Business Operation Type" "A code representing the specific business operation that the Labeler organization can perform."
    * qualifier 0..2 CodeableConcept "Business Operation Qualifier" "A code that gives more information about the business operation that the Labeler organization can perform."
