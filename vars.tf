variable "project" {
  description = "project"
  default     = ""
}
variable "environment" {
  description = "environment"
  default     = ""
}

variable "sns_topic_name" {
  description = "environment"
  default     = ""
}

variable "create_sns_topic" {
  description = "environment"
  default     = 0
}

#################################
########### RDS #################
#################################

variable "database_name" {
  description = "database_name"
  default     = []
  type        = list(string)
}

variable "rds_evaluation_periods" {
  description = "rds_evaluation_periods"
  default     = "2"
}
variable "rds_period" {
  description = "rds_period"
  default     = "300"
}
variable "rds_cpu_threshold" {
  description = "rds_cpu_threshold"
  default     = "80"
}
variable "rds_cpu_enabled" {
  description = "sns_topic"
  default     = "true"
}

variable "rds_disc_threshold" {
  description = "rds_cpu_threshold"
  default     = "1000000000" # iGB
}
variable "rds_disc_enabled" {
  description = "sns_topic"
  default     = "true"
}
variable "rds_mem_threshold" {
  description = "rds_cpu_threshold"
  default     = "200000000" #200 mb
}
variable "rds_mem_enabled" {
  description = "sns_topic"
  default     = "true"
}

variable "rds_connection_threshold" {
  description = "rds_connection_threshold"
  default     = "3"
}

variable "rds_connection_enabled" {
  description = "rds_connection_enabled"
  default     = "true"
}


#################################
########### ECS #################
#################################