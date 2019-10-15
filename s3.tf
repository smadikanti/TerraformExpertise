resource "aws_kms_key" "mySampleKey" {
  description             = "This key is used to encrypt bucket objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket" "smadikanti-terraform-expertise-tf-state" {
  bucket = "smadikanti-terraform-expertise-tf-state"
  acl    = "private"

  tags = {
    Name        = "smadikanti-terraform-expertise-tf-state-${terraform.workspace}"
    Environment = "${terraform.workspace}"

  }

  versioning {
    enabled = true
  }

    lifecycle_rule {
    enabled = true

    expiration {
      days = 30
    }

#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         kms_master_key_id = "${aws_kms_key.mykey.arn}"
#         sse_algorithm     = "aws:kms"
#       }
#     }
#   }
    }
}