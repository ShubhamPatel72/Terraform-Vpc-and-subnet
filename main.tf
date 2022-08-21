provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA4C6RMML63MIKBS54"
  secret_key = "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"

}

#creating Vpc
resource "aws_vpc" "My-Vpc" {
  cidr_block = "20.0.0.0/16"
  tags = {
    Name = "my-vpc"
  }
}

#creating public subnet
resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.My-Vpc.id
  cidr_block = "20.0.1.0/24"
  tags = {
    Name = "subnet-public"
  }
  map_public_ip_on_launch = "true"
}

#creating private subnet
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.My-Vpc.id
  cidr_block = "20.0.3.0/24"
  tags = {
    Name = "subnet-private"
  }
  map_public_ip_on_launch = "true"
}

#creating ec2-instance
resource "aws_instance" "Node-server" {
  ami           = "ami-090fa75af13c156b4"
  instance_type = "t2.micro"

  tags = {
    Name = "node-server"
  }
}
