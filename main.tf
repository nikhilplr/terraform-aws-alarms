locals {
  non_empty_database_names = [for name in var.database_name : name if length(name) > 0] 
}
 

module "RDS" {
  for_each               = length(local.non_empty_database_names) > 0 ? { for name in local.non_empty_database_names : name => name } : {}
  source                 = "./modules/rds"
  database_name          = each.key
  project                = var.project
  environment            = var.environment
  rds_evaluation_periods = var.rds_evaluation_periods
  rds_period             = var.rds_period
  rds_cpu_threshold      = var.rds_cpu_threshold
  rds_cpu_enabled        = var.rds_cpu_enabled
  sns_topic              = var.create_sns_topic == 1 ? aws_sns_topic.sns_topic[0].arn : data.aws_sns_topic.sns_topic[0].arn
  rds_mem_enabled        = var.rds_mem_enabled
  rds_mem_threshold      = var.rds_mem_threshold
  rds_disc_enabled       = var.rds_disc_enabled
  rds_disc_threshold     = var.rds_disc_threshold
   
}