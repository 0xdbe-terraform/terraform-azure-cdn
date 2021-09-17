resource "random_integer" "main" {
  min     = 1
  max     = 999
}

resource "azurerm_cdn_profile" "main" {
  name                = "cdn-${substr(lower(replace(var.project_name," ","-")),0,20)}-${lower(var.environment_name)}-${format("%000d",random_integer.main.result)}"
  location            = var.azure_location
  resource_group_name = var.resource_group_name
  sku                 = "${var.sku}_${var.network_name}"
}

resource "azurerm_cdn_endpoint" "main" {
  name                = "example"
  profile_name        = module.azurerm_cdn_profile.main.cdn_profile
  location            = var.azure_location
  resource_group_name = var.resource_group_name

  origin {
    name      = "example"
    host_name = var.origin_host_name
  }
}