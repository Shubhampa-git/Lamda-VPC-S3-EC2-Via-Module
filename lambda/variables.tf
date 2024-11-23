
variable "lambda_function_name" {
  description = "Lambda function name"
  type = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name"
}

variable "role_arn" {
  description = "IAM role ARN for Lambda"
}
