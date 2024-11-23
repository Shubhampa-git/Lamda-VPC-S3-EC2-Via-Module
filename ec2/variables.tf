
variable "ec2_ami_id" {
  description = "AMI ID for EC2 instance"
}

variable "ec2_instance_type" {
  description = "Instance type for EC2"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 will be launched"
}

variable "vpc_id" {
  description = "VPC ID where EC2 will be launched"
}
