#############################################
# Get latest Apple macOS AMI with Terraform #
#############################################

# Get latest Apple macOS Monterey 12 AMI
data "aws_ami" "mac-monterrey" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ec2-macos-12*"]
  }
}

# Get latest Apple macOS Big Sur 11 AMI
data "aws_ami" "mac-bigsur" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ec2-macos-11*"]
  }
}

# Get latest Apple macOS Catalina 10.5 AMI
data "aws_ami" "mac-catalina" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ec2-macos-10.15*"]
  }
}

# Get latest Apple macOS Mojave 10.4 AMI
data "aws_ami" "mac-mojave" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name = "name"
    values = ["amzn-ec2-macos-10.14*"]
  }
}


# output Ubuntu AMI IDs
# output "macos_mojave_ami_id" {
#   value = data.aws_ami.mac-mojave.id
# }

# output "macos_catalina_ami_id" {
#   value = data.aws_ami.mac-catalina.id
# }

# output "macos_big_sur_ami_id" {
#   value = data.aws_ami.mac-bigsur.id
# }

# output "macos_monterrey_ami_id" {
#   value = data.aws_ami.mac-monterrey.id
# }
