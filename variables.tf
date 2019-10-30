variable "region" {
  type        = "string"
  description = "Deployment region"
  default = "eu-west-1"
}

variable "lambda_iam_role" {
  type        = "string"
  description = "IAM role that would be assumable by our lambda function"
  default = "stop_ec2"
}

variable "lambda_iam_role_tag" {
  type        = "string"
  description = "Tha lambda IAM role tag"
  default = "stop_ec2"
}

variable "iam_policy_name" {
  type        = "string"
  description = "The name of the policy that would be attach to the lambda IAM role"
  default = "stop_ec2"
}

variable "iam_policy_description" {
  type        = "string"
  default = "A managed policy to stop and start ec2 instances and perform some actions in cloudwatch"
}

variable "lambda_function_name" {
  type        = "string"
  description = "The name of the lambda function"
}

variable "lambda_runtime" {
  type        = "string"
  description = "The language (SDK) used by lambda to write the function"
}

variable "lambda_file_name" {
  type        = "string"
  description = "The name of the package that conatain the lambda code"
}

variable "lambda_handler" {
  type        = "string"
  description = "The name of the lambda function"
}

variable "lambda_timeout" {
  type        = "string"
  description = "The amount of time that Lambda allows the function to run before stopping it"
}

variable "aws_cloudwatch_event_rule_name" {
  type        = "string"
  description = "The name of the cloudwatch event rule"
  default = "stop_ec2"
}

variable "aws_cloudwatch_event_rule_description" {
  type        = "string"
  default = "Stop dev machines every week day at 7pm UTC time"
}

variable "aws_cloudwatch_event_rule_schedule_expression" {
  default = "cron(0 17 * * ? *)"
}

