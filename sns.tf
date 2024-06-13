# sns.tf
resource "aws_sns_topic" "sns_topic" {
  count = var.create_sns_topic
  name  = var.sns_topic_name
}

data "aws_sns_topic" "sns_topic" {
  count = var.create_sns_topic == 1 ? 0 : 1
  name  =  var.sns_topic_name
}
