variable "nombre_imagen" {
    description = "Nombre y versión de la imagen que voy a descargar"
    type        = string
    default     = "ubuntu:latest"
}

variable "volumenes" {
    description = "Volumenes que vamos a montar en el contenedor"
    type        = list(map(string))
    default     = [
        {
            volume_name = "vol_ivan1"
            host_path      = "/home/ubuntu/environment/cursoTerraform"
            container_path = "/cursoTerraform"
        },
        {
            volume_name = "vol_ivan2"
            container_path = "/ivan"
            host_path      = "/home/ubuntu/environment/ivan"
        }
    ]
}
