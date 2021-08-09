# AWS credentials
# provider_aws_access_key = "access_key_here"
# provider_aws_secret_key = "secret_key_here"
# provider_aws_zone = "us-east-1"

# Availability zones
az1 = "us-east-1a"
az2 = "us-east-1b"

# VPC
vpc_cidr = "10.1.0.0/16"

subnet_priv_cidr_az1 = "10.1.1.0/24"
subnet_priv_cidr_az2 = "10.1.2.0/24"

subnet_dmz_cidr_az1 = "10.1.3.0/24"
subnet_dmz_cidr_az2 = "10.1.4.0/24"

trusted_ip_address = "xx.xx.xx.xx/32"

# Directory Service
dir_domain_name    = "edwardpius.com"
dir_admin_password = ""
dir_type           = "MicrosoftAD"
dir_computer_ou    = "OU=edwardpius,DC=edwardpius,DC=com"

# AD Writer machine
vm_adwriter_disable_api_termination = false
vm_adwriter_instance_type           = "t2.small"
# vm_adwriter_image                   = "ami-9e3bbefd" # Windows Server 2012 R2 Base, ap-southeast-1
vm_adwriter_image     = "ami-00b8c4dc8b8281a68" # Windows Server 2012 R2 Base, us-east-1
vm_adwriter_disk_size = 30