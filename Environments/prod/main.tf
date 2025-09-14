module "rg" {
  source      = "../../Modules/azurerm_resource_group"
  rg_name     = "rg-prod-todoapp"
  rg_location = "centralindia"
  rg_tags = {
    managedBy   = "Terraform"
    owner       = "TodoAppTeam"
    Environment = "prod"
  }
}

module "acr" {
  source   = "../../Modules/azurerm_container_registry"
  acr_name = "acr-prod-todoapp"
  rg_name  = "rg-prod-todoapp"
  location = "centralindia"
  tags = {
    managedBy   = "Terraform"
    owner       = "TodoAppTeam"
    Environment = "prod"
  }
}

module "sql_server" {
  source          = "../../Modules/azurerm_sql_server"
  sql_server_name = "sql-prod-todoapp"
  rg_name         = "rg-prod-todoapp"
  location        = "centralindia"
  admin_username  = "prodopsadmin"
  admin_password  = "prod@1234" # <-- yaha galti thi, ab sahi double quotes
  tags = {
    managedBy   = "Terraform"
    owner       = "TodoAppTeam"
    Environment = "prod"
  }
}

module "sql_db" {
  source      = "../../Modules/azurerm_sql_database"
  sql_db_name = "sqldb-prod-todoapp" # <-- missing closing quote tha
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags = {
    managedBy   = "Terraform"
    owner       = "TodoAppTeam"
    Environment = "prod"
  }
}

module "aks" {
  source     = "../../Modules/azurerm_kubernetes_cluster"
  aks_name   = "aks-prod-todoapp"
  location   = "centralindia"
  rg_name    = "rg-prod-todoapp" # <-- yaha quotes missing the
  dns_prefix = "aks-prod-todoapp"
  tags = {
    managedBy   = "Terraform"
    owner       = "TodoAppTeam"
    Environment = "prod"
  }
}




 module "pip" {
   source    = "../../Modules/azurerm_public_ip"
   pip_name  = "pip-prod-todoapp"
   rg_name   = "rg-prod-todoapp"
   location  = "centralindia"
   sku       = "Standard"
   tags = {
     managedBy   = "Terraform"
     owner       = "TodoAppTeam"
     Environment = "prod"
   }
   
 }