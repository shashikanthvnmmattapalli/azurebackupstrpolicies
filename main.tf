terraform {
  experiments = [module_variable_optional_attrs]
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
    random = {
      source = "hashicorp/random"
      version = "~> 3.0"
    }
  }

}


provider "azurerm" {
  features {}
}
 



resource "azurerm_data_protection_backup_policy_blob_storage" "example" {
  name               = "demotest1"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  retention_duration = "P30D"
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example1" {
  name               = "demotest2"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  retention_duration = "P30D"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  vault_default_retention_duration = "P30D"
  retention_rule {
    name = "testrule"
    priority = 1
    criteria  {
         absolute_criteria = "FirstOfWeek"
    }
    life_cycle  {
        data_store_type = "VaultStore"
        duration        = "P4W"
        }
    }

  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example2" {
  name               = "demotest3"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  vault_default_retention_duration = "P30D"
  operational_default_retention_duration = "P40D"
  retention_rule {
    name = "testrule"
    priority = 1
    criteria  {
         absolute_criteria = "FirstOfWeek"
    }
    life_cycle  {
        data_store_type = "VaultStore"
        duration        = "P4W"
        }
    }

  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example3" {
  name               = "demotest4"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  vault_default_retention_duration = "P30D"
  retention_rule {
    name = "testrule"
    priority = 1
    criteria  {
         absolute_criteria = "FirstOfWeek"
    }
    life_cycle  {
        data_store_type = "VaultStore"
        duration        = "P4W"
        }
    }  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example4" {
  name               = "demotest5"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  retention_duration = null
  vault_default_retention_duration = "P30D"
  retention_rule {
    name = "testrule"
    priority = 1
    criteria  {
         absolute_criteria = "FirstOfWeek"
    }
    life_cycle  {
        data_store_type = "VaultStore"
        duration        = "P4W"
        }
    }  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example5" {
  name               = "demotest6"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  operational_default_retention_duration = "P40D"
  vault_default_retention_duration = "P30D"
  retention_rule {
    name = "testrule"
    priority = 1
    criteria  {
         absolute_criteria = "FirstOfWeek"
    }
    life_cycle  {
        data_store_type = "VaultStore"
        duration        = "P4W"
        }
    }  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example6" {
  name               = "demotest7"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  operational_default_retention_duration = null
  vault_default_retention_duration = "P30D"
  retention_rule {
    name = "testrule"
    priority = 1
    criteria  {
         absolute_criteria = "FirstOfWeek"
    }
    life_cycle  {
        data_store_type = "VaultStore"
        duration        = "P4W"
        }
    }  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "example7" {
  name               = "demotest8"
  vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
  time_zone          = "Coordinated Universal Time"
  backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
  operational_default_retention_duration = null
  vault_default_retention_duration = "P30D"
  
}

resource "azurerm_data_protection_backup_policy_blob_storage" "dynamic_policy" {
  for_each = { for policy in var.backup_policies : policy.name => policy }

  name                                 = each.value.name
  vault_id                             = each.value.vault_id
  time_zone                            = each.value.time_zone != null ? each.value.time_zone : null
  backup_repeating_time_intervals      = each.value.backup_repeating_time_intervals != null ? each.value.backup_repeating_time_intervals : null
  operational_default_retention_duration = each.value.operational_default_retention_duration != null ? each.value.operational_default_retention_duration : null
  vault_default_retention_duration     = each.value.vault_default_retention_duration != null ? each.value.vault_default_retention_duration : null

  dynamic "retention_rule" {
    for_each = each.value.retention_rules != null ? each.value.retention_rules : []
    content {
      name     = retention_rule.value.name
      priority = retention_rule.value.priority
      criteria {
        absolute_criteria       = retention_rule.value.criteria.absolute_criteria != null ? retention_rule.value.criteria.absolute_criteria : null
        days_of_month           = retention_rule.value.criteria.days_of_month != null ? retention_rule.value.criteria.days_of_month : null
        days_of_week            = retention_rule.value.criteria.days_of_week != null ? retention_rule.value.criteria.days_of_week : null
        months_of_year          = retention_rule.value.criteria.months_of_year != null ? retention_rule.value.criteria.months_of_year : null
        scheduled_backup_times  = retention_rule.value.criteria.scheduled_backup_times != null ? retention_rule.value.criteria.scheduled_backup_times : null
        weeks_of_month          = retention_rule.value.criteria.weeks_of_month != null ? retention_rule.value.criteria.weeks_of_month : null
      }
      life_cycle {
        data_store_type = retention_rule.value.life_cycle.data_store_type != null ? retention_rule.value.life_cycle.data_store_type : null
        duration        = retention_rule.value.life_cycle.duration != null ? retention_rule.value.life_cycle.duration : null
      }
    }
  }
}











  
  

