# Prosimo and CSP Infra Resources


# Edge in EU-WEST-1

module "prosimo_edge_aws_eu-west-1" {
  source     = "./modules/prosimo-resources"
  ip_range       = var.prosimo_cidr[0]
  cloud_name = "AWS-Infra"
  my_condition = "true"
  bandwidth = "<1 Gbps"
  instance_type = "t3.medium"
  cloud_region = var.aws_region[0]
  deploy_edge = true
  decommission_edge = false
  wait = true
}

# Edge in EU-WEST-2

module "prosimo_edge_aws_eu-west-2" {
  source     = "./modules/prosimo-resources"
  ip_range       = var.prosimo_cidr[1]
  cloud_name = "AWS-Infra"
  my_condition = "true"
  bandwidth = "<1 Gbps"
  instance_type = "t3.medium"
  cloud_region = var.aws_region[1]
  deploy_edge = true
  decommission_edge = false
  wait = true
}

# Edge in Europe

module "prosimo_edge_azure_europe" {
  source     = "./modules/prosimo-resources"
  ip_range       = var.prosimo_cidr[2]
  cloud_name = "Azure-Infra"
  my_condition = "false"
  cloud_region = var.azure_region[0]
  deploy_edge = true
  decommission_edge = false
  wait = true
}

# Edge in CentralUS

module "prosimo_edge_azure_centralus" {
  source     = "./modules/prosimo-resources"
  ip_range       = var.prosimo_cidr[3]
  cloud_name = "Azure-Infra"
  my_condition = "false"
  cloud_region = var.azure_region[1]
  deploy_edge = true
  decommission_edge = false
  wait = true

}

# AWS CSP's resources in EU-West-1

module "aws_infra_resource" {
  source = "./modules/aws-resources"

  for_each              = var.ABinBEV_AWS_VPC
  region_aws            = var.aws_region[0]
  vpc_tag_name          = each.value["aws_vpc_name"]
  vpc_cidr              = each.value["aws_vpc_cidr"]
  subnets               = each.value.subnets
  vpc_igw_name          = each.value["igw_name"]
  vpc_subnet_az         = each.value["subnet_az"]
  vpc_rt_tag_name       = each.value["vpc_rt_name"]
  vpc_rt_cidr           = "0.0.0.0/0"
}

# AWS CSP's resources in EU-West-2 

module "aws_infra_resource_region_2" {
  source = "./modules/aws-resources"

  for_each              = var.ABinBEV_AWS_VPC_region_West_2
  region_aws            = var.aws_region[1]
  vpc_tag_name          = each.value["aws_vpc_name"]
  vpc_cidr              = each.value["aws_vpc_cidr"]
  subnets               = each.value.subnets
  vpc_igw_name          = each.value["igw_name"]
  vpc_subnet_az         = each.value["subnet_az"]
  vpc_rt_tag_name       = each.value["vpc_rt_name"]
  vpc_rt_cidr           = "0.0.0.0/0"
}

# Azure CSP's resources in Eastus2

module "azure_infra_resource" {
  source = "./modules/azure-resources"

  for_each             = var.ABinBEV_Azure_VNET
  azure_resource_group = each.value["azure_resource_group"]
  azure_location       = var.azure_region[0]
  azure_vnet_name      = each.value["azure_vnet_name"]
  subnets              = each.value.subnets
  nsg_name             = each.value["nsg_name"]
  azure_vnet_cidr      = each.value["azure_vnet_cidr"]
}

# AWS CSP's resources in CentralUS 

module "azure_infra_resource_region_2" {
  source = "./modules/azure-resources"

  for_each             = var.ABinBEV_Azure_VNET_region_central
  azure_resource_group = each.value["azure_resource_group"]
  azure_location       = var.azure_region[1]
  azure_vnet_name      = each.value["azure_vnet_name"]
  subnets              = each.value.subnets
  nsg_name             = each.value["nsg_name"]
  azure_vnet_cidr      = each.value["azure_vnet_cidr"]
}