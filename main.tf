terraform {
  required_version = "~> 1.0.0"
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
      version = "~> 2.14.0"
    }
  }
}

variable "do_token" {
  type      = string
  sensitive = true
}

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_certificate" "ontrack-lb-cert" {
  name    = "test"
  type    = "lets_encrypt"
  domains = [
    "test.nemerosa.net"
  ]
  lifecycle {
    create_before_destroy = true
  }
}
