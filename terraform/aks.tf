resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-learning"
  location            = azurerm_resource_group.aks.location
  resource_group_name = azurerm_resource_group.aks.name
  dns_prefix          = "aks-learning"

default_node_pool {
  name           = "system"
  node_count     = 1
  vm_size        = "Standard_B2s_v2"
  vnet_subnet_id = azurerm_subnet.aks.id

  upgrade_settings {
    max_surge                  = "10%"
    drain_timeout_in_minutes  = 0
    node_soak_duration_in_minutes = 0
  }
}

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    service_cidr      = "10.1.0.0/16"
    dns_service_ip    = "10.1.0.10"
  }
}
