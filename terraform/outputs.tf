output "url_api" {
  value = "http://${azurerm_container_group.api.fqdn}:8000"
}

output "acr_login_server" {
  value = azurerm_container_registry.acr.login_server
}