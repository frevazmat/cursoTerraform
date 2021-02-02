terraform {
    required_providers {
        docker = {
                    source = "kreuzwerker/docker"
        }
    }
}

provider "docker" { }

resource "docker_image" "imagen-ubuntu" {
  name = var.nombre_imagen
}

resource "docker_container" "contenedor-ubuntu" {
  name  = "mi_contenedor_ubuntu"
  image = docker_image.imagen-ubuntu.latest
}

