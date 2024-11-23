resource "aws_s3_bucket" "my_bucket" {
  bucket = "terimeribalti${random_id.suffix.hex}"  # Use a unique suffix
  # acl    = "private"
}

resource "random_id" "suffix" {
  byte_length = 4
}


# Remove the following output from here:
# output "s3_bucket_name" {
#   value = aws_s3_bucket.my_bucket.bucket
# }
