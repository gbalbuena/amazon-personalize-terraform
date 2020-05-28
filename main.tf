provider "aws" {
  version = "~> 2.21"
}

data "aws_caller_identity" "current" {}