terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
  #   backend "azurerm" {
  #     resource_group_name  = ""
  #     storage_account_name = ""
  #     container_name       = ""
  #     key                  = ""
  #   }
}

provider "azurerm" {
  features {}
  subscription_id = "01b89ee8-caef-4e87-ab38-ab8c27a7da58"
}