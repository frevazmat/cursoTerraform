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
 # En  el apply que se quede corriendo 10 min.
  command = ["bash","-c","sleep 600"]
  dynamic "volumes" {
    for_each = var.volumenes
    content {
#        volume_name = contains(keys(volumes), "volume_name") ? volumes.value[volume_name] : null
        volume_name    = volumes.value["volume_name"]
        host_path      = volumes.value["host_path"]
        container_path = volumes.value["container_path"]
    }
  }
  
}
