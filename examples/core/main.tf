provider "aws" {
  region = "eu-west-1"
}

#####
# VPC and subnets
#####
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "2.21.0"

  name = "simple-vpc"

  cidr = "10.0.0.0/16"

  azs             = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = false

  tags = {
    Environment = "test"
    Project     = "sample"
  }
}

#####
# VPC Flow Logs
#####
module "flow-logs" {
  source = "../../"

  name_prefix = "test-example"
  vpc_id      = module.vpc.vpc_id

  traffic_type = "ALL"
  # retention_in_days = 30

  tags = {
    Environment = "test"
    Project     = "sample"
  }
}
