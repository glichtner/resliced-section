Alias: $cs-example = http://example.com

Profile: MyParentProfile
Parent: Composition
Id: my-parent-profile
Title: "Parent Profile"
Description: "A parent profile for testing purposes."
* type 1..1 
* type = $cs-example#parent-profile "Parent Profile"

* section ^slicing.discriminator.type = #value
* section ^slicing.discriminator.path = "code"
* section ^slicing.rules = #open
* section contains firstLevel 1..1
* section[firstLevel]
  * code 1..1
  * code = $cs-example#first-level "First Level"
  * section ^slicing.discriminator.type = #value
  * section ^slicing.discriminator.path = "code"
  * section ^slicing.rules = #open
  * section contains secondLevel_A 0..1
  * section[secondLevel_A]
    * code 1..1
    * code = $cs-example#second-level-a "Second Level A"

Profile: MyChildProfile
Parent: my-parent-profile
Id: my-child-profile
Title: "Child Profile"
Description: "A child profile for testing purposes."
* section[firstLevel]
  * section contains secondLevel_B 0..1
  * section[secondLevel_B]
    * code 1..1
    * code = $cs-example#second-level-b "Second Level B"

Instance: MyChildInstance
InstanceOf: my-child-profile
Usage: #example
Title: "Child Instance"
Description: "A child instance for testing purposes."
* status = #final
* author[+].reference = "Practitioner/example"
* date = "2025-03-06"
* title = "Example Child Instance"
* section[firstLevel]
  * section[secondLevel_A]
    * entry.reference = "Observation/example"

