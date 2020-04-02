variable "name_prefix" {
  description = "A prefix used for naming resources."
  type        = string
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where resources will be created and flow logs enabled."
}

variable "tags" {
  type        = map(string)
  description = "Default tags attached to all resources."
  default     = {}
}

variable "retention_in_days" {
  type        = string
  description = "Specifies the number of days you want to retain log events in the specified log group."
  default     = ""
}

variable "kms_key_id" {
  type        = string
  description = "The ARN of the KMS Key to use when encrypting log data. Please note, after the AWS KMS CMK is disassociated from the log group, AWS CloudWatch Logs stops encrypting newly ingested data for the log group. All previously ingested data remains encrypted, and AWS CloudWatch Logs requires permissions for the CMK whenever the encrypted data is requested."
  default     = ""
}

variable "traffic_type" {
  type        = string
  description = "The type of traffic to capture. Valid values: ACCEPT, REJECT, ALL."
  default     = "ALL"
}

variable "max_aggregation_interval" {
  type        = string
  description = "The maximum interval of time during which a flow of packets is captured and aggregated into a flow log record. Valid Values: 60 seconds (1 minute) or 600 seconds (10 minutes)"
  default     = "600"
}
