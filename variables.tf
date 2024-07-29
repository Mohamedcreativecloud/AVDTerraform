variable "resource_group_names" {
  description = "rg names"
  type        = list(string)
}

# Location name
variable "location" {
  description = "Azure region for deployment"
  type        = string
}

# Eventhub namespace name
variable "eventhub_namespace_prefix" {
  description = "Eventhub namespace prefix"
  default     = "dev-evh"

  validation {
    condition     = contains(["dev-evh", "test-evh", "prod-evh"], var.eventhub_namespace_prefix)
    error_message = "The evh prefix must have the allowed prefix"
  }

}

# Eventhub sku
variable "eventhub_sku" {
  description = "Name of the eventhub sku"

  validation {
    condition     = contains(["Standard", "Basic", "Premium", "Dedicated"], var.eventhub_sku)
    error_message = "Invalid sku, valid sku's are: standard, basic, premium and dedicated. Please use with caution."
  }
}


# Eventhub properties
variable "eventhub_capacity" {
  description = "Throughput capacity of namespace"
  default     = 1
}

variable "auto_inflate_enabled" {
  description = "Determines if auto inflate enabled"
  default     = "false"

  validation {
    condition     = contains(["true", "false"], var.auto_inflate_enabled)
    error_message = "Auto inflate must be se to: true or false"
  }
}

variable "maximum_throughput_units" {
  description = "Maximum throughput units"
}

variable "zone_redundant" {
  description = "Determines zone redundancy"
}