provider "aws" {
  region = "${var.provider_aws_region}"
}
resource "aws_sqs_queue" "sample_queue_one" {
  name                      = "${var.sample_queue_name}"
  message_retention_seconds = "${var.sample_queue_message_retention_seconds}"
  visibility_timeout_seconds = "${var.sample_queue_visibility_timeout_seconds}"
  redrive_policy            = "{\"deadLetterTargetArn\":\"${aws_sqs_queue.sample_dlq_one.arn}\",\"maxReceiveCount\":${var.max_receive_count}}"
  tags                      = "${map("Name", "${var.sample_queue_name}")}"
  lifecycle {
    prevent_destroy = true
  }
}

resource "aws_sqs_queue" "sample_dlq_one" {
  name                      = "${var.sample_dlq_name}"
  message_retention_seconds = "${var.sample_dlq_message_retention_seconds}"
  tags                      = "${map("Name", "${var.sample_dlq_name}")}"
  lifecycle {
    prevent_destroy = true
  }
}