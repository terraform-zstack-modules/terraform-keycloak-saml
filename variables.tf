variable "context" {
  description = <<-EOF
Receive contextual information. When Walrus deploys, Walrus will inject specific contextual information into this field.

Examples:
```
context:
  project:
    name: string
    id: string
  environment:
    name: string
    id: string
  resource:
    name: string
    id: string
```
EOF
  type        = map(any)
  default     = {}
}


variable "sam_client_id" {
  description = "格式为http://Cloud_MN_IP:8080/zstack/sso/saml2/sp"
  type        = string
}

variable "base_url" {
  description = "Cloud 接口 URL"
  type        = string
}

variable "valid_redirect_uris" {
  description = "Cloud 接口 URL/*"
  type        = string
}

variable "master_saml_processing_url" {
  description = "http://Cloud_MN_IP:8080/zstack/sso/saml2/acs"
  type        = string
}

variable "keycloak_url" {
  description = "keycloak url"
  type        = string
}

variable "keycloak_admin" {
  description = "keycloak 管理员账号，默认为admin"
  type        = string
  default     = "admin"
}

variable "keycloak_password" {
  description = "keycloak 管理员密码"
  type        = string
  sensitive   = true
}









