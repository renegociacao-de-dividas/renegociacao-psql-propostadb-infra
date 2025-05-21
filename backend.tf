terraform {
  required_version = ">= 1.3"

  backend "s3" {
    bucket  = "own-tfstate"
    key     = "terraform-db/proposta-db/terraform.tfstate"
    region  = "ca-central-1"
    encrypt = true
  }

  required_providers {

    random = {
      version = "~> 3.0"
    }

    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.65"
    }
  }
}

provider "aws" {
  region = var.aws_region
}