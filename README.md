# terraform-aws-athena-lb-logs

A terraform module that creates resources to be able to query Load Balancer Access Logs via Athena according to this guide: <https://docs.aws.amazon.com/athena/latest/ug/application-load-balancer-logs.html>.

## Features

  1. Creates an Athena Database
  1. Creates an Athena Named Query that creates the table with the documented schema

## Usage

### Step 1

```
module "athena-lb-logs" {
  source = "github.com/solsglasses/terraform-aws-athena-lb-logs.git""

  name           = "mylbaccesslogs"
  s3_bucket_name = "${module.s3_bucket.s3_bucket_id}"
}
```

### Step 2

  1. Go to the Athena console and click on Saved Queries <https://console.aws.amazon.com/athena/saved-queries/home>
  1. Click the new saved query that is named `<custom_name>-create-table` and Run it. You only have to do it once.
  1. That's all, try a query `select * from lb_logs limit 100;`

## Outputs
