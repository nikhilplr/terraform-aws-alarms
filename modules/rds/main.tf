/*
*  This covers following Alerts
*   CPU
*   Free Memory
*   Free Storage
*   DB Connections
*/

resource "aws_cloudwatch_metric_alarm" "cpu_utilization" {
  alarm_name          = "${var.project}-${var.environment}-rds-cpu-alarm"
  comparison_operator = "GreaterThanThreshold"
  namespace           = "AWS/RDS"
  metric_name         = "CPUUtilization"
  statistic           = "Average"
  evaluation_periods  = var.rds_evaluation_periods  
  period              = var.rds_period 
  threshold           = var.rds_cpu_threshold
  alarm_description   = "This metric monitors RDS CPU utilization for ${var.project}-${var.environment}"
  alarm_actions       = [ var.sns_topic ]
  dimensions          = {
    DBClusterIdentifier = var.database_name
  }
  actions_enabled     = var.rds_cpu_enabled
}


resource "aws_cloudwatch_metric_alarm" "freeable_memory" {
  alarm_name          = "${var.project}-${var.environment}-rds-freeable-memory-alarm"
  comparison_operator = "LessThanThreshold"
  statistic           = "Average"
  
  metric_name         = "FreeableMemory"
  namespace           = "AWS/RDS"
  evaluation_periods  = var.rds_evaluation_periods 
  period              = var.rds_period 
  threshold           = var.rds_mem_threshold # "200000000"  # Example: 200MB
  alarm_description   = "This metric monitors RDS freeable memory ${var.project}-${var.environment}"
  alarm_actions       = [ var.sns_topic ]
  dimensions = {
    DBClusterIdentifier = var.database_name
  }
  actions_enabled     = var.rds_mem_enabled
}

resource "aws_cloudwatch_metric_alarm" "free_storage_space" {
  alarm_name          = "${var.project}-${var.environment}-rds-free-storage-alarm"
  comparison_operator = "LessThanThreshold"
  metric_name         = "FreeStorageSpace" 
  statistic           = "Average"
  namespace           = "AWS/RDS"
  evaluation_periods  = var.rds_evaluation_periods 
  period              = var.rds_period 
  threshold           = var.rds_disc_threshold  #"1000000000"  # Example: 1GB
  alarm_description   = "This metric monitors RDS free storage space${var.project}-${var.environment}"
  alarm_actions       = [ var.sns_topic ]
  dimensions = {
    DBClusterIdentifier = var.database_name
  }
  actions_enabled     = var.rds_disc_enabled
}

resource "aws_cloudwatch_metric_alarm" "db_connection_drop" {
  alarm_name          = "${var.project}-${var.environment}-rds-db-connections-drop-alarm"
  comparison_operator = "LessThanThreshold"
  metric_name         = "DatabaseConnections" 
  statistic           = "Average"
  namespace           = "AWS/RDS"
  evaluation_periods  = var.rds_evaluation_periods 
  period              = var.rds_period 
  threshold           = var.rds_connection_threshold  #"1000000000"  # Example: 1GB
  alarm_description   = "This metric monitors RDS DB conenctions in ${var.project}-${var.environment}"
  alarm_actions       = [ var.sns_topic ]
  dimensions = {
    DBClusterIdentifier = var.database_name
  }
  actions_enabled     = var.rds_connection_enabled
}