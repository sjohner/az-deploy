resource "random_string" "password" {
  length = 16
  special = true
  override_special = "/@\" "
}

resource "azuread_application" "test" {
  name                       = "${var.name}"

  required_resource_access {
    resource_app_id = "00000002-0000-0000-c000-000000000000"

    resource_access {
      id = "311a71cc-e848-46a1-bdf8-97ff7156d8e6"
      type = "Scope"
    }
    resource_access {
      id = "1cda74f2-2616-4834-b122-5cb1b07f8a59"
      type = "Role"
    }
  }
}

resource "azuread_service_principal" "test" {
  application_id = "${azuread_application.test.application_id}"

  tags = ["example", "tags", "here"]
}

resource "azuread_service_principal_password" "test" {
  service_principal_id = "${azuread_service_principal.test.id}"
  value                = "${random_string.password.result}"
  end_date_relative    = "${var.enddate_relative}"
}

#data "azurerm_subscription" "3d3de489-d0ee-4aa6-843b-38a0f423a0a3" {}

#data "azurerm_client_config" "test" {}

resource "azurerm_role_assignment" "owner" {
  scope                = "${var.role_assignment_scope}"
  role_definition_name = "Owner"
  principal_id         = "${azuread_service_principal.test.id}"
}
