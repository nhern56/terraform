# resource "aws_sqs_queue" "sqs-queue" {
#   name = var.sqsname
#   #must be 910 seconds to trigger lambda
#   visibility_timeout_seconds = "910"
#   #policy for s3 bucket to recieve cloud trails
#   policy = <<POLICY
# {
#   "Version": "2012-10-17",
#   "Id": "sqspolicy",
#   "Statement": [
#     {
#       "Effect": "Allow",
#       "Principal": "*",
#       "Action": "sqs:SendMessage",
#       "Resource": "arn:aws:sqs:*:*:thissqsname",
#       "Condition": {
#         "ArnEquals": { "aws:SourceArn": "${aws_s3_bucket.s3_logs_store.arn}" }
#       }
#     }
#   ]
# }
# POLICY
# }

# #create event notifications to send to sqs from s3 bucket
# resource "aws_s3_bucket_notification" "bucket_notification" {
#   bucket = aws_s3_bucket.s3_logs_store.id
#   queue {
#     queue_arn     = aws_sqs_queue.sqs-queue.arn
#     events        = ["s3:ObjectCreated:*"]
#   }
# }
