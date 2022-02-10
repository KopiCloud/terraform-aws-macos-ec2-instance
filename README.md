# Terraform AWS macOS EC2 Instance

Deploying an Apple macOS in AWS using Terraform

Supports:
* Apple macOS Mojave 10.4
* Apple macOS Catalina 10.5
* Apple macOS Big Sur 11
* Apple macOS Monterey 12 

To change the macOS version, just update the **ami** line in the **macos-vm-main.tf** file, with a variable from the **macos-versions.tf** file.
