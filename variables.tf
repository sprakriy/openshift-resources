variable "namespace" {
  type = string
}

variable "app_name" {
  type    = string
  default = "nginx"
}

variable "replicas" {
  type    = number
  default = 1
}
