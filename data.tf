# Terraform Renote State Datasource : This is going to read the data from another statefile

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "b54-tf-remote-state"
    key    = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_secretsmanager_secret" "secrets" {
  name = "robot/secrets"
}

output "data" {
  value = data.aws_secretsmanager_secret.secrets
}