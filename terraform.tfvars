# terraform.tfvars is picked by default by Terraform
 
# Variables for AWS Simple Queue Service Resources in queues.tf
provider_aws_region = "us-east-1"
sample_queue_name = "smadikanti-terraform-aws-sqs-queue-sample"
sample_queue_message_retention_seconds = 1209600
sample_queue_visibility_timeout_seconds = 900
max_receive_count = 5
sample_dlq_name = "smadikanti-terraform-aws-sqs-dlq-sample"
sample_dlq_message_retention_seconds = 1209600
