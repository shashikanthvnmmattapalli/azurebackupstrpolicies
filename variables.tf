variable "backup_policies" {
  description = "A list of backup policies, each with its own configuration."
  type = list(object({
    name                                = optional(string)
    vault_id                            = optional(string)
    time_zone                           = optional(string)
    backup_repeating_time_intervals     = optional(list(string))
    operational_default_retention_duration = optional(string)
    vault_default_retention_duration    = optional(string)
    retention_rules = optional(list(object({
      name                     = optional(string)
      priority                 = optional(number)
      criteria                 = optional(object({
            absolute_criteria        = optional(string)
            days_of_month            = optional(list(number))
            days_of_week             = optional(list(string))
            months_of_year           = optional(list(string))
            scheduled_backup_times   = optional(list(string))
            weeks_of_month           = optional(list(number))
      }))     

      life_cycle  = optional(object({
        data_store_type = string
        duration        = string
        }))

    })))
  }))
  default = [

    {
        name = "demo9"
        vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
        operational_default_retention_duration = "P40D"


    },
      {
        name = "demo10"
        vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
        operational_default_retention_duration = "P40D"
        vault_default_retention_duration = "P30D"
        time_zone          = "Coordinated Universal Time"
        backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]

    },
     {
        name = "demo11"
        vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
        operational_default_retention_duration = "P40D"
        vault_default_retention_duration = "P30D"
        time_zone          = "Coordinated Universal Time"
        backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
        retention_rules =[
            {
                name = "Weekly"
                priority = 1
                criteria = {
                    absolute_criteria = "FirstOfWeek"
                }

                life_cycle ={
                    data_store_type = "VaultStore"
                    duration        = "P4W"
                }
            }
        ]

    },
    {
        name = "demo12"
        vault_id           = "/subscriptions/84483ccc-23ad-4d1d-96b4-f97731df8a23/resourceGroups/demo/providers/Microsoft.DataProtection/backupVaults/demo"
        operational_default_retention_duration = "P40D"
        vault_default_retention_duration = "P30D"
        time_zone          = "Coordinated Universal Time"
        backup_repeating_time_intervals = ["R/2024-08-25T22:30:00Z/P1W"]
        retention_rules =[
            {
                name = "Weekly"
                priority = 1
                criteria = {
                    absolute_criteria = "FirstOfWeek"
                }

                life_cycle ={
                    data_store_type = "VaultStore"
                    duration        = "P4W"
                }
            }
        ]

    }
    
 
  ]
}
