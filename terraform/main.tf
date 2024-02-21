terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.81.0"
    }
  }
}

provider "azurerm" {
  # Configuration options
  features {}

  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "Delme" {
  name     = "Delme"
  location = "West US"
}

### DEV - storage account & container
resource "azurerm_storage_account" "devsynapsedl2" {
  name                              = "devsynapsedl2"
  resource_group_name               = azurerm_resource_group.Delme.name
  location                          = azurerm_resource_group.Delme.location
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  is_hns_enabled                    = true
  cross_tenant_replication_enabled  = false
  tags = {
    environment = "DEV"
  }
}

resource "azurerm_storage_container" "dev-synapse-fs" {
  name                  = "dev-synapse-fs"
  storage_account_name  = azurerm_storage_account.devsynapsedl2.name
  container_access_type = "private"
  metadata = {
    "env" = "DEV"
  }
}

### TEST - storage account & container
resource "azurerm_storage_account" "testqasynapsedl2" {
  name                              = "testqasynapsedl2"
  resource_group_name               = azurerm_resource_group.Delme.name
  location                          = azurerm_resource_group.Delme.location
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  is_hns_enabled                    = true
  cross_tenant_replication_enabled  = false
  tags = {
    environment = "TEST"
  }
}

resource "azurerm_storage_container" "testqa-synapse-fs" {
  name                  = "testqa-synapse-fs"
  storage_account_name  = azurerm_storage_account.testqasynapsedl2.name
  container_access_type = "private"
  metadata = {
    "env" = "TEST"
  }
}


# resource "azurerm_storage_blob" "upload" {
#   name                   = "upload"
#   storage_account_name   = azurerm_storage_account.devsynapsedl2.name
#   storage_container_name = azurerm_storage_container.dev-synapse-fs.name
#   type                   = "Block"
#   #source                 = "upload"
#   content_type           = "application/octet-stream"
#   parallelism            = null #8
#   size                   = null #0 
#   metadata = {
#     hdi_isfolder = "true"
#   }
# }

# resource "azurerm_storage_blob" "just_folder" {
#   name                   = "example_folder/example_file"
#   storage_account_name   = azurerm_storage_account.devsynapsedl2.name
#   storage_container_name = azurerm_storage_container.dev-synapse-fs.name
#   type                   = "Block"
#   #   metadata = {
#   #   hdi_isfolder = "true"
#   # }
# }

# resource "azurerm_storage_blob" "just_folder2" {
#   name                   = "example_folder/example_file2"
#   storage_account_name   = azurerm_storage_account.devsynapsedl2.name
#   storage_container_name = azurerm_storage_container.dev-synapse-fs.name
#   type                   = "Block"
#   #   metadata = {
#   #   hdi_isfolder = "true"
#   # }
# }


# __generated__ by Terraform from "/subscriptions/ee04e0d4-c40f-44eb-b085-5c1a090f2e87/resourceGroups/Delme/providers/Microsoft.Synapse/workspaces/dev-synapse-workspace-1973"
resource "azurerm_synapse_workspace" "dev-synapse-workspace-1973" {
  aad_admin = [{
    login     = "andrey.v.molchanov_gmail.com#EXT#@andreyvmolchanovgmail.onmicrosoft.com"
    object_id = "f54a445e-9110-4f78-9a0e-e9c6716b8551"
    tenant_id = "5edd836b-8139-4f28-802b-b5fb9422bf6e"
  }]
  azuread_authentication_only          = false
  compute_subnet_id                    = null
  data_exfiltration_protection_enabled = false
  linking_allowed_for_aad_tenant_ids   = []
  location                             = "westus"
  managed_resource_group_name          = "Dev-synapse-managed-rg"
  managed_virtual_network_enabled      = true
  name                                 = "dev-synapse-workspace-1973"
  public_network_access_enabled        = true
  purview_id                           = null
  resource_group_name                  = azurerm_resource_group.Delme.name
  sql_aad_admin = [{
    login     = "andrey.v.molchanov_gmail.com#EXT#@andreyvmolchanovgmail.onmicrosoft.com"
    object_id = "f54a445e-9110-4f78-9a0e-e9c6716b8551"
    tenant_id = "5edd836b-8139-4f28-802b-b5fb9422bf6e"
  }]
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = null # sensitive
  sql_identity_control_enabled         = false
  storage_data_lake_gen2_filesystem_id = "https://devsynapsedl2.dfs.core.windows.net/dev-synapse-fs"
  tags = {
    env   = "Dev"
    owner = "Andrei Malchanau"
  }
  github_repo {
    account_name = "andrey-v-molchanov"
    branch_name  = "Development"
    git_url        = "https://github.com"
    last_commit_id  = "2dd267e04a6ba038fbccdd5d9bd1f65fdcbbfe50"
    repository_name = "synapse"
    root_folder     = "/"
  }                                                                        
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
}

# __generated__ by Terraform from "/subscriptions/ee04e0d4-c40f-44eb-b085-5c1a090f2e87/resourceGroups/Delme/providers/Microsoft.Synapse/workspaces/testqa-synapse-workspace-1973"
resource "azurerm_synapse_workspace" "testqa-synapse-workspace-1973" {
  aad_admin = [{
    login     = "andrey.v.molchanov_gmail.com#EXT#@andreyvmolchanovgmail.onmicrosoft.com"
    object_id = "f54a445e-9110-4f78-9a0e-e9c6716b8551"
    tenant_id = "5edd836b-8139-4f28-802b-b5fb9422bf6e"
  }]
  azuread_authentication_only          = false
  compute_subnet_id                    = null
  data_exfiltration_protection_enabled = false
  linking_allowed_for_aad_tenant_ids   = []
  location                             = "westus"
  managed_resource_group_name          = "Test-synapse-managed-rg"
  managed_virtual_network_enabled      = true
  name                                 = "testqa-synapse-workspace-1973"
  public_network_access_enabled        = true
  purview_id                           = null
  resource_group_name                  = azurerm_resource_group.Delme.name
  sql_aad_admin = [{
    login     = "andrey.v.molchanov_gmail.com#EXT#@andreyvmolchanovgmail.onmicrosoft.com"
    object_id = "f54a445e-9110-4f78-9a0e-e9c6716b8551"
    tenant_id = "5edd836b-8139-4f28-802b-b5fb9422bf6e"
  }]
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = null # sensitive
  sql_identity_control_enabled         = false
  storage_data_lake_gen2_filesystem_id = "https://testqasynapsedl2.dfs.core.windows.net/testqa-synapse-fs"
  tags = {
    env   = "Test"
    owner = "Andrei Malchanau"
  }
  identity {
    identity_ids = []
    type         = "SystemAssigned"
  }
}
