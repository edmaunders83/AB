variable aws_region {
    type = list(string)
    description = "Region for AWS resoruces"
}

variable prosimo_cidr {
  type = list(string)
  description = "valid subnets to assign to server"
}

variable azure_region {
  type = list(string)
  description = "valid azure region"
}

# Variable used for region EU-West-1

variable "ABinBEV_AWS_VPC" {
  type = map(object({
    aws_vpc_name                = string
    igw_name                    = string
    rt_name                     = string
    aws_vpc_cidr                = string
    igw_name                    = string
    subnet_az                   = string
    vpc_rt_name                 = string
    subnets               = list(object({
      vpc_subnet_tag_name = string
      vpc_subnet_cidr     = string
    }))
  }))
}

# Variable used for region EU-West-2

variable "ABinBEV_AWS_VPC_region_West_2" {
  type = map(object({
    aws_vpc_name                = string
    igw_name                    = string
    rt_name                     = string
    aws_vpc_cidr                = string
    igw_name                    = string
    subnet_az                   = string
    vpc_rt_name                 = string
    subnets               = list(object({
      vpc_subnet_tag_name = string
      vpc_subnet_cidr     = string
    }))
  }))
}

# Variable used for region Europe

variable "ABinBEV_Azure_VNET" {
  type = map(object({
    azure_resource_group        = string
    azure_vnet_name             = string
    azure_vnet_cidr             = string
    nsg_name                    = string
    subnets               = list(object({
      azure_subnet_name = string
      azure_subnet_cidr = list(string)
    }))
  }))
}

# Variable used for region CentralUS

variable "ABinBEV_Azure_VNET_region_central" {
  type = map(object({
    azure_resource_group        = string
    azure_vnet_name             = string
    azure_vnet_cidr             = string
    nsg_name                    = string
    subnets               = list(object({
      azure_subnet_name  = string
      azure_subnet_cidr  = list(string)
    }))
  }))
}