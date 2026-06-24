output "amplify_app_id" {
  value = aws_amplify_app.app.id
}

output "amplify_default_domain" {
  value = "https://${var.branch}.${aws_amplify_app.app.default_domain}"
}