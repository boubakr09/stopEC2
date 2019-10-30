output "iam_role_name" {
  value = "${aws_iam_role.stop_ec2.name}"
}

output "iam_role_arn" {
  value = "${aws_iam_role.stop_ec2.arn}"
}

output "iam_policy_name" {
  value = "${aws_iam_policy.stop_ec2.name}"
}

output "iam_policy_arn" {
  value = "${aws_iam_policy.stop_ec2.arn}"
}

output "lambda_function_arn" {
  value = "${aws_lambda_function.stopEC2Instances.arn}"
}

output "lambda_function_name" {
  value = "${var.lambda_function_name}"
}

output "cloudwatch_event_rule_name" {
  value = "${aws_cloudwatch_event_rule.stop_ec2.arn}"
}

output "cloudwatch_event_rule_arn" {
  value = "${aws_cloudwatch_event_rule.stop_ec2.arn}"
}
