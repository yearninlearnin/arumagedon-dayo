variable "aws_region" {
  description = "AWS Region for the fugaku to supercompute."
  type        = string
  default     = "ap-northeast-1"
}

variable "project_name" {
  description = "Project fugaku,we are not playing."
  type        = string
  default     = "fugaku"
}

variable "vpc_cidr" {
  description = "VPC CIDR (use 10.x.x.x/xx as instructed)."
  type        = string
  default     = "10.248.0.0/16" # taken from the defunct mizuno project
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDRs (use 10.x.x.x/xx)."
  type        = list(string)
  default     = ["10.248.1.0/24", "10.248.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDRs (use 10.x.x.x/xx)."
  type        = list(string)
  default     = ["10.248.71.0/24", "10.248.72.0/24"] # sensei had this set to 101,102
}

variable "azs" {
  description = "Availability Zones list (match count with subnets)."
  type        = list(string)
  default     = ["ap-northeast-1a", "ap-northeast-1c"] # Tokyo zone B has been missing in Tokyo for a long time
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 app host."
  type        = string
  default     = "ami-09cd9fdbf26acc6b4" #ami from working code
}

variable "ec2_instance_type" {
  description = "EC2 instance size for the app."
  type        = string
  default     = "t3.micro"
}

variable "db_engine" {
  description = "RDS engine."
  type        = string
  default     = "mysql"
}

variable "db_instance_class" {
  description = "RDS instance class."
  type        = string
  default     = "db.t3.micro"
}

variable "db_name" {
  description = "Initial database name."
  type        = string
  default     = "fugakudb" #changed from "mysql"
}

variable "db_username" {
  description = "DB master username (students should use Secrets Manager in 1B/1C)."
  type        = string
  default     = "admin" # TODO: student supplies // I think in general admin applies in general. Doublecheck this.
}

variable "db_password" {
  description = "DB master password (DO NOT hardcode in real life; for lab only)."
  type        = string
  sensitive   = true
  default     = "karoushi" # hint 過労死だよ
}

variable "sns_email_endpoint" {
  description = "Email for SNS subscription (PagerDuty simulation)."
  type        = string
  default     = "umaidevsec@gmail.com" # TODO: student supplies
}
