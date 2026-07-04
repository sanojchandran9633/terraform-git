variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "sub_name" {
  type = map(string)
  default = {
    "1" = "Pri-1"
    "2" = "Pri-2"
    "3" = "Pub-3"
    "4" = "Pub-4"
  }
}