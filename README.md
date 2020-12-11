![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/umotif-public/terraform-aws-vpc-flow-logs?style=social)

# terraform-aws-vpc-flow-logs

Terraform module for enabling AWS VPC flow logs with CloudWatch sink.

## Terraform versions

Terraform 0.12. Pin module version to `~> v1.1.0`. Submit pull-requests to `master` branch.

## Usage

```hcl
module "vpc-flow-logs" {
  source = "umotif-public/vpc-flow-logs/aws"
  version = "~> 1.1.0"

  name_prefix = "test-example"
  vpc_id      = "vpc-1sadasdasd123"

  traffic_type = "ALL"

  tags = {
    Project = "Test"
  }
}
```

## Assumptions

Module is to be used with Terraform > 0.12.

## Examples

* [VPC flow logs](https://github.com/umotif-public/terraform-aws-vpc-flow-logs/tree/master/examples/core)

## Authors

Module managed by [Marcin Cuber](https://github.com/marcincuber) [LinkedIn](https://www.linkedin.com/in/marcincuber/).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |
| aws | >= 2.55 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.55 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| kms\_key\_id | The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested. | `string` | `""` | no |
| max\_aggregation\_interval | The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes) | `string` | `"600"` | no |
| name\_prefix | A prefix used for naming resources. | `string` | n/a | yes |
| retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group. | `string` | `""` | no |
| tags | Default tags attached to all resources. | `map(string)` | `{}` | no |
| traffic\_type | The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL. | `string` | `"ALL"` | no |
| vpc\_id | VPC ID where resources will be created and flow logs enabled. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_flow\_logs\_cloudwatch\_group\_arn | The ARN specifying the log group used by Flow Logs. |
| vpc\_flow\_logs\_id | The Flow Log ID. |
| vpc\_flow\_logs\_role\_arn | The ARN specifying the role used by Flow Logs. |
| vpc\_flow\_logs\_role\_id | The ID specifying the role used by Flow Logs. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE for full details.

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```
