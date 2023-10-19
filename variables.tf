variable "vdc_org_name" {
  description = "The name of the organization to use."
  type        = string
}

variable "vdc_name" {
  description = "The name of VDC to use."
  type        = string
  default     = null
}

variable "name" {
  description = "A unique name for the vApp."
  type        = string
}

variable "description" {
  description = "A description for the vApp, up to 256 characters."
  type        = string
  default     = null
}

variable "power_on" {
  description = "A boolean value stating if this vApp should be powered on. Works only on update when vApp already has VMs."
  type        = bool
  default     = false
}

variable "guest_properties" {
  description = "Key value map of vApp guest properties."
  type        = map(any)
  default     = null
}

variable "lease" {
  description = "A block to define port, port range and traffic type. Multiple can be used. See service_port and example for usage details."
  type = object({
    runtime_lease_in_sec = number # How long any of the VMs in the vApp can run before the vApp is automatically powered off or suspended. 0 means never expires (or maximum allowed by Org). Regular values accepted from 3600+.
    storage_lease_in_sec = number # How long the vApp is available before being automatically deleted or marked as expired. 0 means never expires (or maximum allowed by Org). Regular values accepted from 3600+.
  })
  default = null
}

variable "metadata_entry" {
  description = "A set of metadata entries to assign."
  type        = list(map(string))
  default     = []
}
