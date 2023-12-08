# provider "aws" {
#   region = var.region_aws
# }


# Create VPC

resource "aws_vpc" "VPC_A" {
  cidr_block = var.vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name = var.vpc_tag_name
  }
}

# Create Subnet (we can create multiple subnet with this)

resource "aws_subnet" "subnet" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }
  vpc_id            = aws_vpc.VPC_A.id
  cidr_block        = each.value.vpc_subnet_cidr
  availability_zone = var.vpc_subnet_az
  tags = {
    "Name" = each.value.vpc_subnet_tag_name
  }
}


#Create IGW


resource "aws_internet_gateway" "vpc_a_igw" {
 vpc_id = aws_vpc.VPC_A.id
 tags = {
    Name = var.vpc_igw_name
 }
}


#Create RouteTable


resource "aws_route_table" "vpc_a_rt" {
  vpc_id = aws_vpc.VPC_A.id
  tags = {
    Name = var.vpc_rt_tag_name
  }

  route {
    # Associated subnet can reach public internet
    cidr_block =var.vpc_rt_cidr

    # Which internet gateway to use
    gateway_id = aws_internet_gateway.vpc_a_igw.id
  }
}


# Create a Route Table Association ( for multiple subnets)

resource "aws_route_table_association" "rt_association_1" {
  for_each = { for idx, subnet in var.subnets : idx => subnet }

  route_table_id = aws_route_table.vpc_a_rt.id # Replace with your route table resource identifier
  subnet_id      = aws_subnet.subnet[each.key].id
}



# Create a Route Default Route

resource "aws_route" "route_igw" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.vpc_a_igw.id
  route_table_id  = aws_route_table.vpc_a_rt.id
}


# Create Security Group

resource "aws_security_group" "vpc_a_sg" {
  vpc_id      = aws_vpc.VPC_A.id

# we can add more rules as per requirement

  ingress {
    description      = "SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "ICMP"
    from_port        = -1
    to_port          = -1
    protocol         = "icmp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}