# creating locals

locals {
  MYSQL_USER = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["RDS_USERNAME"]
  MYSQL_PASS = jsondecode(data.aws_secretsmanager_secret_version.secrets.secret_string)["RDS_PASSWORD"]
}