variable "logtype" {
  description = "this is the type of log that is in the s3 bucket - current options are 'cdn' for cloud front and 'alb' for application load balancer, defaults to 'alb'"
  default     = ""
}

variable "doctype" {
  description = "this is the document type name that is appended to the elastic search records, defaults to {{logtype}}-log"
  default     = ""
}

variable "index" {
  description = "Index to create. adds a timestamp to index. defaults to '{{logtype}}logs-{{timestamp}}''"
  default     = ""
}

variable "es_endpoint" {
  description = "AWS elasticsearch endpoint. Without http:// or https:// "
}

variable "nodejs_version" {
  description = "Nodejs version to be used"
  default     = "10.8"
}

variable "prefix" {
  description = "A prefix for the resource names, this helps create multiple instances of this stack for different environments"
  default     = ""
}

variable "lambda_timeout" {
  description = "timeout in s for lambda function"
  default     = "900"
}

variable "region" {
  description = "AWS region"
  default     = "eu-west-1"
}

variable "s3_bucket_arn" {
  description = "The arn of the s3 bucket containing the alb logs"
}

variable "s3_bucket_id" {
  description = "The id of the s3 bucket containing the alb logs"
}

variable "subnet_ids" {
  description = "Subnet IDs you want to deploy the lambda in. Only fill this in if you want to deploy your Lambda function inside a VPC."
  type        = "list"
  default     = []
}

variable "tags" {
  description = "Tags to apply"
  default = {
    Name = "alb-logs-to-es"
  }
}
