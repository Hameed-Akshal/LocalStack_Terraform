terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.53.0"
    }
  }
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
  access_key = "test"
  secret_key = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    ec2     = "http://localhost:4566"
  }
  
}

provider "aws" {
  alias  = "use2"
  region = "us-east-2"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true
  endpoints {
    ec2    = "http://localhost:4566"
  }
  access_key = "test"
  secret_key = "test"
  
}

module "ec2_instance_us_east_1" {
  source            = "./modules/ec2_instance"
  providers         = { aws = aws.use1 }
  region            = "us-east-1"
  ami_id            = var.ami_id_us_east_1
  instance_type     = var.instance_type
  vpc_cidr_block    = var.vpc_cidr_block_us_east_1
  subnet_cidr_block = var.subnet_cidr_block_us_east_1
}

module "ec2_instance_us_east_2" {
  source            = "./modules/ec2_instance"
  providers         = { aws = aws.use2 }
  region            = "us-east-2"
  ami_id            = var.ami_id_us_east_2
  instance_type     = var.instance_type
  vpc_cidr_block    = var.vpc_cidr_block_us_east_2
  subnet_cidr_block = var.subnet_cidr_block_us_east_2
}
