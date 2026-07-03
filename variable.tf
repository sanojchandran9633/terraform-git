variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sub_name" {
  type = map(string)
  default = {
    "1"  = "sub-1"
    "2" = "sub-2"
  }
}