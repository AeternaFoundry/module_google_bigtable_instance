variable "bigtable_instances" {
  description = <<EOT
Map of bigtable_instances, attributes below
Required:
    - name
Optional:
    - deletion_policy
    - deletion_protection
    - display_name
    - edition
    - force_destroy
    - instance_type
    - labels
    - project
    - tags
    - cluster (block):
        - autoscaling_config (optional, block):
            - cpu_target (required)
            - max_nodes (required)
            - min_nodes (required)
            - storage_target (optional)
        - cluster_id (required)
        - kms_key_name (optional)
        - node_scaling_factor (optional)
        - num_nodes (optional)
        - storage_type (optional)
        - zone (optional)
    - timeouts (block):
        - create (optional)
        - read (optional)
        - update (optional)
EOT

  type = map(object({
    name                = string
    deletion_policy     = optional(string)
    deletion_protection = optional(bool)
    display_name        = optional(string)
    edition             = optional(string)
    force_destroy       = optional(bool)
    instance_type       = optional(string)
    labels              = optional(map(string))
    project             = optional(string)
    tags                = optional(map(string))
    cluster = optional(list(object({
      autoscaling_config = optional(object({
        cpu_target     = number
        max_nodes      = number
        min_nodes      = number
        storage_target = optional(number)
      }))
      cluster_id          = string
      kms_key_name        = optional(string)
      node_scaling_factor = optional(string)
      num_nodes           = optional(number)
      storage_type        = optional(string)
      zone                = optional(string)
    })))
    timeouts = optional(object({
      create = optional(string)
      read   = optional(string)
      update = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.bigtable_instances : (
        v.cluster == null || alltrue([for item in v.cluster : (item.num_nodes == null || (item.num_nodes >= 1))])
      )
    ])
    error_message = "must be at least 1"
  }
  validation {
    condition = alltrue([
      for k, v in var.bigtable_instances : (
        v.cluster == null || alltrue([for item in v.cluster : (item.storage_type == null || (contains(["SSD", "HDD"], item.storage_type)))])
      )
    ])
    error_message = "must be one of: \"SSD\", \"HDD\""
  }
  validation {
    condition = alltrue([
      for k, v in var.bigtable_instances : (
        v.cluster == null || alltrue([for item in v.cluster : (item.node_scaling_factor == null || (contains(["NodeScalingFactor1X", "NodeScalingFactor2X"], item.node_scaling_factor)))])
      )
    ])
    error_message = "must be one of: \"NodeScalingFactor1X\", \"NodeScalingFactor2X\""
  }
  validation {
    condition = alltrue([
      for k, v in var.bigtable_instances : (
        v.instance_type == null || (contains(["DEVELOPMENT", "PRODUCTION"], v.instance_type))
      )
    ])
    error_message = "must be one of: \"DEVELOPMENT\", \"PRODUCTION\""
  }
  validation {
    condition = alltrue([
      for k, v in var.bigtable_instances : (
        v.edition == null || (contains(["ENTERPRISE", "ENTERPRISE_PLUS"], v.edition))
      )
    ])
    error_message = "must be one of: \"ENTERPRISE\", \"ENTERPRISE_PLUS\""
  }
}

