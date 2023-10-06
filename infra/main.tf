terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Pulls the image
resource "docker_image" "build" {
  name = "ubuntu:18.04"
  build {
    context    = "../DevOps/docker"
    dockerfile = "Dockerfile"
    #args       = { "PORT" = "81" } # Ajouter cette ligne pour passer un argument au Dockerfile
  }
  #tags = var.tags
}

# Create a container
resource "docker_container" "container" {
  image    = docker_image.build.image_id
  name     = "container"  
  ports {
    internal = 80 # Port interne du conteneur
    external = 81 # Port externe
  }
}
