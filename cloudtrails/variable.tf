variable "cloudtrailname" {
  default = ""
}

variable "s3_bucket_name" {
  type = string
}

variable "enabled_cloudtrail" {
  type        = bool
  default     = true
  description = "If true, deploy the resources for the module."
}