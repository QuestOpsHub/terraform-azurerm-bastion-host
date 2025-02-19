#--------------
# Bastion Host
#--------------
resource "azurerm_bastion_host" "bastion_host" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  copy_paste_enabled  = try(var.copy_paste_enabled, true)
  file_copy_enabled   = var.sku == "Standard" || var.sku == "Premium" ? try(var.file_copy_enabled, false) : null
  sku                 = try(var.sku, "Basic")

  dynamic "ip_configuration" {
    for_each = try(var.ip_configuration, {}) != {} ? [var.ip_configuration] : []
    content {
      name                 = ip_configuration.value.name
      subnet_id            = ip_configuration.value.subnet_id
      public_ip_address_id = ip_configuration.value.public_ip_address_id
    }
  }

  ip_connect_enabled        = var.sku == "Standard" || var.sku == "Premium" ? try(var.ip_connect_enabled, false) : null
  kerberos_enabled          = var.sku == "Standard" || var.sku == "Premium" ? try(var.kerberos_enabled, false) : null
  scale_units               = try(var.scale_units, 2)
  shareable_link_enabled    = var.sku == "Standard" || var.sku == "Premium" ? try(var.shareable_link_enabled, false) : null
  tunneling_enabled         = var.sku == "Standard" || var.sku == "Premium" ? try(var.tunneling_enabled, false) : null
  session_recording_enabled = var.sku == "Premium" ? try(var.session_recording_enabled, false) : null
  virtual_network_id        = try(var.virtual_network_id, null)
  zones                     = try(var.zones, [])

  tags = var.tags
  lifecycle {
    ignore_changes = [
      tags["creation_timestamp"],
    ]
  }
}