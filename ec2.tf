# added the ec2 instance details 
resource "aws_instance" "webserver" {
    ami = "ami-0675118d2eaeabbc7"
    instance_type = "t2.micro"
    key_name = "deployer"
    subnet_id = aws_subnet.public_subnet.id
    associate_public_ip_address = true
    vpc_security_group_ids = [aws_security_group.websg.id]
    tags = {
      Name = "web-server"
    }
  
}

resource "aws_instance" "dbserver" {
    ami = "ami-0675118d2eaeabbc7"
    instance_type = "t2.micro"
    key_name = "deployer"
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    tags = {
      Name = "db-server"
    }
  
}

# added the keypaire location

# resource "aws_key_pair" "mylaptop1" {
#     key_name = "mylaptop1"
#     public_key = file("~/.ssh/id_rsa.pub")
# }

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDljghLTtO4yJETopisIrCYo2qPYGyn5AUt4rzQsVbI5GD917e29XTFaHjrC8x03TsigguTKrMGlJR8mcExeDVoYFBwEMENvPquzduD8KnC2kmqNTKYSWAcD/TQ0oTP3MpnP8gDT6GalNQ2QGmzDO8gnfPhCB/kA7sMnlk5sJquwRrmfXZXLWL83jZ0PVG63KHbILd/Rp+Nop+oki+9lGF0mgRZ8SXWq8f9KZSlMJuGW20Zwt08aeHhB9QMUf167fMp7uIz20gfQl5612iH/+nF71A3TNkbun8w8VHc9nA4gQAReFN1cCyKxnoN0Habbl8EZ9M2WoZQXn+kvSxDataqETzbRyArpwFXyreUv2w/YxoRq9qEt1cMytb3Vx6oWide+7wUcaKGNWvgr+kWeZRGHQMGIOi9jRg9SRtqdfC8/6CcLqV0335vGwBNDXpsE/Im41mGmuh4wxbrub0wEDVivxg/KSbyQwDIC+DDP2uP+nFfq3rxV/g2PIQEJ3CisHk= ubuntu@ip-172-31-86-34"
}



# Method two for

# resource "aws_key_pair" "keypair" {
#     key_name = "keypair"
#     public_key = tls_private_key.rsa.public_key_openssh

# }

# resource "tls_private_key" "rsa" {
#   algorithm = "RSA"
#   rsa_bits = 4096
  
# }

# resource "local_file" "keypair" {
#   content = tls_private_key.rsa.private_key_pem
#   filename = "tfkey"
  
# }
