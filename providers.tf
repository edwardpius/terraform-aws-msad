terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
  # backend "s3" {
  #   bucket         = "tf-remotestate-hub-10175"
  #   key            = "terraform-aws-hub/terraform.tfstate"
  #   dynamodb_table = "tf-remote-state-lock-hub"
  #   region         = "us-west-2"
  #   profile        = "tfhub"
  # }
}

provider "aws" {
  region  = "us-east-1"
  profile = "terraform"
}