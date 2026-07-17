variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sub_name" {
  type = map(string)
  default = {
    "1" = "Pri-1"
    "2" = "pub-1"
  }
}

variable "instance_type" {
  description = "Type of EC2 instance to provision"
  default     = "t2.micro"
}

# variable "instance_name" {
#   description = "EC2 instance name"
#   default     = "Provisioned by Terraform"
# }
