# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

# Terraform configuration

resource "docker_image" "nginx" {
  name         = "nginx:latest"
}

resource "docker_container" "web" {
    env               = []
#    image             = "sha256:ac232364af842735579e922641ae2f67d5b8ea97df33a207c5ea05f60c63a92d"
    image             = docker_image.nginx.image_id
    name              = "hashicorp-learn"

    ports {
        external = 8082
        internal = 80
        ip       = "0.0.0.0"
        protocol = "tcp"
    }
}
