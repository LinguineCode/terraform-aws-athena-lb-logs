data "aws_caller_identity" "main" {}
data "aws_region" "main" {}

data "template_file" "main" {
  template = "${file("${path.module}/templates/create_table.sql.tpl")}"

  vars {
    bucket     = "${var.s3_bucket_name}"
    account_id = "${data.aws_caller_identity.main.account_id}"
    region     = "${data.aws_region.main.name}"
  }
}
