resource "aws_s3_bucket" "s3_logs_store" {
#   bucket = "gpllearnings3bucket-124"
bucket = var.s3name
  tags = {
    Description = "gpl learning"
  }
}

  #policy to send cloudtrails to s3 bucket
resource "aws_s3_bucket_policy" "s3_logs_store" {
  bucket = aws_s3_bucket.s3_logs_store.id
  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
             "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
             "Resource": "${aws_s3_bucket.s3_logs_store.arn}"
         },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
             "Action": "s3:PutObject",
             "Resource": "${aws_s3_bucket.s3_logs_store.arn}/prefix/AWSLogs/*",
            "Condition": {
                 "StringEquals": {
                     "s3:x-amz-acl": "bucket-owner-full-control"
              }
           }
       }
    ]
 }
POLICY
}


