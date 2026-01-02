provider "aws" {
    region = "eu-north-1"
  
}

resource "aws_instance" "my_instance" {
    ami = "ami-0fa91bc90632c73c9"
    instance_type = "t3.micro"
    key_name = "viju-key"
    vpc_security_group_ids = [aws_vpc.my_vpc.id]


    tags = {
      name = "my-instance"
      env = "dev"
    }
}

resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      env = "dev"
    }
  
}

resource "aws_subnet" "public_subet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/17"
    availability_zone = "eu-north-1a"
    map_public_ip_on_launch = true

    tags = {
      name = "public-subnet"
    }

}

resource "aws_subnet" "private_subet" {
    vpc_id = aws_vpc.my_vpc.id
    cidr_block = "10.0.0.0/17"
    availability_zone = "eu-north-1a"

    tags = {
      name = "private-subnet"
    }

}



resource "aws_internet_gateway" "my_igw" {
    vpc_id = aws_vpc.my_vpc.id

    tags = {
      name = "my-igw"
      env = "dev"
    }

}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }
  tags = {
    Name = "public_route_table"
  }
}

## Teraaform file 
