#--------------
# Bastion Host
#--------------
variable "name" {
  description = "(Required) Specifies the name of the Bastion Host. Changing this forces a new resource to be created."
  type        = string
}

variable "location" {
  description = " (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created."
  type        = string
}

variable "resource_group_name" {
  description = "(Required) The name of the resource group in which to create the Bastion Host. Changing this forces a new resource to be created."
  type        = string
}

variable "copy_paste_enabled" {
  description = "(Optional) Is Copy/Paste feature enabled for the Bastion Host. Defaults to true."
  type        = bool
  default     = true
}

variable "file_copy_enabled" {
  description = "(Optional) Is File Copy feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "sku" {
  description = "(Optional) The SKU of the Bastion Host. Accepted values are Developer, Basic, Standard and Premium. Defaults to Basic."
  type        = string
  default     = "Basic"
}

variable "ip_configuration" {
  description = "(Optional) A ip_configuration block"
  type        = any
  default     = {}
}

variable "ip_connect_enabled" {
  description = "(Optional) Is IP Connect feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "kerberos_enabled" {
  description = "(Optional) Is Kerberos authentication feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "scale_units" {
  description = "(Optional) The number of scale units with which to provision the Bastion Host. Possible values are between 2 and 50. Defaults to 2."
  type        = number
  default     = 2
}

variable "shareable_link_enabled" {
  description = "(Optional) Is Shareable Link feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "tunneling_enabled" {
  description = "(Optional) Is Tunneling feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "session_recording_enabled" {
  description = "(Optional) Is Session Recording feature enabled for the Bastion Host. Defaults to false."
  type        = bool
  default     = false
}

variable "virtual_network_id" {
  description = "(Optional) The ID of the Virtual Network for the Developer Bastion Host. Changing this forces a new resource to be created."
  type        = string
  default     = null
}

variable "zones" {
  description = "(Optional) Specifies a list of Availability Zones in which this Public Bastion Host should be located. Changing this forces a new resource to be created."
  type        = list(any)
  default     = []
}

variable "tags" {
  description = "(Optional) A mapping of tags to assign to the resource."
  type        = map(any)
  default     = {}
}