# CanvasDataLiceosUsach
Proceso de descarga y actualización de datos de Canvas


## Requerimientos revios.

1. Instalar node.js para poder utilizar lenguaje javascript.   ``` https://nodejs.org/dist/v16.14.0/node-v16.14.0-x64.msi```
2. Instalar CLI, para interactuar con Canvas Data. 
  Para ello, ejecutar en la consola de R ```shell('npm install -g canvas-data-cli')```
3. Configurar credenciales API Canvas.  
  En ```config.js``` reemplazar 'your_canvas_api_key' y 'your_canvas_api_secret' por credenciales de la API de Canvas.
4. Instalar paquetes necesarios en R:  
-tidyverse  
-googlesheets4  
-reshape2

```{r}
install.packages("tidyverse")
install.packages("googlesheets4")
install.packages("reshape2")
```
5. Crear un nuevo archivo nivel.csv que asocie los cursos del periodo actual a niveles, de acuerdo al formato del archivo aquí disponible:  
  Archivo debe contener dos columnas, en una el course_id, y en la otra los niveles: ```"1","2","3","4","5","6",7","8","I","II","III","IV"```.

6. Configurar interacción ```googlesheets4```:  
```{r}
library(googlesheets4)
gs4_auth()
```
Se va a abrir una pestaña en el navegador, para autorizar permisos desde una cuenta de google. Seleccionar la cuenta que se va a utilizar y dar **todos** los permisos solicitados y cerrar.

