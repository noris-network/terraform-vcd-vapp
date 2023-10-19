resource "vcd_vapp" "vapp" {
  org              = var.vdc_org_name
  vdc              = var.vdc_name
  name             = var.name
  description      = var.description
  power_on         = var.power_on
  guest_properties = var.guest_properties

  dynamic "lease" {
    for_each = var.lease != null ? var.lease : {}
    content {
      runtime_lease_in_sec = lease.runtime_lease_in_sec
      storage_lease_in_sec = lease.storage_lease_in_sec
    }
  }

  dynamic "metadata_entry" {
    for_each = length(var.metadata_entry) > 0 ? var.metadata_entry : []
    content {
      key         = metadata_entry.value.key
      value       = metadata_entry.value.value
      type        = metadata_entry.value.type
      user_access = metadata_entry.value.user_access
      is_system   = metadata_entry.value.is_system
    }
  }
}
