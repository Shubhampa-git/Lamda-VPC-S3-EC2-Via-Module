# Adding a random suffix to the IAM role name to make it unique
resource "random_id" "lambda_role_suffix" {
  byte_length = 4
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda_execution_role_${random_id.lambda_role_suffix.hex}"  # Add unique suffix to role name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# resource "aws_lambda_function" "my_lambda" {
#   function_name = var.lambda_function_name
#   role          = aws_iam_role.lambda_execution_role.arn
#   handler       = "index.handler"
#   runtime       = "nodejs18.x"
#   filename      = "lambda/function.zip"
# }

resource "aws_lambda_function" "my_lambda" {
  function_name = var.lambda_function_name
  role          = aws_iam_role.lambda_execution_role.arn
  handler       = "index.handler"
  runtime       = "nodejs18.x"

  # Correct path to the ZIP file
  filename      = "${path.module}/function.zip"

  # Environment variables (if needed)
  environment {
    variables = {
      ENV_VAR_KEY = "value"
    }
  }
}


# Remove the following output from here:
# output "lambda_function_name" {
#   value = aws_lambda_function.my_lambda.function_name
# }
