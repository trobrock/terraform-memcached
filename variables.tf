variable "name" {
  description = "Name of the memcached instance"
}

variable "subnets" {
  description = "The list of subnet ids to made the instance available in"
  type        = list(string)
}

variable "vpc_id" {
  description = "The VPC ID to place the instance in"
}

variable "security_groups" {
  description = "The security groups to use for the instance"
  type        = list(string)
}

variable "cache_instance_size" {
  description = "The cache instance size to launch"
  type        = string
  default     = "cache.t2.micro"
}

variable "engine_version" {
  description = "The engine version of memcached to launch"
  type        = string
  default     = "1.4.34"
}
