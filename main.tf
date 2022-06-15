resource "hcloud_server" "vm" {
  name               = var.server_name
  image              = var.server_image
  server_type        = var.server_type
  location           = var.server_location
  backups            = var.enable_server_backups
  ssh_keys           = var.root_ssh_key_ids
  keep_disk          = true // used to allow up and downscaling of the size
  delete_protection  = false
  rebuild_protection = false

  user_data = templatefile(
    "${path.module}/templates/server.yaml.tmpl",
    {
      admin_user = var.admin_user
      ssh_keys   = var.ssh_keys
      ssh_port   = var.ssh_port
    }
  )

  labels = var.common_labels
}

resource "hcloud_firewall" "vm" {
  name = var.server_name

  labels = var.common_labels

  rule {
    // allow ssh traffic on the specified port
    direction  = "in"
    protocol   = "tcp"
    port       = var.ssh_port
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  rule {
    // allow ping 
    direction  = "in"
    protocol   = "icmp"
    source_ips = ["0.0.0.0/0", "::/0"]
  }

  dynamic "rule" {
    for_each = var.firewall_rules
    content {
      direction  = rule.value.direction
      protocol   = rule.value.protocol
      port       = rule.value.port
      source_ips = rule.value.source_ips
    }
  }

  apply_to {
    server = hcloud_server.vm.id
  }
}

resource "hcloud_rdns" "vm_ptr_v4" {
  server_id  = hcloud_server.vm.id
  ip_address = hcloud_server.vm.ipv4_address
  dns_ptr    = var.server_ptr_record
}

resource "hcloud_rdns" "vm_ptr_v6" {
  server_id  = hcloud_server.vm.id
  ip_address = hcloud_server.vm.ipv6_address
  dns_ptr    = var.server_ptr_record
}
