#README File


##Sample Usage
```hcl
provider "aws" {
  region = var.aws_region
}

module "Cloudwatch_Alarm" {
  source      = "git@github.com:nikhilplr/terraform-aws-alarms.git?ref=v1.0.0"
  project     = "myproject"
  environment = "dev"

  #SNS
  create_sns_topic = 1
  sns_topic_name   = "myproject-cloudwatch-notification-sns-topic"

  #RDS 
  database_name    = ["mydbname-aurora-mysql-dev"]


}
```