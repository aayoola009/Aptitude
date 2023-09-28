variable "rg" {
  description = "Name of existing resource group in which service plan is to be created."
  type        = string
}

variable "location" {
  description = "Name of existing resource group in which service plan is to be created."
  type        = string
}

variable "asp" {
  description = "Name of existing resource group in which service plan is to be created."
  type        = string
}

variable "as" {
  description = "Name of existing resource group in which service plan is to be created."
  type        = string
}

variable "always_on_enabled" {
  description = "Should Always On be enabled for this web app?  Defaults to true."
  type = bool
  default = true
}

variable "ftps_state" {
  description = "The state of FTP/FTPS service.  Possible values are ['AllAllowed', 'FtpsOnly', 'Disabled'].  Defaults to Disabled"
  type = string
  default = "Disabled"
}

variable "http2_enabled" {
  description = "Should HTTP2 be enabled?  Defaults to true"
  type = bool
  default = true
}

variable "websockets_enabled" {
  description = "Should websockets be enabled?  Defaults to false."
  type = bool
  default = false
}

variable "health_check_path" {
  description = "The path to the web app health check route - defaults to empty string"
  type = string
  default = ""
}

variable "law" {
  description = "The path to the web app health check route - defaults to empty string"
  type = string
  default = ""
}

variable "sku_name" {
  description = "The path to the web app health check route - defaults to empty string"
  type = string
  default = ""
}

variable "sku" {
  description = "The path to the web app health check route - defaults to empty string"
  type = string
  default = ""
}
