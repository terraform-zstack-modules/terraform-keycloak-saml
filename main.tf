locals {
  context = var.context
}


provider "keycloak" {
  client_id = "admin-cli"
  url      = var.keycloak_url 
  username = var.keycloak_admin
  password = var.keycloak_password
}

resource "keycloak_realm" "realm" {
  realm   = "zstack_saml"
  enabled = true
}

resource "keycloak_saml_client" "saml_client_zstack" {
 realm_id  = keycloak_realm.realm.id
 client_id =  var.sam_client_id 
  
  # 从状态文件中获取的 URL 和绑定信息
  base_url                      =  var.base_url 
  root_url                      = var.base_url  
  valid_redirect_uris           = [var.valid_redirect_uris] 
  master_saml_processing_url    = var.master_saml_processing_url 
  
  # 从状态文件中获取的认证和签名设置
  canonicalization_method       = "EXCLUSIVE"
  client_signature_required     = false
  force_post_binding            = true
  front_channel_logout          = true
  name_id_format                = "username"
  sign_documents                = true
  sign_assertions               = false
  signature_algorithm           = "RSA_SHA256"
  signature_key_name            = "NONE"
  include_authn_statement       = true

  # 从状态文件中获取的其他属性
  enabled                       = true
  full_scope_allowed            = true
  # login_theme                   = "keycloak"
}


# 1. X500 description (User Attribute Mapper)
resource "keycloak_generic_protocol_mapper" "x500_description_mapper" {
  realm_id        = keycloak_realm.realm.id
  client_id       = keycloak_saml_client.saml_client_zstack.id
  name            = "X500 description"
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-mapper"

  config = {
    "aggregate.attrs" = "false"
    "attribute.name"  = "description"
    "friendly.name"   = "description"
    "user.attribute"  = "description"
  }
}

# 2. X500 email (User Property Mapper)
resource "keycloak_generic_protocol_mapper" "x500_email_mapper" {
  realm_id        = keycloak_realm.realm.id
  client_id       = keycloak_saml_client.saml_client_zstack.id
  name            = "X500 email"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"

  config = {
    "attribute.name"       = "email"
    "attribute.nameformat" = "urn:oasis:names:tc:SAML:2.0:attrname-format:uri"
    "friendly.name"        = "email"
    "user.attribute"       = "email"
  }
}

# 3. X500 group (Group Mapper)
resource "keycloak_generic_protocol_mapper" "x500_group_mapper" {
  realm_id        = keycloak_realm.realm.id
  client_id       = keycloak_saml_client.saml_client_zstack.id
  name            = "X500 group"
  protocol        = "saml"
  protocol_mapper = "saml-group-membership-mapper"

  config = {
    "attribute.name" = "member"
    "full.path"      = "false"
    "single"         = "false"
  }
}

# 4. X500 number (User Attribute Mapper)
resource "keycloak_generic_protocol_mapper" "x500_number_mapper" {
  realm_id        = keycloak_realm.realm.id
  client_id       = keycloak_saml_client.saml_client_zstack.id
  name            = "X500 number"
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-mapper"

  config = {
    "aggregate.attrs" = "false"
    "attribute.name"  = "number"
    "friendly.name"   = "number"
    "user.attribute"  = "number"
  }
}

# 5. X500 phone (User Attribute Mapper)
resource "keycloak_generic_protocol_mapper" "x500_phone_mapper" {
  realm_id        = keycloak_realm.realm.id
  client_id       = keycloak_saml_client.saml_client_zstack.id
  name            = "X500 phone"
  protocol        = "saml"
  protocol_mapper = "saml-user-attribute-mapper"

  config = {
    "aggregate.attrs" = "false"
    "attribute.name"  = "phone"
    "friendly.name"   = "phone"
    "user.attribute"  = "phone"
  }
}

# 6. X500 surname (User Property Mapper)
resource "keycloak_generic_protocol_mapper" "x500_surname_mapper" {
  realm_id        = keycloak_realm.realm.id
  client_id       = keycloak_saml_client.saml_client_zstack.id
  name            = "X500 surname"
  protocol        = "saml"
  protocol_mapper = "saml-user-property-mapper"

  config = {
    "attribute.name"       = "username"
    "attribute.nameformat" = "urn:oasis:names:tc:SAML:2.0:attrname-format:uri"
    "friendly.name"        = "surname"
    "user.attribute"       = "username"
  }
}

