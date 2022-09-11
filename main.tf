# ---------------------------------------------
# Terraform configuration
# ---------------------------------------------
terraform {
  required_version = ">=0.13"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
  # tfstateの一元管理化 terraform applyでs3のバケットにtfstateにアップロードされる
  # git管理ならこれはいらない？？
  # backend "s3" {
  #   bucket  = "tastylog-tfstate-bucket-ted-study"
  #   key     = "tastylog-dev.tfstate"
  #   profile = "terraform"
  #   region  = "ap-northeast-1"
  # }
}

# ---------------------------------------------
# Provider
# ---------------------------------------------
provider "aws" {
  profile    = "terraform"
  region     = "ap-northeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

provider "aws" {
  alias      = "virginia"
  profile    = "terraform"
  region     = "us-east-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

# ---------------------------------------------
# Variables
# ---------------------------------------------
variable "project" {
  type = string
}

variable "environment" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}
