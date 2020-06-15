#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$Segmentos_Plot <- renderPlot({

          datos <- iris4 %>% select(x = input$xvar, y = input$yvar)
          modelo <- kmeans(datos, centers = input$Segmentos, nstart = 25)
          datos1 <- cbind(datos, grupo= modelo$cluster)
          
          
        # draw the histogram with the specified number of bins
      p <- ggplot(datos1, aes(x = x, y =  y, color = factor(grupo)))+
        geom_point()
      p + labs(x = input$xvar , y = input$yvar)
    })


  
  
  })


