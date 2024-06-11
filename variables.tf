variable "instance_type" {
  description = "The type of instance to deploy"
}

variable "ami_id_us_east_1" {
  description = "AMI ID for the instance in us-east-1"
}
variable "vpc_cidr_block_us_east_1" {
  description = "CIDR block for the VPC in us-east-1"
}

variable "subnet_cidr_block_us_east_1" {
  description = "CIDR block for the subnet in us-east-1"
}

variable "ami_id_us_east_2" {
  description = "AMI ID for the instance in us-east-2"
}

variable "vpc_cidr_block_us_east_2" {
  description = "CIDR block for the VPC in us-east-2"
}

variable "subnet_cidr_block_us_east_2" {
  description = "CIDR block for the subnet in us-east-2"
}
