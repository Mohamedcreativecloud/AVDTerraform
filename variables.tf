variable "resource_group_location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "rg_name" {
  type        = string
  default     = "fw-hostedcf-pox-euw-avd-rg"
  description = "Name of the Resource group in which to deploy service objects"
}

variable "workspace" {
  type        = string
  description = "Name of the Azure Virtual Desktop workspace"
  default     = "AVD TF Workspace"
}

variable "hostpool" {
  type        = string
  description = "Name of the Azure Virtual Desktop host pool"
  default     = "AVD-TF-HP"
}

variable "rfc3339" {
  type        = string
  default     = "2023-03-23T07:03:06.519Z"
  description = "Registration token expiration"
}

variable "prefix" {
  type        = string
  default     = "mvi-dev-001"
  description = "Prefix of the name of the AVD machine(s)"
}
#ID for Hostpool    
variable "hostpool_id" {
  type        = string
  default     = ""
  description = "This is the hostpool ID"
}

variable "vm_size" {
  description = "Specifies the size of the virtual machine."
  default     = "Standard_D2s_v3"
}

variable "image_publisher" {
  description = "Image Publisher"
  default     = "MicrosoftWindowsDesktop"
}

variable "vm_image_Type" {
  description = "VM Gallery"
  default     = "Gallery"

}
variable "image_offer" {
  description = "Image Offer"
  default     = "Windows-11"
}

variable "image_sku" {
  description = "Image SKU"
  default     = "win11-22h2-avd"
}

variable "image_version" {
  description = "Image Version"
  default     = "latest"
}

variable "vm_count" {
  description = "Number of Session Host VMs to create"
  default     = "1"
}


variable "env" {
  description = "hub,prd,tst,dev,qa"
  default     = "prd"
}

variable "azurerm_network_interface" {
  description = "NIC"


}