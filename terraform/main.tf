terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = var.nombre_grupo
  location = var.ubicacion
}

resource "azurerm_container_group" "api" {
  name                = "devops-proyecto-final"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  os_type             = "Linux"
  ip_address_type     = "Public"
  dns_name_label      = "devops-proyecto-victor"

  container {
    name   = "api"
    image  = "vitukuak/devops-proyecto-final:latest"
    cpu    = "0.5"
    memory = "1.5"

    ports {
      port     = 8000
      protocol = "TCP"
    }

    environment_variables = {
      DATABASE_URL = "postgresql://usuario:password@localhost:5432/midb"
    }
  }
}