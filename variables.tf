variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "app_name" {
  type    = string
  default = "my-next-app"
}

variable "github_repo" {
  type    = string
  default = "https://github.com/Divyanshy22/my-next-app"
}

variable "github_token" {
  type      = string
  sensitive = true
}

variable "branch" {
  type    = string
  default = "main"
}