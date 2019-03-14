variable "name" {
  default     = "sample-sp-tf2"
  description = "The display name for the service principal."
}

variable "enddate_relative" {
 default = "8760h"
 description = "Relative end date for service principal password"
}

variable "role_assignment_scope" {
 default = "/subscriptions/34r34f489-d0ee-4aa6-843b-38a0f423a0a3"
 description = "Scope to which the role assignment is made"
}
