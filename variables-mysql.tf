##
# (c) 2021-2026
#     Cloud Ops Works LLC - https://cloudops.works/
#     Find us on:
#       GitHub: https://github.com/cloudopsworks
#       WebSite: https://cloudops.works
#     Distributed Under Apache v2.0 License
#

## YAML Input Format
# settings:
#   name_prefix: "mydb"              # (Required) Name prefix for the server resource.
#   database_name: "mydb"            # (Optional) Initial database name. Default: "mysql".
#   administrator_login: "adminuser" # (Optional) Admin username. Default: "adminuser".
#   version: "8.0.21"                # (Required) MySQL version. Possible values: 5.7, 8.0.21.
#   sku_name: "B_Standard_B1ms"      # (Required) Compute SKU. Possible values: B_Standard_B1ms, GP_Standard_D2ds_v4, MO_Standard_E4ds_v4, etc.
#   storage_mb: 20480                # (Optional) Storage size in MB. Default: 20480 (20 GB). Min: 20480.
#   storage_iops: 396                # (Optional) Storage IOPS. Default: 396.
#   storage_auto_grow: "Enabled"     # (Optional) Enabled or Disabled. Default: Enabled.
#   backup_retention_days: 7         # (Optional) Backup retention days, 1-35. Default: 7.
#   geo_redundant_backup: "Disabled" # (Optional) Enabled or Disabled. Default: Disabled.
#   zone: ""                         # (Optional) Availability zone ("1", "2", "3"). Default: "".
#   high_availability:
#     enabled: false                 # (Optional) Enable HA. Default: false.
#     mode: "ZoneRedundant"          # (Optional) SameZone or ZoneRedundant. Default: ZoneRedundant.
#     standby_zone: ""               # (Optional) Standby AZ. Default: "".
#   maintenance:
#     day_of_week: 0                 # (Optional) 0=Sunday..6=Saturday. Default: 0.
#     start_hour: 0                  # (Optional) 0-23 UTC. Default: 0.
#     start_minute: 0                # (Optional) 0-59. Default: 0.
#   databases: {}                    # (Optional) Map of additional databases: {key: {name, charset, collation}}.
#   parameters: []                   # (Optional) List of {name, value} server configuration parameters.
#   hoop:
#     enabled: false                 # (Optional) Generate hoop_connections output. Default: false.
#     agent_id: ""                   # (Required when enabled) Hoop agent UUID.
#     community: true                # (Optional) true=null (no sub-key in Key Vault); false=enterprise. Default: true.
#     import: false                  # (Optional) Import existing Hoop connection. Default: false.
#     tags: {}                       # (Optional) Tags map.
#     access_control: []             # (Optional) Access control groups.
variable "settings" {
  description = "Settings for Azure MySQL Flexible Server — see inline docs for full YAML structure."
  type        = any
  default     = {}
}

## YAML Input Format
# network:
#   delegated_subnet_id: ""          # (Optional) Subnet for VNet injection.
#   private_dns_zone_id: ""          # (Optional) Required with delegated_subnet_id.
#   public_network_access: true      # (Optional) Allow public access. Default: true.
#   firewall_rules:
#     - name: "office"
#       start_ip: "203.0.113.0"
#       end_ip: "203.0.113.255"
variable "network" {
  description = "Network configuration for Azure MySQL Flexible Server."
  type        = any
  default     = {}
}

variable "key_vault_name" {
  description = "(Required) Name of the existing Azure Key Vault for credential storage."
  type        = string
}

variable "key_vault_resource_group_name" {
  description = "(Required) Resource group name of the existing Azure Key Vault."
  type        = string
}
