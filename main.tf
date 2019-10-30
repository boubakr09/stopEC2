//Define the cloud provider
provider "aws" {
  region = "${var.region}"
}

//IAM role for our lambda function
resource "aws_iam_role" "stop_ec2" {
  name = "${var.lambda_iam_role}"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
    tag-key = "${var.lambda_iam_role_tag}"
  }
}

//Policy for the above lambda IAM role to authorize the lambda function to perform some actions on cloudwatch and ec2
resource "aws_iam_policy" "stop_ec2" {
  name        = "${var.iam_policy_name}"
  description = "${var.iam_policy_description}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Start*",
        "ec2:Stop*",
        "ec2:Describe*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}

//Attach the IAM policy to IAM role
resource "aws_iam_role_policy_attachment" "stop_ec2-attach" {
  role       = "${aws_iam_role.stop_ec2.name}"
  policy_arn = "${aws_iam_policy.stop_ec2.arn}"
}

//Lambda function for stoping ec2 instances based on tag
resource "aws_lambda_function" "stopEC2Instances" {
  function_name    = "${var.lambda_function_name}"
  runtime          = "${var.lambda_runtime}"
  role             = "${aws_iam_role.stop_ec2.arn}"
  filename         = "${var.lambda_file_name}"
  handler          = "${var.lambda_handler}"
  source_code_hash = "${filebase64sha256(var.lambda_file_name)}"
  timeout          = "${var.lambda_timeout}"

  environment {
    variables = {
      region = "${var.region}"
    }
  }
}

//Cloudwatch event rule to trigger our lambda function
resource "aws_cloudwatch_event_rule" "stop_ec2" {
  name                = "${var.aws_cloudwatch_event_rule_name}"
  description         = "${var.aws_cloudwatch_event_rule_description}"
  schedule_expression = "${var.aws_cloudwatch_event_rule_schedule_expression}"
}

//the target lambda
resource "aws_cloudwatch_event_target" "stop_ec2" {
  rule = "${aws_cloudwatch_event_rule.stop_ec2.name}"
  arn  = "${aws_lambda_function.stopEC2Instances.arn}"
}