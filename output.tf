output vpc-id {
  value       = aws_vpc.main.id
  description = "Main VPC Id:"
}

output "subnets"{
  value = values(aws_subnet.subnets)[*].id
}
