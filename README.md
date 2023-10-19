# terraform-vcd-vapp

Terraform module which manages vApp ressources on VMWare Cloud Director.

This creates empty vApps.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.9 |
| <a name="requirement_vcd"></a> [vcd](#requirement\_vcd) | >= 3.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcd"></a> [vcd](#provider\_vcd) | 3.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcd_vapp.vapp](https://registry.terraform.io/providers/vmware/vcd/latest/docs/resources/vapp) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_name"></a> [name](#input\_name) | A unique name for the vApp. | `string` | n/a | yes |
| <a name="input_vdc_org_name"></a> [vdc\_org\_name](#input\_vdc\_org\_name) | The name of the organization to use. | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | A description for the vApp, up to 256 characters. | `string` | `null` | no |
| <a name="input_guest_properties"></a> [guest\_properties](#input\_guest\_properties) | Key value map of vApp guest properties. | `map(any)` | `null` | no |
| <a name="input_lease"></a> [lease](#input\_lease) | A block to define port, port range and traffic type. Multiple can be used. See service\_port and example for usage details. | <pre>object({<br>    runtime_lease_in_sec = number # How long any of the VMs in the vApp can run before the vApp is automatically powered off or suspended. 0 means never expires (or maximum allowed by Org). Regular values accepted from 3600+.<br>    storage_lease_in_sec = number # How long the vApp is available before being automatically deleted or marked as expired. 0 means never expires (or maximum allowed by Org). Regular values accepted from 3600+.<br>  })</pre> | `null` | no |
| <a name="input_metadata_entry"></a> [metadata\_entry](#input\_metadata\_entry) | A set of metadata entries to assign. | `list(map(string))` | `[]` | no |
| <a name="input_power_on"></a> [power\_on](#input\_power\_on) | A boolean value stating if this vApp should be powered on. Works only on update when vApp already has VMs. | `bool` | `false` | no |
| <a name="input_vdc_name"></a> [vdc\_name](#input\_vdc\_name) | The name of VDC to use. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The ID of the vApp. |
| <a name="output_name"></a> [name](#output\_name) | The name of the vApp. |
<!-- END_TF_DOCS -->

## Examples

```
module "vapp" {
  source       = "git::https://github.com/noris-network/terraform-vcd-vapp?ref=1.0.0"
  vdc_org_name = "myORG"
  vdc_name     = "myDC01"
  name         = "webserver"
}
```
