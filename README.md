# CanvasDataLiceosUsach
Proceso de descarga y actualización de datos de Canvas


## Requerimientos revios.

1. Instalar node.js para poder utilizar lenguaje javascript.   ``` https://nodejs.org/dist/v16.14.0/node-v16.14.0-x64.msi```
2. Instalar CLI, para interactuar con Canvas Data. 
```npm install -g canvas-data-cli```
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
