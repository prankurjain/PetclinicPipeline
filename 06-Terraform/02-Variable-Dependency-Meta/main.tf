provider "aws" {
  region  = "us-east-2"
  version = ">=3.7,<=3.11"
}

variable "zones" {
  default = ["us-east-2a", "us-east-2b"]
}


resource "aws_instance" "frontend" {
  ami           = "ami-0b9064170e32bde34"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.backend]
  tags = {
    Name = "Frontend"
  }
}


resource "aws_instance" "backend" {
  ami           = "ami-0b9064170e32bde34"
  instance_type = "t2.micro"
  count         = 2
  availability_zone = var.zones[count.index]
  tags = {
    Name = "Backend"
  }
}
