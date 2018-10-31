resource "aws_s3_bucket" "main" {}

resource "aws_athena_database" "main" {
  name   = "${var.name}"
  bucket = "${aws_s3_bucket.main.id}"
}

resource "aws_athena_named_query" "main" {
  name     = "${var.name}-create-table"
  database = "${aws_athena_database.main.name}"
  query    = "${data.template_file.main.rendered}"
}
