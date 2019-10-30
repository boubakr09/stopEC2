module "stop_ec2" {
  source = "../"

  region               = "${var.region}"
  lambda_function_name = "${var.lambda_function_name}"
  lambda_file_name     = "${var.lambda_file_name}"
  lambda_handler       = "${var.lambda_handler}"
  lambda_timeout       = "${var.lambda_timeout}"
  lambda_runtime       = "${var.lambda_runtime}"
}


