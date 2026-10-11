resource "google_bigtable_instance" "bigtable_instances" {
  for_each = var.bigtable_instances

  name                = each.value.name
  deletion_policy     = each.value.deletion_policy
  deletion_protection = each.value.deletion_protection
  display_name        = each.value.display_name
  edition             = each.value.edition
  force_destroy       = each.value.force_destroy
  instance_type       = each.value.instance_type
  labels              = each.value.labels
  project             = each.value.project
  tags                = each.value.tags

  dynamic "cluster" {
    for_each = each.value.cluster != null ? each.value.cluster : []
    content {
      dynamic "autoscaling_config" {
        for_each = cluster.value.autoscaling_config != null ? [cluster.value.autoscaling_config] : []
        content {
          cpu_target     = autoscaling_config.value.cpu_target
          max_nodes      = autoscaling_config.value.max_nodes
          min_nodes      = autoscaling_config.value.min_nodes
          storage_target = autoscaling_config.value.storage_target
        }
      }
      cluster_id          = cluster.value.cluster_id
      kms_key_name        = cluster.value.kms_key_name
      node_scaling_factor = cluster.value.node_scaling_factor
      num_nodes           = cluster.value.num_nodes
      storage_type        = cluster.value.storage_type
      zone                = cluster.value.zone
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}

