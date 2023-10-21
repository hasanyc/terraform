# Define variables
variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Name to be used on all the S3 resources as identifier."
}

variable "default_tags" {
  type        = map(string)
  description = "Tags for cost allocation purposes ( AWS Best Practices )"
  default = {}
}

variable "terraform_role" {
  type        = string
  description = "Terraform role that needs to be assumed for the respective account."
}

variable "bucket_names" {
  description = "Bucket name that needs to be created."
  type    = list(string)
  validation {
    condition = alltrue([
      for name in var.bucket_names :
      can(regex("^[0-9A-Za-z-]+$", name))
    ])
    error_message = "All bucket names must follow the AWS S3 naming rules, including length. Check them out at: https://docs.aws.amazon.com/AmazonS3/latest/userguide/bucketnamingrules.html."
  }
}

variable "encryption_type" {
  type    = string
  default = "AES256"
}

variable "kms_key_arn" {
  type        = string
  description = "KMS key ARN is required if encryption_type is KMS"
  default = null
}

variable "bucket_acl" {
  type = string
  description = "Use to set the bucket policy private or public"
  default = "private"
}