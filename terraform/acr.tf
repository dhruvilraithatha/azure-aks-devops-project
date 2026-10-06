resource "azurerm_container_registry" "acr" {
  name                = "dhruvilakslearningacr2026"
  resource_group_name = azurerm_resource_group.aks.name
  location            = azurerm_resource_group.aks.location
  sku                 = "Basic"
  admin_enabled       = false
}
