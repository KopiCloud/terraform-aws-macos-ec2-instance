###################################
## Virtual Machine Module - Main ##
###################################

# Create the EC2 Instance
resource "aws_instance" "macos-instance" {
  ami           = data.aws_ami.mac-monterrey.id
  host_id       = aws_ec2_host.macos-host.id
  instance_type = "mac1.metal"
  key_name      = aws_key_pair.key_pair.key_name
  
  subnet_id              = aws_subnet.public-subnet.id
  availability_zone      = var.aws_region_az
  vpc_security_group_ids = [aws_security_group.macos-sg.id]

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-macos-instance"
    Environment = var.app_environment
  }

}

# Define the security group for the macOS instance
resource "aws_security_group" "macos-sg" {
  name        = "${lower(var.app_name)}-${var.app_environment}-macos-sg"
  description = "Allow incoming traffic to macOS EC2 Instance"
  vpc_id      = aws_vpc.vpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow incoming SSH connections"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-macos-sg"
    Environment = var.app_environment
  }
}

# Create Elastic IP for the macOS instance
resource "aws_eip" "macos-eip" {
  vpc  = true
  tags = {
    Name        = "${lower(var.app_name)}-${var.app_environment}-macos-eip"
    Environment = var.app_environment
  }
}

# Associate Elastic IP to the macOS Insatance
resource "aws_eip_association" "macos-eip-association" {
  instance_id   = aws_instance.macos-instance.id
  allocation_id = aws_eip.macos-eip.id
}