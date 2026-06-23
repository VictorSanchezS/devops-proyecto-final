output "url_api" {
  value = "http://${azurerm_container_group.api.fqdn}:8000"
}