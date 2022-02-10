#####################################
## Virtual Machine Module - Output ##
#####################################

output "macos_instance_id" {
  value = aws_instance.macos-instance.id
}

output "macos_instance_private_ip" {
  value = aws_instance.macos-instance.private_ip
}

output "macos_instance_public_ip" {
  value = aws_instance.macos-instance.public_ip
}
