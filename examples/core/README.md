## Example deployment flow

```bash
terraform init
terraform validate
terraform plan
terraform apply --auto-approve
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| name\_prefix | A prefix used for naming resources. | string | n/a | yes |
| vpc\_id | VPC ID where resources will be created and flow logs enabled. | string | n/a | yes |
| kms\_key\_id | The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested. | string | `""` | no |
| retention\_in\_days | Specifies the number of days you want to retain log events in the specified log group. | string | `""` | no |
| tags | Default tags attached to all resources. | map(string) | `{}` | no |
| traffic\_type | The type of traffic to capture. Valid values: ACCEPT,REJECT, ALL. | string | `"ALL"` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc\_flow\_logs\_cloudwatch\_group\_arn | The ARN specifying the log group used by Flow Logs. |
| vpc\_flow\_logs\_id | The Flow Log ID. |
| vpc\_flow\_logs\_role\_arn | The ARN specifying the role used by Flow Logs. |
| vpc\_flow\_logs\_role\_id | The ID specifying the role used by Flow Logs. |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
