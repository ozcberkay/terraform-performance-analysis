terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.44.0"
    }
  }
}

variable access_key { sensitive=true}
variable secret_key { sensitive=true}

provider "aws" {
    region = "eu-central-1"
    access_key = var.access_key
    secret_key = var.secret_key
}

resource "aws_instance" "foo" {
  ami           = "ami-05f7491af5eef733a"
  instance_type = "t2.micro"
  associate_public_ip_address = true
  key_name = "iac_key"

}
