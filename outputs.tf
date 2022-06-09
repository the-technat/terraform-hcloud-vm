output "server_ipv4_address" {
  value = hcloud_server.vm.ipv4_address
}

output "server_ipv6_address" {
  value = hcloud_server.vm.ipv6_address
}
