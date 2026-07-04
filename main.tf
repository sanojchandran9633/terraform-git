resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Main-VPC"
  }
}

locals {
  sub_count = ["1", "2"]
}


resource "aws_subnet" "subnets" {
  for_each   = var.sub_name
  vpc_id     = aws_vpc.main.id
  cidr_block = cidrsubnet(aws_vpc.main.cidr_block, 8, each.key)
  tags = {
    Name        = each.value
    Environment = "Development"
    Project     = "abc-app"
    Owner       = "DevOps team"
    Version     = "1.2.2"
    region      = "us-east-1"
  }
}