variable "region" {
  default = "eu-west-1"
}

variable "lambda_function_name" {
  default = "stopec2instances"
}

variable "lambda_file_name" {
  default = "../stop_ec2.zip"
}

variable "lambda_handler" {
  default = "stop_ec2.lambda_handler"
}

variable "lambda_timeout" {
  default = "10"
}

variable "lambda_runtime" {
  default = "python3.7"
}

variable "lambda_iam_role" {
  default = "stop_ec2"
}




