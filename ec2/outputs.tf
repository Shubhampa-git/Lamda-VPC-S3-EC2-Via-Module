output "ec2_instance_id" {
  value = aws_instance.my_instance.id
}

output "role_arn" {
  value = aws_iam_role.ec2_role.arn
}

