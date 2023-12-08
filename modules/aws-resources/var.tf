
variable "region_aws" {
    type = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "vpc_tag_name" {
  description = "Tag for VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnet configurations"
  type = list(object({
    vpc_subnet_tag_name = string
    vpc_subnet_cidr     = string
  }))
}

variable "vpc_subnet_az" {
  description = "Availability Zone for Subnet"
  type        = string
}

variable "vpc_igw_name" {
  description = "Tag for VPC x Internet GW"
  type        = string
}

variable "vpc_rt_tag_name" {
  description = "Tag for VPC x Route Table"
  type        = string
}

variable "vpc_rt_cidr" {
  description = "CIDR for VPC x Route Table"
  type        = string
}