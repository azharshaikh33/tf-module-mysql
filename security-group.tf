# Create a security group
resource "aws_security_group" "allow_mysql" {
  name        = "roboshop-${var.ENV}-mysql-sg"
  description = "Allow Mysql internal inbound traffic"
  vpc_id = data.terraform_remote_state.vpc.outputs.VPC_ID

  # Inbound rules
  ingress {
    description = "Allow Rds from local network"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.DEFAULT_VPC_CIDR]
  }

    ingress {
    description = "Allow Rds from local network"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = [data.terraform_remote_state.vpc.outputs.VPC_CIDR]
  }

  # Outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-${var.ENV}-mysql-sg"
  }
}