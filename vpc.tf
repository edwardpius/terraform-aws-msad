#
# VPC
#

resource "aws_vpc" "vpc_myapp" {

  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = merge(map(
    "Name", "VPC-MYAPP",
    ),
  var.default_tags)
}

#
# Internet Gateway - VPC wide
#

resource "aws_internet_gateway" "igw_main" {

  vpc_id = aws_vpc.vpc_myapp.id
  tags = merge(map(
    "Name", "IGW-MYAPP",
    ),
  var.default_tags)

  depends_on = [aws_vpc.vpc_myapp]
}

#
# NAT Gateway in AZ1
#

resource "aws_nat_gateway" "natgw_az1" {

  allocation_id = aws_eip.eip_natgw_az1.id
  subnet_id     = aws_subnet.subnet_dmz_az1.id

  depends_on = [aws_internet_gateway.igw_main]

}

#
# NAT Gateway in AZ2
#

resource "aws_nat_gateway" "natgw_az2" {

  allocation_id = aws_eip.eip_natgw_az2.id
  subnet_id     = aws_subnet.subnet_dmz_az2.id

  depends_on = [aws_internet_gateway.igw_main]

}
