terraform {
  # Remote backend configuration
  backend "s3" {
    bucket       = "mybucket-11172026"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }

  # Provider requirements
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure AWS Provider
provider "aws" {
  region = "us-east-1"
}