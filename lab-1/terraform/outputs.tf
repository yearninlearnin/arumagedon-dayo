# Explanation: Outputs are your mission report—what got built and where to find it.
output "fugaku_vpc_id" {
  value = aws_vpc.fugaku_vpc01.id
}

output "fugaku_public_subnet_ids" {
  value = aws_subnet.fugaku_public_subnets[*].id
}

output "fugaku_private_subnet_ids" {
  value = aws_subnet.fugaku_private_subnets[*].id
}

output "fugaku_ec2_instance_id" {
  value = aws_instance.fugaku_ec201.id
}

output "fugaku_rds_endpoint" {
  value = aws_db_instance.fugaku_rds01.address
}

output "fugaku_sns_topic_arn" {
  value = aws_sns_topic.fugaku_sns_topic01.arn
}

output "fugaku_log_group_name" {
  value = aws_cloudwatch_log_group.fugaku_log_group01.name
}