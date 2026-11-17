terraform {

  backend "s3" {
    bucket = "mybucket-11172026"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


