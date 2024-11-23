# Adding a random suffix to the IAM role name to make it unique
resource "random_id" "ec2_role_suffix" {
  byte_length = 4
}

resource "aws_iam_role" "ec2_role" {
  name = "ec2_instance_role_${random_id.ec2_role_suffix.hex}"  # Add unique suffix to role name
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}


resource "aws_instance" "my_instance" {
  ami                    = var.ec2_ami_id
  instance_type          = var.ec2_instance_type
  subnet_id              = var.subnet_id
  # iam_instance_profile   = aws_iam_role.ec2_role.name
  # ami                    = var.ec2_ami_id
  # instance_type          = var.ec2_instance_type
  # subnet_id              = var.subnet_id
}

