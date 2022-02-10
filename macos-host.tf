#################################
## Virtual Machine Host - Main ##
#################################

resource "aws_ec2_host" "macos-host" {
  instance_type     = "mac1.metal"
  availability_zone = var.aws_region_az
  
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-macos-host"
    Environment = var.app_environment
  }
}