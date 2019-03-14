output "password" {
  value = "${azuread_service_principal_password.test.value}"
}
