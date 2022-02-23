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

7. Revisar consistencia del sistema de referencias de las googlesheets.  
  Se debe revisar si es que se utilizarán las mismas hojas de cálculo referenciadas en los scripts (utilizadas en 2021, asociadas a la cuenta gabriel.astudillo.l@usach.cl).  
  Si se utilizarán nuevas hojas de cálculo, se deben modificar en los scripts, y gestionar los permisos correspondientes con los equipos directivos de cada colegio.
  
## Provisionamiento de tickets.

Este script contiene los comandos para descarga de todos los archivos desde Canvas Data. Por lo tanto se debe ejecutar **primero** que la actualización de pruebas.

El script tiene tres grandes procesos:  
1. Descarga de datos.  
2. Organización de los datos.  
3. Subida de datos por liceo en hojas de cálculo separadas.

La organización de los datos se divide en:  
1. Limpieza de datos de estudiantes.  
2. Filtrar solo tickets de salida.  
3. Organizar los tickets por orden de publicación dentro cada asignatura.  
4. Cálculo de indicadores de resumen por estudiante-asignatura: Número de tickets publicados por asignatura, número de tickets contestados por el estudiante, % de participación, % de logro promedio en los tickets de la asignatura. 
5. Filtrar los datos por cada asignatura -dentro de cada colegio- y pivotear a formato long, para subirlos con la siguiente estructura:  
  Un archivo googlesheet por colegio.  
  Una hoja distinta para cada asignatura, en la cual se incorporan todos los niveles y secciones que corresponden.  
  Cada columna corresponde al orden de publicación

## Provisionamiento de pruebas.

Todas las demás evaluaciones (Pruebas de Nivel, controles, ensayos simce, ensayos universitarios) se procesan aquí.

El proceso es casi exactamente el mismo que para los tickets, con la diferencia que ya partimos con los datos descargados. Luego, filtramos las evaluaciones que nos interesan en este proceso (excluyendo los ticket de salida).

La principal diferencia es en la organización de los datos:  
  -Debemos clasificar las evaluaciones por tipo ("Control", "PDN", "Ensayo Simce", "Ensayo PDT").  
  -Según el tipo de evaluación, debemos seguir procesos diferentes para identificar su orden: Los controles y ensayos se ordenan igual que los tickets de salida (por orden de publicación dentro de la asignatura), pero las Pruebas de Nivel se ordenan según su posición en ciclo de evaluaciones del año.  
  -Por ello, en el script, hay que configurar el ciclo evaluativo correspondiente al año en curso. Actualmente, para la comprension, está el bloque de código que configuraba el calendario 2021.  
  
Las googlesheets de destino son diferentes a las de los tickets de salida, por lo que se debe volver a chequear la consistencia de las referencias.

## Informes de pruebas por colegio.

Exporta informes desde Rmarkdown a los que hay que hacerle muy pocas modificaciones para que salgan.

Se necesita un paquete extra: ```KableExtra```

```{r}
install.packages("kableExtra")
```

También se necesita instalar un motor de Latex para R como ```tinytex```.

Hay un archivo Rmd que recoge las particularidades de cada colegio, más uno que corresponde a informe comparativo entre colegios.

Antes de ejecutarlos, se debe tener en consideración:  
1. Actualizar el filtro (y título del documento) de acuerdo al ciclo evaluativo que se quiere realizar los informes. Se debe modificar en cada archivo Rmd.  
2. Rmarkdown funciona en una sesión diferente, por lo que las rutas de los datos ```data_est.Rdata``` y ```bd_evaluaciones.Rdata``` deben actualizarse en cada archivo Rmd, de acuerdo a su ubicación completa al pc en el cual se esté trabajando (ej. C://user/documents/Canvas Data/Reportes por liceo/data_est.Rdata).  
3. Para que estos informes contengan la información completa de los estudiantes que rindieron las pruebas, deben ser ejecutados **48 hrs. después del cierre de la evaluacion en Canvas**. De lo contrario, habrán inconsistencias en los datos.

