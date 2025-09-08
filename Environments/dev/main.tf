module "rg" {
  source      = "../../Modules/azurerm_resource_group"
  rg_name     = "rg-dev-todoapp"
  rg_location = "centralindia"
  rg_tags = {
    managedBy   = "Terraform"
    owner       = "TodoAppTeam"
    Environment = "dev"
  }
}

# module "acr" {
#   source   = "../../Modules/azurerm_container_registry"
#   acr_name = "acr-dev-todoapp"
#   rg_name  = "rg-dev-todoapp"
#   location = "centralindia"
#   tags = {
#     managedBy   = "Terraform"
#     owner       = "TodoAppTeam"
#     Environment = "dev"
#   }
# }

# module "sql_server" {
#   source          = "../../Modules/azurerm_sql_server"
#   sql_server_name = "sql-dev-todoapp"
#   rg_name         = "rg-dev-todoapp"
#   location        = "centralindia"
#   admin_username  = "devopsadmin"
#   admin_password  = "dev@1234" # <-- yaha galti thi, ab sahi double quotes
#   tags = {
#     managedBy   = "Terraform"
#     owner       = "TodoAppTeam"
#     Environment = "dev"
#   }
# }

# module "sql_db" {
#   source      = "../../Modules/azurerm_sql_database"
#   sql_db_name = "sqldb-dev-todoapp" # <-- missing closing quote tha
#   server_id   = module.sql_server.server_id
#   max_size_gb = "2"
#   tags = {
#     managedBy   = "Terraform"
#     owner       = "TodoAppTeam"
#     Environment = "dev"
#   }
# }

# module "aks" {
#   source     = "../../Modules/azurerm_kubernetes_cluster"
#   aks_name   = "aks-dev-todoapp"
#   location   = "centralindia"
#   rg_name    = "rg-dev-todoapp" # <-- yaha quotes missing the
#   dns_prefix = "aks-dev-todoapp"
#   tags = {
#     managedBy   = "Terraform"
#     owner       = "TodoAppTeam"
#     Environment = "dev"
#   }
# }




 module "pip" {
   source    = "../../Modules/azurerm_public_ip"
   pip_name  = "pip-dev-todoapp"
   rg_name   = "rg-dev-todoapp"
   location  = "centralindia"
   sku       = "Standard"
   tags = {
     managedBy   = "Terraform"
     owner       = "TodoAppTeam"
     Environment = "dev"
   }
   
 }