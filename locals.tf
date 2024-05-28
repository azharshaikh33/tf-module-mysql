# creating locals

locals {
  MYSQL_USER = jsondecode(aws_secretsmanager_secret_version.secrets.secret_string)["MYSQL_USERNAME"]
  MYSQL_PASS = jsondecode(aws_secretsmanager_secret_version.secrets.secret_string)["MYSQL_PASSWORD"]
}