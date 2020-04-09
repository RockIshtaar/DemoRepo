provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/ec2-user/.aws/cedentials"
}

resource "aws_security_group" "WebSG" {
 # name        = "WebDMZDemo1"
 # description = "Allow SSH and HTTP inbound traffic"

  ingress {
    #description = "TLS from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    #description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebDMZDemo1"
  }
}


resource "aws_instance" "web" {
  ami           = "ami-0fc61db8544a617ed"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.WebSG.name}"]
  key_name = "KPKPKP"
  tags = {
    Name = "WebServer1"
  }
}
