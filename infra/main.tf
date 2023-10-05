terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "uwu" {
  name = "uwu"
  build  {
    context    = "../"  
    dockerfile = "./Dockerfile"
  }
}

resource "docker_container" "container" {
  image = docker_image.uwu.image_id
  name  = "container"

  ports {
    internal = 80
    external = 8000
  }
}
