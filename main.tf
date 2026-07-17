resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = "Main-VPC"
  }
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

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "ubuntu" {
  count         = 2
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.subnets["pub-1"].id

  tags = {
    Name = "server-[count.index]"
  }
}
