# Configure the AWS Provider
provider "aws" {
  region = "us-east-2"
  #access_key = "my-access-key"
  #secret_key = "my-secret-key"
}

resource "aws_instance" "web" {
  ami           = "ami-0b9064170e32bde34"
  instance_type = "t2.micro"

  tags = {
    Name = "MyFirstTFNode"
  }
}
