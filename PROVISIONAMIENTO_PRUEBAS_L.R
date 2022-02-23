#base cero: niveles.
library(readr)




nivel <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/nivel.csv", ";", escape_double = FALSE, 
                    col_types = cols(course_id = col_character()), 
                    trim_ws = TRUE)


#Primera base a importar: enrollment_dim


enrollment_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/enrollment_dim.txt", 
                             "\t", escape_double = FALSE, col_names = TRUE, 
                             col_types = cols(id = col_character(), 
                                              root_account_id = col_character(), course_section_id = col_character(), 
                                              role_id = col_character(), user_id = col_character(), 
                                              course_id = col_character()), trim_ws = TRUE)


#Segunda base: quiz_dim


quiz_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/quiz_dim.txt", 
                       "\t", escape_double = FALSE, col_names = TRUE, 
                       col_types = cols(id = col_character(), 
                                        root_account_id = col_character(), course_id = col_character(), 
                                        created_at = col_character()), trim_ws = TRUE)



#tercera base a importar: quiz_submission_fact


quiz_submission_fact <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/quiz_submission_fact.txt",
                                   "\t", escape_double = FALSE, col_names = TRUE, 
                                   col_types = cols(score = col_number(), kept_score = col_number(), 
                                                    date = col_character(), course_id = col_character(), 
                                                    enrollment_term_id = col_character(), course_account_id = col_character(), 
                                                    quiz_id = col_character(), assignment_id = col_character(), 
                                                    user_id = col_character(), submission_id = col_character(), 
                                                    enrollment_rollup_id = col_character(), quiz_submission_id = col_character()), 
                                   trim_ws = TRUE)





#Base de datos: usuarios.
user_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/user_dim.txt", 
                       "\t", escape_double = FALSE, col_names = TRUE, 
                       col_types = cols(id = col_character()), 
                       trim_ws = TRUE)



#base: cuenta

account_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/account_dim.txt", 
                          "\t", escape_double = FALSE, col_names = FALSE, 
                          col_types = cols(X1 = col_character()), 
                          trim_ws = TRUE)


#columnas

names(account_dim) =c("id", "canvas_id", "name", "depth", "workflow_state", "parent_account", 
                      "parent_account_id", "grandparent_account", "grandparent_account_id", 
                      "root_account", "root_account_id", "subaccount1", "subaccount1_id", 
                      "subaccount2", "subaccount2_id", "subaccount3", "subaccount3_id", 
                      "subaccount4", "subaccount4_id", "subaccount5", "subaccount5_id", 
                      "subaccount6", "subaccount6_id", "subaccount7", "subaccount7_id", 
                      "subaccount8", "subaccount8_id", "subaccount9", "subaccount9_id", 
                      "subaccount10", "subaccount10_id", "subaccount11", "subaccount11_id", 
                      "subaccount12", "subaccount12_id", "subaccount13", "subaccount13_id", 
                      "subaccount14", "subaccount14_id", "subaccount15", "subaccount15_id", 
                      "sis_source_id")


#Base de datos: courses
course_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/course_dim.txt", 
                         "\t", escape_double = FALSE, col_names = FALSE, 
                         col_types = cols(X1 = col_character(), 
                                          X3 = col_character(), X4 = col_character(), 
                                          X5 = col_character()), trim_ws = TRUE)


#columnas
names(course_dim) =c("id", "canvas_id", "root_account_id", "account_id", "enrollment_term_id", 
                     "name", "code", "type", "created_at", "start_at", "conclude_at", 
                     "publicly_visible", "sis_source_id", "workflow_state", "wiki_id", "syllabus_body") 


borrar<-c(" PRIMERO MEDIO" = "",
          " SEGUNDO MEDIO" = "",
          " TERCERO MEDIO" = "",
          " CUARTO MEDIO" = "",
          " PRIMERO BÁSICO" = "",
          " SEGUNDO BÁSICO" = "",
          " TERCERO BÁSICO" = "",
          " CUARTO BÁSICO" = "",
          " QUINTO BÁSICO" = "",
          " SEXTO BÁSICO" = "",
          " SÉPTIMO BÁSICO" = "",
          " OCTAVO BÁSICO" = "")

library(stringr)
course_dim$name<-str_replace_all(course_dim$name, borrar)



#base: sections.
course_section_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/course_section_dim.txt", 
                                 "\t", escape_double = FALSE, col_names = FALSE, 
                                 col_types = cols(X1 = col_character()), 
                                 trim_ws = TRUE)


#columnas
names(course_section_dim) =c("id", "canvas_id", "name", "course_id", "enrollment_term_id", 
                             "default_section", "accepting_enrollments", "can_manually_enroll", "start_at", 
                             "end_at", "created_at", "updated_at", "workflow_state", "restrict_enrollments_to_section_dates", 
                             "nonxlist_course_id", "sis_source_id")


module_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/module_dim.txt", 
                         "\t", escape_double = FALSE, col_names = TRUE, 
                         col_types = cols(id = col_character(),
                                          canvas_id = col_character(),
                                          course_id = col_character()),
                         trim_ws = TRUE)


module_item_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/module_item_dim.txt", 
                              "\t", escape_double = FALSE, col_names = TRUE, 
                              col_types = cols(id = col_character(),
                                               canvas_id = col_character(),
                                               assignment_id= col_character(),
                                               module_id= col_character(),
                                               quiz_id= col_character(),
                                               course_id = col_character()),
                              trim_ws = TRUE)




assignment_dim <- read_delim("C:/Users/Gabriel Astudillo/Documents/Canvas Data/datos/assignment_dim.txt", 
                             "\t", escape_double = FALSE, col_names = TRUE, 
                             col_types = cols(id = col_character(),
                                              canvas_id = col_character(),
                                              course_id = col_character()),
                             trim_ws = TRUE)




quiz_submission_fact$date_ymd<-str_sub(quiz_submission_fact$date, 1, 10) #recortar fecha
quiz_submission_fact$date_ymd<-as.Date(quiz_submission_fact$date,format = "%Y-%m-%d")

quiz_submission_fact$quiz_points_possible[(quiz_submission_fact$quiz_id == "187380000000004645")]<-15



library(dplyr)

#Eliminar estudiantes retirados.

retir<-enrollment_dim%>%
  filter(type == "StudentEnrollment" | type == "StudentViewEnrollment")%>%
  group_by(user_id,id,workflow_state)%>%
  slice(which.max(updated_at))%>%
  summarise(updated_at,
            R= 1)

retir<-retir%>%
  group_by(user_id,id)%>%
  slice(which.max(updated_at))

retir<-retir%>%
  group_by(user_id,id,workflow_state)%>%
  summarise(workflow_state,updated_at,R,R2=cumsum(R))

retir<-retir%>%
  group_by(id)%>%
  summarise(workflow_state)



names(retir)=c("id","estado")


enrollment_dim<-left_join(enrollment_dim,retir,by ="id")

enrollment_dim<-enrollment_dim%>%
  filter(!(estado == "deleted"))

enrollment_dim<-enrollment_dim%>%
  filter(!(user_id == "238894126717189772" |
             user_id == "400170156895226114" |
             user_id == "115288659334926017" |
             user_id == "362298294379897796" |
             user_id == "-186402762281972650" |
             user_id == "-195784206657026657" |
             user_id == "140257237914541227"))

#Agregar estudiantes que no figuran.
enrollment_dim$workflow_state[enrollment_dim$user_id=="-56385533470930689"]<-"active"


#resultados de aprendizaje.



i_sem<-as.Date("2021-03-01",format = "%Y-%m-%d")
ii_sem<-as.Date("2021-08-23",format = "%Y-%m-%d")


c_extras<-c("187380000000000423",
            "187380000000000442",
            "187380000000000445",
            "187380000000000447",
            "187380000000000449",
            "187380000000000956")



evaluaciones<-quiz_submission_fact %>%
  filter(quiz_points_possible == 10 |
    quiz_points_possible == 15 |
           quiz_points_possible == 40 | 
           quiz_points_possible == 20 | 
           quiz_points_possible == 60)%>%
  summarise(quiz_id = quiz_id,
            p_logro = kept_score, 
            points_possible = quiz_points_possible, 
            enrollment_rollup_id, 
            account_id = course_account_id, 
            course_id, 
            user_id, 
            date_ymd)





#trae nombre del quiz
quiz.name<-quiz_dim%>%
  summarise(quiz_id=id,quiz_name=name)
    

evaluaciones<-left_join(evaluaciones, quiz.name, by = "quiz_id")

evaluaciones<-distinct(evaluaciones)


library(stringr)

evaluaciones$quiz_name<-str_to_upper(evaluaciones$quiz_name, locale = "en")


evaluaciones$ce<-"PDN"
evaluaciones$ce[str_detect(evaluaciones$quiz_name, "PREP")]<-"Control"
evaluaciones$ce[str_detect(evaluaciones$quiz_name, "READY")]<-"Control"
evaluaciones$ce[str_detect(evaluaciones$quiz_name, "TICKET")]<-"Control"
evaluaciones$ce[str_detect(evaluaciones$quiz_name, "REPASO")]<-"Control"
evaluaciones$ce[str_detect(evaluaciones$quiz_name, "SIMCE")]<-"Ensayo Simce"
evaluaciones$ce[(evaluaciones$points_possible == 20)]<-"PDN"
evaluaciones$ce[(evaluaciones$points_possible == 60)]<-"Ensayo PDT"
evaluaciones$ce[(evaluaciones$points_possible == 10)]<-"Control"
evaluaciones$ce[(evaluaciones$course_id =="187380000000000451" & evaluaciones$points_possible == 15)]<-"Control"

evaluaciones$ce[(evaluaciones$quiz_id == "187380000000004615")]<-"Control"
evaluaciones$ce[(evaluaciones$quiz_id == "187380000000019425")]<-"Control"


evaluaciones$ce[(evaluaciones$quiz_id == "187380000000005025")]<-"Control"
evaluaciones$ce[(evaluaciones$quiz_id == "187380000000005037")]<-"Control"




##Desde aquí PROCESO QUE CUENTA Y NUMERA POR ORDEN EVALUACIONES DEL SEGUNDO SEMESTRE.
#chequear si es que está funcionando bien o no.
mq<-module_item_dim%>%
  filter(!(quiz_id == "\\N"))%>%
  select(module_id,quiz_id)


library(stringr)

module_dim$unlock_at<-as.Date(str_sub(module_dim$unlock_at, 1,10))


module_date<-module_dim%>%
  summarise(module_id = id,
            unlock_at)


module_date<-module_date%>%
  group_by(unlock_at)%>%
  slice(which.max(unlock_at))

module_date<-distinct(module_date)


dup<-table(module_date$module_id)

dup<-as.data.frame(dup)



mq<-left_join(mq,module_date,by = "module_id")

mq<-distinct(mq)

mq$unlock_at<-substr(mq$unlock_at, 1, 10) #recortar fecha
mq$unlock_at<-as.Date(mq$unlock_at,format = "%Y-%m-%d")

mq<-mq%>%select(-c(module_id))

evaluaciones<-left_join(evaluaciones,mq,by = "quiz_id")
evaluaciones<-distinct(evaluaciones)


e_date<-evaluaciones %>%
  mutate(date = case_when(is.na(unlock_at) == FALSE ~ unlock_at,
                          is.na(unlock_at) == TRUE ~ date_ymd))


e_date<-e_date %>%
  filter(!(is.na(e_date$date)))%>%
  group_by(quiz_id)%>%
  summarise(date = min(date, na.rm = TRUE))



e_date<-e_date%>%
  filter(date >= i_sem)


e_date<-e_date%>%
  rename(date_join = date)



evaluaciones<-left_join(evaluaciones,e_date,by="quiz_id")


eval_orden<-evaluaciones%>%
  filter(ce == "Control" | ce == "Ensayo Simce" | ce == "Ensayo PDT")%>%
  group_by(course_id,quiz_id, ce, date_join)%>%
  summarise(p=1)


eval_orden <- eval_orden[order(eval_orden$course_id,eval_orden$date_join),]


eval_orden<-eval_orden %>% 
  group_by(course_id,ce) %>%
  summarise(quiz_id,date_join,
            n_eval=cumsum(p))

eval_orden<-eval_orden[,c("quiz_id","n_eval")]

evaluaciones<-left_join(evaluaciones,eval_orden,by = "quiz_id")




evaluaciones$ciclo<-NA
evaluaciones$ciclo[evaluaciones$date_join>=as.Date("2021-03-27") & evaluaciones$date_join<=as.Date("2021-04-19")]<-"1"
evaluaciones$ciclo[evaluaciones$date_join>=as.Date("2021-05-10") & evaluaciones$date_join<=as.Date("2021-06-04")]<-"2"
evaluaciones$ciclo[evaluaciones$date_join>=as.Date("2021-06-22") & evaluaciones$date_join<=as.Date("2021-07-09")]<-"3"
evaluaciones$ciclo[evaluaciones$date_join>=as.Date("2021-08-23")& evaluaciones$date_join<=as.Date("2021-09-05")]<-"4"
evaluaciones$ciclo[evaluaciones$date_join>=as.Date("2021-10-11")& evaluaciones$date_join<=as.Date("2021-10-22")]<-"5"
evaluaciones$ciclo[evaluaciones$date_join>=as.Date("2021-11-22")& evaluaciones$date_join<=as.Date("2021-12-12")]<-"6"


evaluaciones<-evaluaciones%>%
  filter(!(ce=="PDN" & is.na(ciclo)))


evaluaciones$orden<-NA



evaluaciones<-evaluaciones %>%
  mutate(orden = case_when(evaluaciones$ce=="PDN" ~ as.numeric(ciclo),
                           evaluaciones$ce=="Control" ~ n_eval,
                           course_id == "187380000000000956" & evaluaciones$ce=="Control"~ as.numeric(ciclo),
                           evaluaciones$ce=="Ensayo Simce" ~ n_eval,
                           evaluaciones$ce=="Ensayo PDT" ~ n_eval,
                           course_id == "187380000000000420" & evaluaciones$ce=="Control"~ as.numeric(ciclo)))

evaluaciones$ciclo<-as.numeric(evaluaciones$ciclo)
evaluaciones$orden[(evaluaciones$course_id == "187380000000000956" & evaluaciones$ce=="Control")]<-evaluaciones$ciclo[(evaluaciones$course_id == "187380000000000956" & evaluaciones$ce=="Control")]


##########
data_est <- enrollment_dim %>%
  filter(type == 'StudentEnrollment' |
           type == 'StudentViewEnrollment' |
           user_id== "-56385533470930689",
         workflow_state == 'active' )%>%
  summarise(enrollment_rollup_id = id,
            user_id = user_id,
            course_id = course_id,
            section_id = course_section_id)



#traer cuenta
#cursoXcuenta
cuenta <- cbind.data.frame(course_dim$id, course_dim$account_id)
names(cuenta) =c("course_id", "account_id")

data_est<-left_join(data_est, cuenta, by = "course_id", copy=FALSE)



#depurar cuentas
data_est <- data_est %>%
  filter(account_id == '187380000000000103' |
           account_id == '187380000000000104' |
           account_id == '187380000000000105' |
           account_id == '187380000000000106' |
           account_id == '187380000000000107') #eliminar cuentas no activas


#traer etiquetas de liceo
et.cuentas<-cbind.data.frame(account_dim$id, account_dim$name)
names(et.cuentas) =c("account_id", "cuenta")
data_est<-(left_join(data_est, et.cuentas, by = "account_id", copy=FALSE))

#traer niveles
data_est<-(left_join(data_est, nivel, by = "course_id", copy = FALSE))

#Traer etiquetas de sección
et.secciones<-cbind.data.frame(course_section_dim$id, course_section_dim$name)
names(et.secciones) =c("section_id", "seccion")
data_est<-(left_join(data_est,et.secciones, by = "section_id", copy=FALSE))

#traer nombres de estudiantes
nom.user<-cbind.data.frame(user_dim$id, user_dim$sortable_name)
names(nom.user) =c("user_id", "nombre")
data_est<-(left_join(data_est, nom.user, by = "user_id", copy=FALSE))

data_est<-distinct(data_est)

#Traer etiquetas de curso
et.cursos<-cbind.data.frame(course_dim$id, course_dim$name)
names(et.cursos) =c("course_id", "cursos")
data_est<-(left_join(data_est,et.cursos, by = "course_id", copy=FALSE))




#Eliminar "estudiantes de prueba"
data_est <- data_est%>%
  filter(!(nombre == 'prueba, Estudiante de'),!(is.na(nivel)))


etiq<-data_est%>%
  select(enrollment_rollup_id,cuenta,nivel,seccion,nombre,cursos)

evaluaciones<-left_join(evaluaciones,etiq,by ="enrollment_rollup_id")

###### CORRECIONES  FINALES
         

bas<-c("5", "6", "7", "8")

evaluaciones$ciclo[evaluaciones$nivel == bas & evaluaciones$date_join>=as.Date("2021-03-29")]<-"1"


rez=c("REZAGO" = "REZAGO",
      "REZAGADOS" = "REZAGO",
      "REZAGADA" = "REZAGO")

evaluaciones$quiz_name<-str_replace_all(evaluaciones$quiz_name, rez)

evaluaciones$orden[str_detect(evaluaciones$quiz_name, "REZAGO")]<-"REZAGO"
evaluaciones$orden[str_detect(evaluaciones$quiz_name, "POR")]<-"POR"


#controles con orden equivocado
cont<-c("187380000000006200",
        "187380000000013966",
        "187380000000014004",
        "187380000000015568",
        "187380000000015571",
       "187380000000015572")


evaluaciones$orden[(evaluaciones$quiz_id == "187380000000006200")]<-4
evaluaciones$orden[(evaluaciones$quiz_id == "187380000000013966")]<-4
evaluaciones$orden[(evaluaciones$quiz_id == "187380000000014004")]<-4
evaluaciones$orden[(evaluaciones$quiz_id == "187380000000015568")]<-4
evaluaciones$orden[(evaluaciones$quiz_id == "187380000000015571")]<-4
evaluaciones$orden[(evaluaciones$quiz_id == "187380000000015572")]<-4



evaluaciones$evaluacion<-paste(evaluaciones$ce, evaluaciones$orden, sep = " " )



write.csv2(evaluaciones, file = "C:/Users/Gabriel Astudillo/Documents/Canvas Data/Reportes Rmakdown/bd_evaluaciones.csv", fileEncoding = "UTF-8", row.names = FALSE)
write.csv2(data_est, file = "C:/Users/Gabriel Astudillo/Documents/Canvas Data/Reportes Rmakdown/data_est.csv", fileEncoding = "UTF-8", row.names = FALSE)


library(reshape2)  


#####


col_p<-evaluaciones%>%
  filter(cuenta== "Instituto Comercial Eliodoro Domínguez")%>%
  summarise(
    Nivel = nivel,
    Sección = seccion,
    Nombre = nombre,
    `Asignatura o módulo` = cursos,
    evaluacion,
    n_eval,
    p_logro)

col_p<-distinct(col_p)

col<-data_est%>%
  filter(cuenta== "Instituto Comercial Eliodoro Domínguez")%>%
  summarise(Nivel = nivel,
            Sección = seccion,
            Nombre=nombre,
            `Asignatura o módulo`=cursos
            )



###EXPORTAR PARA GOOGLESHEET.
library(googlesheets4)
gs4_auth()
1
sh<-("https://docs.google.com/spreadsheets/d/1Si2tIkM6dtd6WYvd2QbGZj6XpfO8jdxMZWF4PQZnZRQ/edit#gid=0")
SHdata<-read_sheet(sh)
#write_sheet(col, sh, sheet = "Data")


bd_col_lyl<-col%>%
  filter(`Asignatura o módulo` == "LENGUA Y LITERATURA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_lyl<-col_p%>%
  filter(`Asignatura o módulo` == "LENGUA Y LITERATURA")

col_lyl<-dcast(col_lyl, `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_lyl<-col_lyl%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_lyl<-left_join(bd_col_lyl,col_lyl,by = "Nombre", copi= FALSE)

col_lyl <- col_lyl[order(col_lyl$Nivel,col_lyl$Sección,col_lyl$Nombre),]

write_sheet(col_lyl, sh, sheet = "LENGUA Y LITERATURA")

################################################################






bd_col_mat<-col%>%
  filter(`Asignatura o módulo` == "MATEMÁTICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_mat<-col_p%>%
  filter(`Asignatura o módulo` == "MATEMÁTICA")

col_mat<-dcast(col_mat,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_mat<-col_mat%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_mat<-left_join(bd_col_mat,col_mat,by = "Nombre", copi= FALSE)

col_mat <- col_mat[order(col_mat$Nivel,col_mat$Sección,col_mat$Nombre),]
write_sheet(col_mat, sh, sheet = "MATEMÁTICA")

bd_col_bio<-col%>%
  filter(`Asignatura o módulo` == "BIOLOGÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_bio<-col_p%>%
  filter(`Asignatura o módulo` == "BIOLOGÍA")

col_bio<-dcast(col_bio,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_bio<-col_bio%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_bio<-left_join(bd_col_bio,col_bio,by = "Nombre", copi= FALSE)

col_bio <- col_bio[order(col_bio$Nivel,col_bio$Sección,col_bio$Nombre),]
write_sheet(col_bio, sh, sheet = "BIOLOGÍA")


bd_col_fisic<-col%>%
  filter(`Asignatura o módulo` == "FÍSICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_fisic<-col_p%>%
  filter(`Asignatura o módulo` == "FÍSICA")
col_fisic<-dcast(col_fisic,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_fisic<-col_fisic%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_fisic<-left_join(bd_col_fisic,col_fisic,by = "Nombre", copi= FALSE)

col_fisic <- col_fisic[order(col_fisic$Nivel,col_fisic$Sección,col_fisic$Nombre),]
write_sheet(col_fisic, sh, sheet = "FÍSICA")

bd_col_quim<-col%>%
  filter(`Asignatura o módulo` == "QUÍMICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_quim<-col_p%>%
  filter(`Asignatura o módulo` == "QUÍMICA")
col_quim<-dcast(col_quim,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")



col_quim<-col_quim%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_quim<-left_join(bd_col_quim,col_quim,by = "Nombre", copi= FALSE)

col_quim <- col_quim[order(col_quim$Nivel,col_quim$Sección,col_quim$Nombre),]

write_sheet(col_quim, sh, sheet = "QUÍMICA")         

bd_col_cc<-col%>%
  filter(`Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANÍA" | `Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANIA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_cc<-col_p%>%
  filter(`Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANÍA" | `Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANIA")
col_cc<-dcast(col_cc,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_cc<-col_cc%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_cc<-left_join(bd_col_cc,col_cc,by = "Nombre", copi= FALSE)

col_cc <- col_cc[order(col_cc$Nivel,col_cc$Sección,col_cc$Nombre),]
write_sheet(col_cc, sh, sheet = "CIENCIAS PARA LA CIUDADANÍA")



bd_col_emp<-col%>%
  filter(`Asignatura o módulo` == "EMPRENDIMIENTO")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_emp<-col_p%>%
  filter(`Asignatura o módulo` == "EMPRENDIMIENTO")
col_emp<-dcast(col_emp,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_emp<-col_emp%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_emp<-left_join(bd_col_emp,col_emp,by = "Nombre", copi= FALSE)

col_emp <- col_emp[order(col_emp$Nivel,col_emp$Sección,col_emp$Nombre),]
write_sheet(col_emp, sh, sheet = "EMPRENDIMIENTO")                  


bd_col_filo<-col%>%
  filter(`Asignatura o módulo` == "FILOSOFÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_filo<-col_p%>%
  filter(`Asignatura o módulo` == "FILOSOFÍA")
col_filo<-dcast(col_filo,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_filo<-col_filo%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_filo<-left_join(bd_col_filo,col_filo,by = "Nombre", copi= FALSE)

col_filo <- col_filo[order(col_filo$Nivel,col_filo$Sección,col_filo$Nombre),]

write_sheet(col_filo, sh, sheet = "FILOSOFÍA")



bd_col_hist<-col%>%
  filter(`Asignatura o módulo` == "HISTORIA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_hist<-col_p%>%
  filter(`Asignatura o módulo` == "HISTORIA")
col_hist<-dcast(col_hist,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_hist<-col_hist%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_hist<-left_join(bd_col_hist,col_hist,by = "Nombre", copi= FALSE)
col_hist <- col_hist[order(col_hist$Nivel,col_hist$Sección,col_hist$Nombre),]
write_sheet(col_hist, sh, sheet = "HISTORIA")


bd_col_ing<-col%>%
  filter(`Asignatura o módulo` == "INGLÉS")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_ing<-col_p%>%
  filter(`Asignatura o módulo` == "INGLÉS")
col_ing<-dcast(col_ing,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_ing<-col_ing%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_ing<-left_join(bd_col_ing,col_ing,by = "Nombre", copi= FALSE)
col_ing <- col_ing[order(col_ing$Nivel,col_ing$Sección,col_ing$Nombre),]

write_sheet(col_ing, sh, sheet = "INGLÉS")




bd_col_fc<-col%>%
  filter(`Asignatura o módulo` == "FORMACIÓN CIUDADANA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_fc<-col_p%>%
  filter(`Asignatura o módulo` == "FORMACIÓN CIUDADANA")
col_fc<-dcast(col_fc,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_fc<-col_fc%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_fc<-left_join(bd_col_fc,col_fc,by = "Nombre", copi= FALSE)

col_fc <- col_fc[order(col_fc$Nivel,col_fc$Sección,col_fc$Nombre),]

write_sheet(col_fc, sh, sheet = "FORMACIÓN CIUDADANA")





bd_col_tec<-col%>%
  filter(`Asignatura o módulo` == "TECNOLOGÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_tec<-col_p%>%
  filter(`Asignatura o módulo` == "TECNOLOGÍA")
col_tec<-dcast(col_tec,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_tec<-col_tec%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_tec<-left_join(bd_col_tec,col_tec,by = "Nombre", copi= FALSE)

col_tec <- col_tec[order(col_tec$Nivel,col_tec$Sección,col_tec$Nombre),]

write_sheet(col_tec, sh, sheet = "TECNOLOGÍA")




bd_col_arv<-col%>%
  filter(`Asignatura o módulo` == "ARTES VISUALES")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_arv<-col_p%>%
  filter(`Asignatura o módulo` == "ARTES VISUALES")
col_arv<-dcast(col_arv,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_arv<-col_arv%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_arv<-left_join(bd_col_arv,col_arv,by = "Nombre", copi= FALSE)

col_arv <- col_arv[order(col_arv$Nivel,col_arv$Sección,col_arv$Nombre),]

write_sheet(col_arv, sh, sheet = "ARTES VISUALES")







bd_col_mus<-col%>%
  filter(`Asignatura o módulo` == "MÚSICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_mus<-col_p%>%
  filter(`Asignatura o módulo` == "MÚSICA")
col_mus<-dcast(col_mus,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_mus<-col_mus%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_mus<-left_join(bd_col_mus,col_mus,by = "Nombre", copi= FALSE)

col_mus <- col_mus[order(col_mus$Nivel,col_mus$Sección,col_mus$Nombre),]

write_sheet(col_mus, sh, sheet = "MÚSICA")






bd_col_efis<-col%>%
  filter(`Asignatura o módulo` == "EDUCACIÓN FÍSICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_efis<-col_p%>%
  filter(`Asignatura o módulo` == "EDUCACIÓN FÍSICA")
col_efis<-dcast(col_efis,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_efis<-col_efis%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_efis<-left_join(bd_col_efis,col_efis,by = "Nombre", copi= FALSE)

col_efis <- col_efis[order(col_efis$Nivel,col_efis$Sección,col_efis$Nombre),]

write_sheet(col_efis, sh, sheet = "EDUCACIÓN FÍSICA")






bd_col_especialidad<-data_est%>%
  filter(cuenta== "Instituto Comercial Eliodoro Domínguez",
         cursos == "APLICACIONES INFORMÁTICAS PARA LA GESTIÓN ADMINISTRATIVA"    |   
           cursos == "Aplicaciones Informáticas Segundo Medio"                      |  
           cursos == "ATENCIÓN AL CLIENTE"                                           | 
           cursos == "CÁLCULO DE REMUNERACIONES - FINIQUITOS Y OBLIGACIONES LABORALES"|
           cursos == "CÁLCULO Y REGISTRO DE IMPUESTOS"                                |
           cursos == "CÁLCULO Y REGISTRO DE REMUNERACIONES"                           |
           cursos == "CONTABILIDAD BÁSICA Y COMPRAVENTA"                              |
           cursos == "CONTABILIDAD BÁSICA Y GESTIÓN TRIBUTARIA"                       |
           cursos == "DOTACIÓN PERSONAL"                                              |
           cursos == "Elaboración de Informes Contables y Financieros Cuarto Medio"                  |
           cursos == "INTRODUCCIÓN A LA ESPECIALIDAD"                                 |
           cursos == "LEGISLACIÓN LABORAL"                                            |
           cursos == "O. OFICINA"                                                     |
           cursos == "PROCESO ADMINISTRATIVO"                                         |
           cursos == "REGISTRO DE OPERACIONES DE COMERCIO NACIONAL E INTERNACIONAL"                                 
  )%>%
  summarise(enrollment_rollup_id,
            Nivel = nivel,
            Sección = seccion,
            Nombre=nombre,
            `Asignatura o módulo`=cursos)


col_especialidad<-evaluaciones%>%
  filter(cuenta== "Instituto Comercial Eliodoro Domínguez",
         cursos == "APLICACIONES INFORMÁTICAS PARA LA GESTIÓN ADMINISTRATIVA"    |   
           cursos == "Aplicaciones Informáticas Segundo Medio"                      |  
           cursos == "ATENCIÓN AL CLIENTE"                                           | 
           cursos == "CÁLCULO DE REMUNERACIONES - FINIQUITOS Y OBLIGACIONES LABORALES"|
           cursos == "CÁLCULO Y REGISTRO DE IMPUESTOS"                                |
           cursos == "CÁLCULO Y REGISTRO DE REMUNERACIONES"                           |
           cursos == "CONTABILIDAD BÁSICA Y COMPRAVENTA"                              |
           cursos == "CONTABILIDAD BÁSICA Y GESTIÓN TRIBUTARIA"                       |
           cursos == "DOTACIÓN PERSONAL"                                              |
           cursos == "Elaboración de Informes Contables y Financieros Cuarto Medio"                  |
           cursos == "INTRODUCCIÓN A LA ESPECIALIDAD"                                 |
           cursos == "LEGISLACIÓN LABORAL"                                            |
           cursos == "O. OFICINA"                                                     |
           cursos == "PROCESO ADMINISTRATIVO"                                         |
           cursos == "REGISTRO DE OPERACIONES DE COMERCIO NACIONAL E INTERNACIONAL"
  )%>%
  summarise(enrollment_rollup_id,
            evaluacion,p_logro)

col_especialidad<-dcast(col_especialidad,  enrollment_rollup_id~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_especialidad<-left_join(bd_col_especialidad,col_especialidad,by = "enrollment_rollup_id", copi= FALSE)


col_especialidad <- col_especialidad[order(col_especialidad$Nivel,col_especialidad$Sección,col_especialidad$`Asignatura o módulo`,col_especialidad$Nombre),]

col_especialidad<-col_especialidad%>%
  select(-c(enrollment_rollup_id))


write_sheet(col_especialidad, sh, sheet = "ESPECIALIDADES")


rm(sh,col_p,col,bd_col_lyl,col_lyl,bd_col_mat,col_mat,bd_col_bio,col_bio,bd_col_fisic,
   col_fisic,bd_col_quim,col_quim,bd_col_cc,col_cc,bd_col_emp,col_emp,bd_col_filo,col_filo,
   bd_col_hist,col_hist,bd_col_ing,col_ing,bd_col_fc,col_fc,bd_col_especialidad,col_especialidad,
   col_mus,col_tec,col_efis,col_arv,bd_col_mus,bd_col_tec,bd_col_arv,bd_col_efis)










################################################
#############################################
##################################
#########################
#################
###LEA



##PENDIENTE:TALLERES ARTÍSTICOS.
col_p<-evaluaciones%>%
  filter(cuenta== "Liceo Experimental Artístico")%>%
  summarise(
    Nivel = nivel,
    Sección = seccion,
    Nombre = nombre,
    `Asignatura o módulo` = cursos,
    evaluacion,
    n_eval,
    p_logro)

col_p<-distinct(col_p)

col<-data_est%>%
  filter(cuenta== "Liceo Experimental Artístico")%>%
  summarise(Nivel = nivel,
            Sección = seccion,
            Nombre=nombre,
            `Asignatura o módulo`=cursos,
            #`Tickets Publicados`,
            #`Tickets contestados`, 
            #`% de participación`,
            #p_logro
            )





###EXPORTAR PARA GOOGLESHEET.
sh<-("https://docs.google.com/spreadsheets/d/1iuxa3r_gBeONYaT-vmXixVvnhDFJgO4Nr8mCNtMO-4g/edit#gid=0")
SHdata<-read_sheet(sh)
#write_sheet(col, sh, sheet = "Data")


bd_col_lyl<-col%>%
  filter(`Asignatura o módulo` == "LENGUA Y LITERATURA" | `Asignatura o módulo` == "LENGUAJE Y COMUNICACIÓN")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_lyl<-col_p%>%
  filter(`Asignatura o módulo` == "LENGUA Y LITERATURA" | `Asignatura o módulo` == "LENGUAJE Y COMUNICACIÓN")

col_lyl<-dcast(col_lyl, `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_lyl<-col_lyl%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_lyl<-left_join(bd_col_lyl,col_lyl,by = "Nombre", copi= FALSE)

col_lyl <- col_lyl[order(col_lyl$Nivel,col_lyl$Sección,col_lyl$Nombre),]

write_sheet(col_lyl, sh, sheet = "LENGUA Y LITERATURA")


bd_col_mat<-col%>%
  filter(`Asignatura o módulo` == "MATEMÁTICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_mat<-col_p%>%
  filter(`Asignatura o módulo` == "MATEMÁTICA")

col_mat<-dcast(col_mat,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_mat<-col_mat%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_mat<-left_join(bd_col_mat,col_mat,by = "Nombre", copi= FALSE)

col_mat <- col_mat[order(col_mat$Nivel,col_mat$Sección,col_mat$Nombre),]
write_sheet(col_mat, sh, sheet = "MATEMÁTICA")


#####
#CIENCIAS NATURALES
bd_col_cnat<-col%>%
  filter(`Asignatura o módulo` == "CIENCIAS NATURALES")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_cnat<-col_p%>%
  filter(`Asignatura o módulo` == "CIENCIAS NATURALES")

col_cnat<-dcast(col_cnat,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_cnat<-col_cnat%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_cnat<-left_join(bd_col_cnat,col_cnat,by = "Nombre", copi= FALSE)

col_cnat <- col_cnat[order(col_cnat$Nivel,col_cnat$Sección,col_cnat$Nombre),]
write_sheet(col_cnat, sh, sheet = "CIENCIAS NATURALES")



bd_col_bio<-col%>%
  filter(`Asignatura o módulo` == "BIOLOGÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_bio<-col_p%>%
  filter(`Asignatura o módulo` == "BIOLOGÍA")

col_bio<-dcast(col_bio,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_bio<-col_bio%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_bio<-left_join(bd_col_bio,col_bio,by = "Nombre", copi= FALSE)

col_bio <- col_bio[order(col_bio$Nivel,col_bio$Sección,col_bio$Nombre),]
write_sheet(col_bio, sh, sheet = "BIOLOGÍA")


bd_col_fisic<-col%>%
  filter(`Asignatura o módulo` == "FÍSICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_fisic<-col_p%>%
  filter(`Asignatura o módulo` == "FÍSICA")
col_fisic<-dcast(col_fisic,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_fisic<-col_fisic%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_fisic<-left_join(bd_col_fisic,col_fisic,by = "Nombre", copi= FALSE)

col_fisic <- col_fisic[order(col_fisic$Nivel,col_fisic$Sección,col_fisic$Nombre),]
write_sheet(col_fisic, sh, sheet = "FÍSICA")

bd_col_quim<-col%>%
  filter(`Asignatura o módulo` == "QUÍMICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_quim<-col_p%>%
  filter(`Asignatura o módulo` == "QUÍMICA")
col_quim<-dcast(col_quim,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")



col_quim<-col_quim%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_quim<-left_join(bd_col_quim,col_quim,by = "Nombre", copi= FALSE)

col_quim <- col_quim[order(col_quim$Nivel,col_quim$Sección,col_quim$Nombre),]

write_sheet(col_quim, sh, sheet = "QUÍMICA")         



names(col)

bd_col_cc<-col%>%
  filter(`Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_cc<-col_p%>%
  filter(`Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANÍA")
col_cc<-dcast(col_cc,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_cc<-col_cc%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_cc<-left_join(bd_col_cc,col_cc,by = "Nombre", copi= FALSE)

col_cc <- col_cc[order(col_cc$Nivel,col_cc$Sección,col_cc$Nombre),]
write_sheet(col_cc, sh, sheet = "CIENCIAS PARA LA CIUDADANÍA")



bd_col_filo<-col%>%
  filter(`Asignatura o módulo` == "FILOSOFÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_filo<-col_p%>%
  filter(`Asignatura o módulo` == "FILOSOFÍA")
col_filo<-dcast(col_filo,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_filo<-col_filo%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_filo<-left_join(bd_col_filo,col_filo,by = "Nombre", copi= FALSE)

col_filo <- col_filo[order(col_filo$Nivel,col_filo$Sección,col_filo$Nombre),]

write_sheet(col_filo, sh, sheet = "FILOSOFÍA")



bd_col_hist<-col%>%
  filter(`Asignatura o módulo` == "HISTORIA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_hist<-col_p%>%
  filter(`Asignatura o módulo` == "HISTORIA")
col_hist<-dcast(col_hist,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_hist<-col_hist%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_hist<-left_join(bd_col_hist,col_hist,by = "Nombre", copi= FALSE)
col_hist <- col_hist[order(col_hist$Nivel,col_hist$Sección,col_hist$Nombre),]
write_sheet(col_hist, sh, sheet = "HISTORIA")


bd_col_ing<-col%>%
  filter(`Asignatura o módulo` == "INGLÉS")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_ing<-col_p%>%
  filter(`Asignatura o módulo` == "INGLÉS")
col_ing<-dcast(col_ing,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_ing<-col_ing%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_ing<-left_join(bd_col_ing,col_ing,by = "Nombre", copi= FALSE)
col_ing <- col_ing[order(col_ing$Nivel,col_ing$Sección,col_ing$Nombre),]

write_sheet(col_ing, sh, sheet = "INGLÉS")




bd_col_fc<-col%>%
  filter(`Asignatura o módulo` == "FORMACIÓN CIUDADANA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_fc<-col_p%>%
  filter(`Asignatura o módulo` == "FORMACIÓN CIUDADANA")
col_fc<-dcast(col_fc,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_fc<-col_fc%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_fc<-left_join(bd_col_fc,col_fc,by = "Nombre", copi= FALSE)

col_fc <- col_fc[order(col_fc$Nivel,col_fc$Sección,col_fc$Nombre),]

write_sheet(col_fc, sh, sheet = "FORMACIÓN CIUDADANA")


rm(sh,col_p,col,bd_col_lyl,col_lyl,bd_col_mat,col_mat,bd_col_bio,col_bio,bd_col_fisic,
   col_fisic,bd_col_quim,col_quim,bd_col_cc,col_cc,bd_col_emp,col_emp,bd_col_filo,col_filo,
   bd_col_hist,col_hist,bd_col_ing,col_ing,bd_col_fc,col_fc,bd_col_cnat,col_cnat)


#################################################
###############################################
###########################################
########################################
#####################################
#################################
###LIA


#col_p<-evaluaciones%>%
#  filter(cuenta== "Liceo Industrial de Angol")%>%
#  summarise(
#    Nivel = nivel,
#    Sección = seccion,
#    Nombre = nombre,
#    `Asignatura o módulo` = cursos,
#    evaluacion,
#    n_eval,
#    p_logro)

#col_p<-distinct(col_p)

#col<-data_est%>%
#  filter(cuenta== "Liceo Industrial de Angol")%>%
#  summarise(Nivel = nivel,
#            Sección = seccion,
#            Nombre=nombre,
#            `Asignatura o módulo`=cursos,
#`Tickets Publicados`,
#`Tickets contestados`, 
#`% de participación`,
#p_logro
#            )


###EXPORTAR PARA GOOGLESHEET.
#sh<-("https://docs.google.com/spreadsheets/d/1owBPncjrmtgv1yUw1z0P1bv8Yb6gUzsvjufee3emkCY/edit#gid=0")
#SHdata<-read_sheet(sh)
#write_sheet(col, sh, sheet = "Data")




bd_col_lyl<-col%>%
  filter(`Asignatura o módulo` == "LENGUA Y LITERATURA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_lyl<-col_p%>%
  filter(`Asignatura o módulo` == "LENGUA Y LITERATURA")

col_lyl<-dcast(col_lyl, `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_lyl<-col_lyl%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_lyl<-left_join(bd_col_lyl,col_lyl,by = "Nombre", copi= FALSE)

col_lyl <- col_lyl[order(col_lyl$Nivel,col_lyl$Sección,col_lyl$Nombre),]

write_sheet(col_lyl, sh, sheet = "LENGUA Y LITERATURA")


bd_col_mat<-col%>%
  filter(`Asignatura o módulo` == "MATEMÁTICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_mat<-col_p%>%
  filter(`Asignatura o módulo` == "MATEMÁTICA")

col_mat<-dcast(col_mat,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_mat<-col_mat%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_mat<-left_join(bd_col_mat,col_mat,by = "Nombre", copi= FALSE)

col_mat <- col_mat[order(col_mat$Nivel,col_mat$Sección,col_mat$Nombre),]
write_sheet(col_mat, sh, sheet = "MATEMÁTICA")

bd_col_bio<-col%>%
  filter(`Asignatura o módulo` == "BIOLOGÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_bio<-col_p%>%
  filter(`Asignatura o módulo` == "BIOLOGÍA")

col_bio<-dcast(col_bio,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_bio<-col_bio%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_bio<-left_join(bd_col_bio,col_bio,by = "Nombre", copi= FALSE)

col_bio <- col_bio[order(col_bio$Nivel,col_bio$Sección,col_bio$Nombre),]
write_sheet(col_bio, sh, sheet = "BIOLOGÍA")


bd_col_fisic<-col%>%
  filter(`Asignatura o módulo` == "FÍSICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_fisic<-col_p%>%
  filter(`Asignatura o módulo` == "FÍSICA")
col_fisic<-dcast(col_fisic,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_fisic<-col_fisic%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_fisic<-left_join(bd_col_fisic,col_fisic,by = "Nombre", copi= FALSE)

col_fisic <- col_fisic[order(col_fisic$Nivel,col_fisic$Sección,col_fisic$Nombre),]
write_sheet(col_fisic, sh, sheet = "FÍSICA")

bd_col_quim<-col%>%
  filter(`Asignatura o módulo` == "QUÍMICA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_quim<-col_p%>%
  filter(`Asignatura o módulo` == "QUÍMICA")
col_quim<-dcast(col_quim,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")



col_quim<-col_quim%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_quim<-left_join(bd_col_quim,col_quim,by = "Nombre", copi= FALSE)

col_quim <- col_quim[order(col_quim$Nivel,col_quim$Sección,col_quim$Nombre),]

write_sheet(col_quim, sh, sheet = "QUÍMICA")         

bd_col_cc<-col%>%
  filter(`Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)

col_cc<-col_p%>%
  filter(`Asignatura o módulo` == "CIENCIAS PARA LA CIUDADANÍA")
col_cc<-dcast(col_cc,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_cc<-col_cc%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_cc<-left_join(bd_col_cc,col_cc,by = "Nombre", copi= FALSE)

col_cc <- col_cc[order(col_cc$Nivel,col_cc$Sección,col_cc$Nombre),]
write_sheet(col_cc, sh, sheet = "CIENCIAS PARA LA CIUDADANÍA")



bd_col_emp<-col%>%
  filter(`Asignatura o módulo` == "EMPRENDIMIENTO")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_emp<-col_p%>%
  filter(`Asignatura o módulo` == "EMPRENDIMIENTO")
col_emp<-dcast(col_emp,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_emp<-col_emp%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_emp<-left_join(bd_col_emp,col_emp,by = "Nombre", copi= FALSE)

col_emp <- col_emp[order(col_emp$Nivel,col_emp$Sección,col_emp$Nombre),]
write_sheet(col_emp, sh, sheet = "EMPRENDIMIENTO")                  


bd_col_filo<-col%>%
  filter(`Asignatura o módulo` == "FILOSOFÍA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_filo<-col_p%>%
  filter(`Asignatura o módulo` == "FILOSOFÍA")
col_filo<-dcast(col_filo,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")

col_filo<-col_filo%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_filo<-left_join(bd_col_filo,col_filo,by = "Nombre", copi= FALSE)

col_filo <- col_filo[order(col_filo$Nivel,col_filo$Sección,col_filo$Nombre),]

write_sheet(col_filo, sh, sheet = "FILOSOFÍA")



bd_col_hist<-col%>%
  filter(`Asignatura o módulo` == "HISTORIA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_hist<-col_p%>%
  filter(`Asignatura o módulo` == "HISTORIA")
col_hist<-dcast(col_hist,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_hist<-col_hist%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_hist<-left_join(bd_col_hist,col_hist,by = "Nombre", copi= FALSE)
col_hist <- col_hist[order(col_hist$Nivel,col_hist$Sección,col_hist$Nombre),]
write_sheet(col_hist, sh, sheet = "HISTORIA")


bd_col_ing<-col%>%
  filter(`Asignatura o módulo` == "INGLÉS")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)


col_ing<-col_p%>%
  filter(`Asignatura o módulo` == "INGLÉS")
col_ing<-dcast(col_ing,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_ing<-col_ing%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_ing<-left_join(bd_col_ing,col_ing,by = "Nombre", copi= FALSE)
col_ing <- col_ing[order(col_ing$Nivel,col_ing$Sección,col_ing$Nombre),]

write_sheet(col_ing, sh, sheet = "INGLÉS")




bd_col_fc<-col%>%
  filter(`Asignatura o módulo` == "FORMACIÓN CIUDADANA")%>%
  select(Nivel,Sección,Nombre,`Asignatura o módulo`)



col_fc<-col_p%>%
  filter(`Asignatura o módulo` == "FORMACIÓN CIUDADANA")
col_fc<-dcast(col_fc,  `Asignatura o módulo`+Nivel+Sección+Nombre~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_fc<-col_fc%>%
  select(-c(`Asignatura o módulo`,Nivel,Sección))

col_fc<-left_join(bd_col_fc,col_fc,by = "Nombre", copi= FALSE)

col_fc <- col_fc[order(col_fc$Nivel,col_fc$Sección,col_fc$Nombre),]

write_sheet(col_fc, sh, sheet = "FORMACIÓN CIUDADANA")



bd_col_especialidad<-data_est%>%
  filter(cuenta== "Liceo Industrial de Angol",cursos == "AJUSTE DE MOTORES" |
           cursos == "AUTOMATIZACIÓN DE SISTEMAS ELÉCTRICOS INDUSTRIALES" |                                   
           cursos == "FRESADO DE PIEZAS Y CONJUNTOS MECÁNICOS - TALADRADO Y RECTIFICADO DE PIEZAS MECÁNICAS" |
           cursos == "INSTALACIÓN DE MOTORES Y EQUIPOS DE CALEFACCIÓN" |                                      
           cursos == "INSTALACIÓN DE SISTEMAS DE CONTROL ELÉCTRICO INDUSTRIAL" |                              
           cursos == "INSTALACIONES ELÉCTRICAS DOMICILIARIAS" |                                               
           cursos == "INSTALACIONES ELÉCTRICAS INDUSTRIALES" |                                                
           cursos == "MANEJO DE RESIDUOS Y DESECHOS AUTOMOTRICES" |
           cursos == "MANTENIMIENTO DE HERRAMIENTAS" |
           cursos == "MANTENIMIENTO DE LOS SISTEMAS DE DIRECCIÓN Y SUSPENSIÓN" |
           cursos == "MANTENIMIENTO DE LOS SISTEMAS DE TRANSMISIÓN Y FRENADO" |
           cursos == "MANTENIMIENTO DE LOS SISTEMAS ELÉCTRICOS Y ELECTRÓNICOS" |
           cursos == "MANTENIMIENTO DE MÁQUINAS - EQUIPOS Y SISTEMAS ELÉCTRICOS" |
           cursos == "MANTENIMIENTO DE MOTORES" |
           cursos == "MECÁNICA DE BANCO" |
           cursos == "MECANIZADO CON MÁQUINAS DE CONTROL NUMÉRICO" |
           cursos == "SOLDADURA INDUSTRIAL" |
           cursos == "TORNEADO DE PIEZAS Y CONJUNTOS MECÁNICOS")%>%
  summarise(enrollment_rollup_id,
            Nivel = nivel,
            Sección = seccion,
            Nombre=nombre,
            `Asignatura o módulo`=cursos)


col_especialidad<-evaluaciones%>%
  filter(cuenta== "Liceo Industrial de Angol",cursos == "AJUSTE DE MOTORES" |
           cursos == "AUTOMATIZACIÓN DE SISTEMAS ELÉCTRICOS INDUSTRIALES" |                                   
           cursos == "FRESADO DE PIEZAS Y CONJUNTOS MECÁNICOS - TALADRADO Y RECTIFICADO DE PIEZAS MECÁNICAS" |
           cursos == "INSTALACIÓN DE MOTORES Y EQUIPOS DE CALEFACCIÓN" |                                      
           cursos == "INSTALACIÓN DE SISTEMAS DE CONTROL ELÉCTRICO INDUSTRIAL" |                              
           cursos == "INSTALACIONES ELÉCTRICAS DOMICILIARIAS" |                                               
           cursos == "INSTALACIONES ELÉCTRICAS INDUSTRIALES" |                                                
           cursos == "MANEJO DE RESIDUOS Y DESECHOS AUTOMOTRICES" |
           cursos == "MANTENIMIENTO DE HERRAMIENTAS" |
           cursos == "MANTENIMIENTO DE LOS SISTEMAS DE DIRECCIÓN Y SUSPENSIÓN" |
           cursos == "MANTENIMIENTO DE LOS SISTEMAS DE TRANSMISIÓN Y FRENADO" |
           cursos == "MANTENIMIENTO DE LOS SISTEMAS ELÉCTRICOS Y ELECTRÓNICOS" |
           cursos == "MANTENIMIENTO DE MÁQUINAS - EQUIPOS Y SISTEMAS ELÉCTRICOS" |
           cursos == "MANTENIMIENTO DE MOTORES" |
           cursos == "MECÁNICA DE BANCO" |
           cursos == "MECANIZADO CON MÁQUINAS DE CONTROL NUMÉRICO" |
           cursos == "SOLDADURA INDUSTRIAL" |
           cursos == "TORNEADO DE PIEZAS Y CONJUNTOS MECÁNICOS")%>%
  summarise(enrollment_rollup_id,
            evaluacion,p_logro)

col_especialidad<-dcast(col_especialidad,  enrollment_rollup_id~evaluacion, fun.aggregate = mean, value.var = "p_logro")


col_especialidad<-left_join(bd_col_especialidad,col_especialidad,by = "enrollment_rollup_id", copi= FALSE)


col_especialidad <- col_especialidad[order(col_especialidad$Nivel,col_especialidad$Sección,col_especialidad$`Asignatura o módulo`,col_especialidad$Nombre),]

col_especialidad<-col_especialidad%>%
  select(-c(enrollment_rollup_id))


write_sheet(col_especialidad, sh, sheet = "ESPECIALIDADES")


rm(sh,col_p,col,bd_col_lyl,col_lyl,bd_col_mat,col_mat,bd_col_bio,col_bio,bd_col_fisic,
   col_fisic,bd_col_quim,col_quim,bd_col_cc,col_cc,bd_col_emp,col_emp,bd_col_filo,col_filo,
   bd_col_hist,col_hist,bd_col_ing,col_ing,bd_col_fc,col_fc)



rm(list = ls())
quit()