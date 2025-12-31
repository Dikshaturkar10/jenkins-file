variable "aws_region" {
  default = "eu-north-1"
}

variable "cluster_name" {
  default = "my-eks-cluster"
}

variable "instance_type" {
  default = "t3.micro"
}

variable "desired_nodes" {
  default = 2
}