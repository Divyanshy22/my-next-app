resource "aws_amplify_app" "app" {
  name         = var.app_name
  repository   = var.github_repo
  access_token = var.github_token

  build_spec = <<-EOT
    version: 1
    frontend:
      phases:
        preBuild:
          commands:
            - npm ci
        build:
          commands:
            - npm run build
      artifacts:
        baseDirectory: .next
        files:
          - '**/*'
      cache:
        paths:
          - .next/cache/**/*
          - node_modules/**/*
  EOT

  platform = "WEB_COMPUTE"

  environment_variables = {
    NODE_ENV              = "production"
    NEXT_TELEMETRY_DISABLED = "1"
  }

  tags = {
    Name = var.app_name
  }
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.app.id
  branch_name = var.branch

  framework = "Next.js - SSR"
  stage     = "PRODUCTION"

  enable_auto_build = true

  tags = {
    Name = "${var.app_name}-main-branch"
  }
}