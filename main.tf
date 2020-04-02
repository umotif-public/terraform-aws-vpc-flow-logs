resource "aws_cloudwatch_log_group" "vpc_flow_logs" {
  name = "${var.name_prefix}-vpc-flow-logs-cw"

  retention_in_days = var.retention_in_days != "" ? var.retention_in_days : null
  kms_key_id        = var.kms_key_id

  tags = var.tags
}

resource "aws_iam_role" "vpc_flow_logs" {
  name = "${var.name_prefix}-vpc-flow-logs-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

  tags = var.tags
}

resource "aws_flow_log" "vpc_flow_logs" {
  log_destination_type = "cloud-watch-logs"
  log_destination      = aws_cloudwatch_log_group.vpc_flow_logs.arn

  iam_role_arn = aws_iam_role.vpc_flow_logs.arn
  vpc_id       = var.vpc_id
  traffic_type = var.traffic_type

  max_aggregation_interval = var.max_aggregation_interval

  tags = var.tags
}

resource "aws_iam_policy" "vpc_flow_logs" {
  name   = "${var.name_prefix}-flow-logs-policy"
  policy = templatefile("${path.module}/policies/vpc_flow_logs_policy.json", {})
}

resource "aws_iam_role_policy_attachment" "vpc_flow_logs" {
  policy_arn = aws_iam_policy.vpc_flow_logs.arn
  role       = aws_iam_role.vpc_flow_logs.name
}
