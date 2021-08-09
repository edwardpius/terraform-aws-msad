#
# DMZ subnet in AZ1
# 

resource "aws_subnet" "subnet_dmz_az1" {

  vpc_id                  = aws_vpc.vpc_myapp.id
  availability_zone       = var.az1
  cidr_block              = var.subnet_dmz_cidr_az1
  map_public_ip_on_launch = true
  tags = merge(map(
    "Name", "SUBNET-DMZ-AZ1",
    ),
  var.default_tags)
}

#
# DMZ subnet in AZ2
# 

resource "aws_subnet" "subnet_dmz_az2" {

  vpc_id                  = aws_vpc.vpc_myapp.id
  availability_zone       = var.az2
  cidr_block              = var.subnet_dmz_cidr_az2
  map_public_ip_on_launch = true
  tags = merge(map(
    "Name", "SUBNET-DMZ-AZ2",
    ),
  var.default_tags)
}

#
# Private subnet in AZ1
# 

resource "aws_subnet" "subnet_priv_az1" {

  vpc_id                  = aws_vpc.vpc_myapp.id
  availability_zone       = var.az1
  cidr_block              = var.subnet_priv_cidr_az1
  map_public_ip_on_launch = false
  tags = merge(map(
    "Name", "SUBNET-PRIV-AZ1",
    ),
  var.default_tags)
}

#
# Private subnet in AZ2
# 

resource "aws_subnet" "subnet_priv_az2" {

  vpc_id                  = aws_vpc.vpc_myapp.id
  availability_zone       = var.az2
  cidr_block              = var.subnet_priv_cidr_az2
  map_public_ip_on_launch = false
  tags = merge(map(
    "Name", "SUBNET-PRIV-AZ2",
    ),
  var.default_tags)
}

