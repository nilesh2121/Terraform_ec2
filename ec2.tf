# added the ec2 instance details 
resource "aws_instance" "webserver" {
    ami = "ami-0675118d2eaeabbc7"
    instance_type = "t2.micro"
    key_name = "mylaptop1"
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
    key_name = "mylaptop1"
    subnet_id = aws_subnet.private_subnet.id
    vpc_security_group_ids = [aws_security_group.dbsg.id]
    tags = {
      Name = "db-server"
    }
  
}

# added the keypaire location

resource "aws_key_pair" "mylaptop1" {
    key_name = "mylaptop1"
    public_key = file("home/ubuntu/.ssh/id_rsa.pub")
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
