variable "bucket_name" {
  type        = string
  description = "The name of the S3 bucket."
}

variable "iam_role_arn" {
  type        = string
  description = "The ARN of the IAM role with permissions for the bucket."
}