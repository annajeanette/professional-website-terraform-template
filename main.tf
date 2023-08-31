terraform {
  required_version = "~> 1.5.4"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }

    github = {
      source  = "integrations/github"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket = "<state file bucket>"
    key    = "prod/terraform.tfstate"
    region = "<region>"
  }

}

provider "aws" {
  alias  = "acm_provider"
  region = "<region>"
}

provider "github" {}