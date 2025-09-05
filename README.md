<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_keycloak"></a> [keycloak](#requirement\_keycloak) | 5.4.0 |

注意：创建好后请在keycloak->zstack_saml->Client scopes->role_list->Mappers->role list->Single Role Attribute 开启,否则会报登录失败

## Providers

| Name | Version |
|------|---------|
| <a name="provider_keycloak"></a> [keycloak](#provider\_keycloak) | 5.4.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [keycloak_generic_protocol_mapper.x500_description_mapper](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_generic_protocol_mapper.x500_email_mapper](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_generic_protocol_mapper.x500_group_mapper](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_generic_protocol_mapper.x500_number_mapper](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_generic_protocol_mapper.x500_phone_mapper](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_generic_protocol_mapper.x500_surname_mapper](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/generic_protocol_mapper) | resource |
| [keycloak_realm.realm](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/realm) | resource |
| [keycloak_saml_client.saml_client_zstack](https://registry.terraform.io/providers/keycloak/keycloak/5.4.0/docs/resources/saml_client) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_base_url"></a> [base\_url](#input\_base\_url) | Cloud 接口 URL | `string` | n/a | yes |
| <a name="input_context"></a> [context](#input\_context) | Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.<br/><br/>Examples:<pre>context:<br/>  project:<br/>    name: string<br/>    id: string<br/>  environment:<br/>    name: string<br/>    id: string<br/>  resource:<br/>    name: string<br/>    id: string</pre> | `map(any)` | `{}` | no |
| <a name="input_keycloak_admin"></a> [keycloak\_admin](#input\_keycloak\_admin) | keycloak 管理员账号，默认为admin | `string` | `"admin"` | no |
| <a name="input_keycloak_password"></a> [keycloak\_password](#input\_keycloak\_password) | keycloak 管理员密码 | `string` | n/a | yes |
| <a name="input_keycloak_url"></a> [keycloak\_url](#input\_keycloak\_url) | keycloak url | `string` | n/a | yes |
| <a name="input_master_saml_processing_url"></a> [master\_saml\_processing\_url](#input\_master\_saml\_processing\_url) | http://Cloud_MN_IP:8080/zstack/sso/saml2/acs | `string` | n/a | yes |
| <a name="input_sam_client_id"></a> [sam\_client\_id](#input\_sam\_client\_id) | 格式为http://Cloud_MN_IP:8080/zstack/sso/saml2/sp | `string` | n/a | yes |
| <a name="input_valid_redirect_uris"></a> [valid\_redirect\_uris](#input\_valid\_redirect\_uris) | Cloud 接口 URL/* | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_client_info"></a> [client\_info](#output\_client\_info) | n/a |
| <a name="output_walrus_environment_id"></a> [walrus\_environment\_id](#output\_walrus\_environment\_id) | The id of environment where deployed in Walrus. |
| <a name="output_walrus_environment_name"></a> [walrus\_environment\_name](#output\_walrus\_environment\_name) | The name of environment where deployed in Walrus. |
| <a name="output_walrus_project_id"></a> [walrus\_project\_id](#output\_walrus\_project\_id) | The id of project where deployed in Walrus. |
| <a name="output_walrus_project_name"></a> [walrus\_project\_name](#output\_walrus\_project\_name) | The name of project where deployed in Walrus. |
| <a name="output_walrus_resource_id"></a> [walrus\_resource\_id](#output\_walrus\_resource\_id) | The id of resource where deployed in Walrus. |
| <a name="output_walrus_resource_name"></a> [walrus\_resource\_name](#output\_walrus\_resource\_name) | The name of resource where deployed in Walrus. |
<!-- END_TF_DOCS -->