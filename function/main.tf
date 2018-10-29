resource "aws_lambda_function" "lambda_function" {
  handler                        = "${var.handler}"
  function_name                  = "${var.function_name}-${var.environment}"
  memory_size                    = "${var.memory_size}"
  role                           = "${var.execution_role_arn}"
  runtime                        = "${var.runtime}"
  filename                       = "${var.filename}"
  timeout                        = "${var.timeout}"
  reserved_concurrent_executions = "${var.reserved_concurrent_executions}"

  vpc_config {
    subnet_ids         = ["${var.subnet_ids}"]
    security_group_ids = ["${var.security_group_ids}"]
  }

  environment {
    variables = "${var.lambda_env_vars}"
  }
}
