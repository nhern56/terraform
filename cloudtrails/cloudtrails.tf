provider "aws" {
  region = "us-east-1"
}



resource "aws_cloudtrail" "cloudtrails" {
    count = var.enabled_cloudtrail == true ? 1 : 0
    name = var.cloudtrailname
    s3_bucket_name = var.s3_bucket_name
    s3_key_prefix = "prefix"
  }


module "s3_logs_store" {
    source = "../s3_logs_store"
    s3name = "cloudtrailss3"
}

