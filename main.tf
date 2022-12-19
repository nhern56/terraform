#access to aws
provider "aws" {
  access_key = var.AWS_ACCESS_KEY
  secret_key = var.AWS_SECRET_KEY
  region = "us-east-1"
}

variable "AWS_ACCESS_KEY" {
  default = ""
}

variable "AWS_SECRET_KEY" {
  default = ""
}

module "cloudtrails" {
  source = "./cloudtrails"
  cloudtrailname = "cloudtrails"
  s3_bucket_name = module.s3_logs_store.id
}

module "s3_logs_store" {
    source = "./s3_logs_store"
    s3name = "s3_logs_store"
}

