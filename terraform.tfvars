# TFvars values passed for CSP's resources

# AWS regions
aws_region = [
          "eu-west-1",
          "eu-west-2",
]

# Azure regions
azure_region = [
          "ukwest",
          "centralus",
]

# Prosimo Edge CIDRs

prosimo_cidr = [
          "192.168.64.0/23",
          "192.168.66.0/23",
          "192.168.68.0/23",
          "192.168.70.0/23",
]


# VPC's variables used in EU-West-1 region

ABinBEV_AWS_VPC = {
  VPC1 = {
    aws_vpc_name          = "VPC_A"
    igw_name              = "IGW-VPC-A"
    rt_name               = "VPC_A_RT"
    aws_vpc_cidr          = "10.10.0.0/16"
    igw_name              = "igw_vpc_a"
    subnet_az             = "eu-west-1a"
    vpc_rt_name           = "vpc_a_rt"
      subnets = [
      {
        vpc_subnet_tag_name = "VPC_A_Subnet_1"
        vpc_subnet_cidr = "10.10.1.0/24"
      }
      ]
  },

  VPC2 = {
    aws_vpc_name          = "VPC_B"
    igw_name              = "IGW-VPC-B"
    rt_name               = "VPC_B_RT"
    aws_vpc_cidr          = "10.10.0.0/16"
    igw_name              = "igw_vpc_b"
    subnet_az             = "eu-west-1b"
    vpc_rt_name           = "vpc_b_rt"
      subnets = [
      {
        vpc_subnet_tag_name = "VPC_B_Subnet_1"
        vpc_subnet_cidr = "10.10.2.0/24"
      }
      ]
  },

# This VPCs has 2 subnets

    VPC3 = {
    aws_vpc_name          = "VPC_C"
    igw_name              = "IGW-VPC-C"
    rt_name               = "VPC_C_RT"
    aws_vpc_cidr          = "10.20.0.0/16"
    igw_name              = "igw_vpc_c"
    subnet_az             = "eu-west-1c"
    vpc_rt_name           = "vpc_c_rt"
        subnets = [
      {
        vpc_subnet_tag_name = "VPC_C_Subnet_1"
        vpc_subnet_cidr = "10.20.1.0/24"
      },
      {
        vpc_subnet_tag_name = "VPC_C_Subnet_1"
        vpc_subnet_cidr = "10.20.2.0/24"
      }
      ]
  }
}

# VPC's variables used in EU-West-2 region

ABinBEV_AWS_VPC_region_West_2 = {
  VPC3 = {
    aws_vpc_name          = "VPC_D"
    igw_name              = "IGW-VPC-D"
    rt_name               = "VPC_D_RT"
    aws_vpc_cidr          = "10.30.0.0/16"
    igw_name              = "igw_vpc_d"
    subnet_az             = "eu-west-1b"
    vpc_rt_name           = "vpc_d_rt"
        subnets = [
      {
        vpc_subnet_tag_name = "VPC_D_Subnet_1"
        vpc_subnet_cidr = "10.30.1.0/24"
      }
      ]
  }
}


# VNET's variables used in Europe ukwest region

ABinBEV_Azure_VNET = {
  VNET1 = {
    azure_resource_group        = "ABinBev-Prosimo"
    azure_vnet_name             = "VNET_A"
    nsg_name                    = "nsg_1"
    azure_vnet_cidr             = "10.40.0.0/16"
    subnets = [
      {
        azure_subnet_name = "vnet_a_subnet_1"
        azure_subnet_cidr = ["10.40.1.0/24"]
      }
      ]
  },

  VNET2 = {
    azure_resource_group        = "ABinBev-Prosimo"
    azure_vnet_name             = "VNET_B"
    nsg_name                    = "nsg_2"
    azure_vnet_cidr             = "10.40.0.0/16"
    subnets = [
      {
        azure_subnet_name = "vnet_b_subnet_1"
        azure_subnet_cidr = ["10.40.2.0/24"]
      }
      ]
  },

# This VNET has 2 subnets

  VNET3 = {
    azure_resource_group        = "ABinBev-Prosimo"
    azure_vnet_name             = "VNET_C"
    nsg_name                    = "nsg_3"
    azure_vnet_cidr             = "10.50.0.0/16"
    subnets = [
      {
        azure_subnet_name = "vnet_c_subnet_1"
        azure_subnet_cidr = ["10.50.1.0/24"]
      },
      {
        azure_subnet_name = "vnet_c_subnet_2"
        azure_subnet_cidr = ["10.50.2.0/24"]
      }
      ]
  }
}

# VNET's variables used in Centralus region

ABinBEV_Azure_VNET_region_central = {
  VNET1 = {
    azure_resource_group        = "ABinBev-Prosimo-Region-2"
    azure_vnet_name             = "VNET_D"
    nsg_name                    = "nsg_4"
    azure_vnet_cidr             = "10.60.0.0/16"
    subnets = [
      {
        azure_subnet_name = "vnet_d_subnet_1"
        azure_subnet_cidr = ["10.60.1.0/24"]
      }
      ]
  }
}