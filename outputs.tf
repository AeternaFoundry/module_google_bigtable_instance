output "bigtable_instances_id" {
  description = "Map of id values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no id are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.id if v.id != null && length(v.id) > 0 }
}
output "bigtable_instances_cluster" {
  description = "Map of cluster values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no cluster are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.cluster if v.cluster != null && length(v.cluster) > 0 }
}
output "bigtable_instances_deletion_policy" {
  description = "Map of deletion_policy values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no deletion_policy are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.deletion_policy if v.deletion_policy != null && length(v.deletion_policy) > 0 }
}
output "bigtable_instances_deletion_protection" {
  description = "Map of deletion_protection values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no deletion_protection are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.deletion_protection if v.deletion_protection != null }
}
output "bigtable_instances_display_name" {
  description = "Map of display_name values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no display_name are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.display_name if v.display_name != null && length(v.display_name) > 0 }
}
output "bigtable_instances_edition" {
  description = "Map of edition values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no edition are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.edition if v.edition != null && length(v.edition) > 0 }
}
output "bigtable_instances_effective_labels" {
  description = "Map of effective_labels values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no effective_labels are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.effective_labels if v.effective_labels != null && length(v.effective_labels) > 0 }
}
output "bigtable_instances_force_destroy" {
  description = "Map of force_destroy values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no force_destroy are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.force_destroy if v.force_destroy != null }
}
output "bigtable_instances_instance_type" {
  description = "Map of instance_type values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no instance_type are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.instance_type if v.instance_type != null && length(v.instance_type) > 0 }
}
output "bigtable_instances_labels" {
  description = "Map of labels values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no labels are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.labels if v.labels != null && length(v.labels) > 0 }
}
output "bigtable_instances_name" {
  description = "Map of name values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no name are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.name if v.name != null && length(v.name) > 0 }
}
output "bigtable_instances_project" {
  description = "Map of project values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no project are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.project if v.project != null && length(v.project) > 0 }
}
output "bigtable_instances_tags" {
  description = "Map of tags values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no tags are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.tags if v.tags != null && length(v.tags) > 0 }
}
output "bigtable_instances_terraform_labels" {
  description = "Map of terraform_labels values across all bigtable_instances, keyed the same as var.bigtable_instances except keys with no terraform_labels are omitted"
  value       = { for k, v in google_bigtable_instance.bigtable_instances : k => v.terraform_labels if v.terraform_labels != null && length(v.terraform_labels) > 0 }
}

