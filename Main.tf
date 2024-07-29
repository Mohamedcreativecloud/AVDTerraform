# Resource group creation
resource "azurerm_resource_group" "rg" {
  for_each = toset(var.resource_group_names)

  name     = each.value
  location = var.location
}


# Eventhub namespace
resource "azurerm_eventhub_namespace" "eventhub_namespace" {
  for_each            = azurerm_resource_group.rg
  resource_group_name = each.value.name
  location            = var.location
  name                = "${var.eventhub_namespace_prefix}-namespace"
  sku                 = var.eventhub_sku
  capacity            = var.eventhub_capacity

  # properties
  auto_inflate_enabled     = var.auto_inflate_enabled
  maximum_throughput_units = var.maximum_throughput_units
  zone_redundant           = var.zone_redundant

  # Required property for definding private access
  network_rulesets = [
    {
      default_action                 = "Deny"
      public_network_access_enabled  = false
      trusted_service_access_enabled = false
    }
  ]
}


resource "azurerm_eventhub" "eventhub" {
  for_each            = azurerm_resource_group.rg
  resource_group_name = each.value.name
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace[each.key].name
  name                = "${var.eventhub_namespace_prefix}-${each.key}"
  partition_count     = 1
  message_retention   = 7
}