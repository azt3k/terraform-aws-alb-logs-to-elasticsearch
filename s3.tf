resource "aws_s3_bucket_notification" "alb_logs_to_elasticsearch_vpc" {
  count  = "${length(var.subnet_ids) > 0 ? 1 : 0}"
  bucket = "${var.s3_bucket_id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.alb_logs_to_elasticsearch_vpc[0].arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}

resource "aws_s3_bucket_notification" "alb_logs_to_elasticsearch" {
  count  = "${length(var.subnet_ids) == 0 ? 1 : 0}"
  bucket = "${var.s3_bucket_id}"

  lambda_function {
    lambda_function_arn = "${aws_lambda_function.alb_logs_to_elasticsearch[0].arn}"
    events              = ["s3:ObjectCreated:*"]
  }
}
