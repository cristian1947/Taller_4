# TALLER - MODULO 4
# Modulo 4: Visualizacion de datos con ggplot2
# Cristian Mendez - Sebastian Osorio - Lizeth Vasquez

install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

#Cargar la base de datos
DATA <-read_csv("C:\\Users\\LIZETH VASQUEZ\\Documents\\ANALISIS_DE_DATOS_R\\TALLER MODULO 4\\songs_normalize.csv")
head(DATA)

##   PUNTO 1. 

# Grafico de Dispersion elabore un grafico de dispersion?n con las variables danceability y valence, 
# que tenga los puntos de color azul y una transparencia de 0.3.


ggplot(DATA, aes(x = danceability, y = valence)) +
  geom_point(color = "blue",
             alpha = 0.3)

##  PUNTO 2. 
# Boxplot elabore un boxplot con la variable mode en el eje x 
# y la variable energy en el eje y. Asigne el color de las cajas de acuerdo 
# con la variable mode y elimine la leyenda.
# Pista: No olvide convertir la variable mode en un factor cuando 
# la incluya en la función aes().


str(mode)
View(DATA)

DATA$mode = as.factor(DATA$mode)


MI_boxplot <- ggplot(DATA, aes(x = mode, y = energy, color = mode, fill = mode))+
  geom_boxplot(show.legend = F)

MI_boxplot

## PUNTO 3. 
# Composicion con Patchwork usando el paquete {patchwork}, construya una salida grafica 
# con los graficos anteriores de tal modo que aparezcan uno al lado del otro.

library(patchwork)

p1 <- ggplot(DATA, aes(x = danceability, y = valence)) +
  geom_point(color = "blue",
             alpha = 0.3)

p2 <- MI_boxplot <- ggplot(DATA, aes(x = mode, y = energy, color = mode, fill = mode))+
  geom_boxplot(show.legend = F)


p1 + p2
