#
# Contextual output
#

output "walrus_project_name" {
  value       = try(local.context["project"]["name"], null)
  description = "The name of project where deployed in Walrus."
}

output "walrus_project_id" {
  value       = try(local.context["project"]["id"], null)
  description = "The id of project where deployed in Walrus."
}

output "walrus_environment_name" {
  value       = try(local.context["environment"]["name"], null)
  description = "The name of environment where deployed in Walrus."
}

output "walrus_environment_id" {
  value       = try(local.context["environment"]["id"], null)
  description = "The id of environment where deployed in Walrus."
}

output "walrus_resource_name" {
  value       = try(local.context["resource"]["name"], null)
  description = "The name of resource where deployed in Walrus."
}

output "walrus_resource_id" {
  value       = try(local.context["resource"]["id"], null)
  description = "The id of resource where deployed in Walrus."
}

output "client_info" {
  value = keycloak_saml_client.saml_client_zstack
}

output "saml_metadata_url" {
  value = "${var.keycloak_url}/realms/zstack_saml/protocol/saml/descriptor"
  description = "可以把这个metadata直接给到cloud saml认证"
}

output "url" {
  value = "${var.keycloak_url}/admin/master/console/#/zstack_saml"
  description = "管理keycloak，设置client scopes"
}