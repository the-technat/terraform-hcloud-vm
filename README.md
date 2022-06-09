# terraform-hcloud-vm

Terraform module to create a virtual machine on Hetzner cloud

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | 1.33.2 |
| <a name="requirement_hetznerdns"></a> [hetznerdns](#requirement\_hetznerdns) | 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | 1.33.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [hcloud_firewall.vm](https://registry.terraform.io/providers/hetznercloud/hcloud/1.33.2/docs/resources/firewall) | resource |
| [hcloud_rdns.vm_ptr_v4](https://registry.terraform.io/providers/hetznercloud/hcloud/1.33.2/docs/resources/rdns) | resource |
| [hcloud_rdns.vm_ptr_v6](https://registry.terraform.io/providers/hetznercloud/hcloud/1.33.2/docs/resources/rdns) | resource |
| [hcloud_server.vm](https://registry.terraform.io/providers/hetznercloud/hcloud/1.33.2/docs/resources/server) | resource |
| [hcloud_ssh_key.root](https://registry.terraform.io/providers/hetznercloud/hcloud/1.33.2/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_user"></a> [admin\_user](#input\_admin\_user) | Name of an admin user initially created on the server | `string` | `"ci"` | no |
| <a name="input_common_labels"></a> [common\_labels](#input\_common\_labels) | Map of labels to add to all resources | `map(string)` | `{}` | no |
| <a name="input_enable_server_backups"></a> [enable\_server\_backups](#input\_enable\_server\_backups) | Wether to enable server backups in hcloud. | `bool` | `false` | no |
| <a name="input_server_image"></a> [server\_image](#input\_server\_image) | Name of the image to use for the server | `string` | `"debian-11"` | no |
| <a name="input_server_location"></a> [server\_location](#input\_server\_location) | Where to place the server? | `string` | n/a | yes |
| <a name="input_server_name"></a> [server\_name](#input\_server\_name) | Name of the server we create | `string` | n/a | yes |
| <a name="input_server_ptr_record"></a> [server\_ptr\_record](#input\_server\_ptr\_record) | FQDN to add to PTR record | `string` | `""` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Server size by type | `string` | `"cp11"` | no |
| <a name="input_ssh_key_root"></a> [ssh\_key\_root](#input\_ssh\_key\_root) | SSH key to add to root user (only used to prevent hcloud from sending a mail with the root password, empty means the first key from ssh\_keys list) | `string` | `""` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | List of ssh keys to add to the admin\_user | `list(string)` | n/a | yes |
| <a name="input_ssh_port"></a> [ssh\_port](#input\_ssh\_port) | SSH port to configure on server | `number` | `22` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->