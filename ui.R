
library(ggplot2)
library(shiny)
library(shiny)
library(ggplot2)
library(dplyr)



# Definiendo UI para la aplicación que grafica un gráfico de dispersión con Kmeans.
shinyUI(fluidPage(

    
    titlePanel("Visualizador de segmentos-kmeans"),

    sidebarLayout(
        sidebarPanel(
          h4("Elija las variables de segmentación x"),
          varSelectInput("xvar", "Eje X", iris[,1:4]),
          h4("Elija las variables de segmentación y"),
          varSelectInput("yvar", "Eje Y", iris[,1:4])
          ,
          h3("Elija el número de clúster")
          ,
            sliderInput("Segmentos",
                        "Número de Segmentos:",
                        min = 2,
                        max = 8,
                        value = 3)
        ),

        # Show a plot of the generated distribution
        mainPanel(
             plotOutput("Segmentos_Plot")
            
            
        )
    )
))




