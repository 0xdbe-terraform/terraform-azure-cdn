variable "azure_location" {
  type        = string
  default     = "eastus"
  description = "Location of the resource in Azure (default: 'eastus', less expensive location)"
}

variable "environment_name" {
  type        = string
  description = "Name of the environment (example: dev, test, prod, ...)"
}

variable "project_name" {
  type        = string
  description = "Name of your project, application, product or service."
}

variable "resource_group_name" {
  type        = string
  description = "Name of the Ressource Group in which the storage will be"
}

variable "network_name" {
  type        = string
  description = "Name of the Network"
  default     = "Microsoft"
  validation {
    condition     = contains(["Microsoft","Verizon","Akamai"],var.network_name)
    error_message = "Valid network name are Micorosoft, Verizon, Akamai."
  }
}

variable "sku" {
  type        = string
  description = "Name of the Network"
  default     = "Standard"
  validation {
    condition     = contains(["Standard","Premium"],var.sku)
    error_message = "Valid SKU name are Standard or Premium."
  }
}

variable "origin_host_name" {
  type        = string
  description = "A string that determines the hostname/IP address of the origin serve."
}
