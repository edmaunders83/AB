# Variables used

variable "cloud_name" {
  type = string
}

variable "my_condition" {
  type = bool
}

variable "ip_range" {
  type = string
}

variable "bandwidth" {
  type = string
  description = "Valid BW for AWS Edge GW"
  default = ""
}

variable "instance_type" {
  type = string
  description = "Instance size for AWS Edge GW"
  default = ""
}

variable "cloud_region" {
  type = string
}

variable "wait" {
  type = bool
}

variable "deploy_edge" {
  type = bool
}

variable "decommission_edge" {
  type = bool
}
