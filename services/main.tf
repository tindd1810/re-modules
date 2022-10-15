resource "aws_instance" "tindd-amz-ec2" {
  count                  = var.ec2-instance
  ami                    = "ami-04ff9e9b51c1f62ca"
  instance_type          = "t3.micro"
  # vpc_security_group_ids = [aws_security_group.tindd-re-sg.id]
  vpc_security_group_ids = [data.terraform_remote_state.networking.outputs.sg-id]
  key_name               = aws_key_pair.prod-publickey.key_name
  user_data              = file("${path.module}/userdata.sh")
  # user_data = file("userdata.sh")

  tags = {
    Name = "tindd-amz-ec2"
    Project = "devops"
    CreatedBy = "tindd"
  }
}

data "terraform_remote_state" "networking" {
  backend = "s3"

  config = {
    bucket = var.bucket
    key    = "vpc/terraform.tfstate"
    region = "ap-southeast-1"
  }
}

output "ec2-ip0" {
  value = aws_instance.tindd-amz-ec2[0].public_ip
}
output "ec2-ip1" {
  value = aws_instance.tindd-amz-ec2[1].public_ip
}
output "ec2-ip2" {
  value = aws_instance.tindd-amz-ec2[2].public_ip
}
output "ec2-ip3" {
  value = aws_instance.tindd-amz-ec2[3].public_ip
}
# output "tindd-ec2-ip" {
#     value = aws_instance.tindd-amz-ec2.public_ip
# }

# data "aws_availability_zones" "zones-available" {
#     state = "available"
# }

# output "aws_availability_zones" {
#     value = data.aws_availability_zones.zones-available
# }