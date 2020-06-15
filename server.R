
# Define server logic required to draw 
shinyServer(function(input, output) {
  
    output$Segmentos_Plot <- renderPlot({

          datos <- iris[,1:4] %>% select(x = input$xvar, y = input$yvar)
          modelo <- kmeans(datos, centers = input$Segmentos, nstart = 25)
          datos1 <- cbind(datos, grupo= modelo$cluster)
          
          
        
      p <- ggplot(datos1, aes(x = x, y =  y, color = factor(grupo)))+
        geom_point()
      p + labs(x = input$xvar , y = input$yvar)
    })


  
  
  })


