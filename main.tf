terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # OPTIONAL: remote backend (uncomment and fill bucket/table when ready)
  # backend "s3" {
  #   bucket         = "YOUR-TF-STATE-BUCKET-NAME"
  #   key            = "hello-world-infra/terraform.tfstate"
  #   region         = "ap-south-1"
  #   dynamodb_table = "terraform-locks"
  # }
}

provider "aws" {
  region = var.aws_region
}
