################################################################################
# Provider Configuration
################################################################################

provider "aws" {
  region = var.aws_region

  assume_role {
    role_arn = var.terraform_role
  }
}