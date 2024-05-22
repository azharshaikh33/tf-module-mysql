resource "aws_db_instance" "mysql" {
  allocated_storage      = 10
  db_name                = "mydb"
  engine                 = "mysql"
  engine_version         = "5.7"
  instance_class         = "db.t3.micro"
  username               = "admin1"
  password               = "RoboShop1"
  parameter_group_name   = aws_db_parameter_group.mysql_pg.name
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.mysql_subnet_group.name
  vpc_security_group_ids = [aws_security_group.allow_mysql.id]
}

resource "aws_db_parameter_group" "mysql_pg" {
  name   = "roboshop-${var.ENV}-mysql-pg"
  family = "mysql5.7"
}

resource "aws_db_subnet_group" "mysql_subnet_group" {
  name       = "roboshop-${var.ENV}-mysql-subnet-group"
  subnet_ids = data.terraform_remote_state.vpc.outputs.PRIVATE_SUBNET_IDS

    tags = {
      Name = "roboshop-${var.ENV}-mysql-subnet-group"
    }
}