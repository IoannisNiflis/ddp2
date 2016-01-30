
library(shiny)
library(datasets)
dataInfoShiny <- read.csv("dataInfoShiny.csv")
# Define server logic required to summarize and view the selected
# dataset
shinyServer(function(input, output) {
  
  # Return the requested dataset
  datasetInput <- reactive({
     switch(input$dataset,
           "MASS" = dataInfoShiny[1,],
           "AFFLUENT" = dataInfoShiny[2,],
           "BUSINESS" = dataInfoShiny[3,])
  })
  
  # Generate interactive output
  output$View <- renderDataTable({
    dataset <- datasetInput()
    

  })
  #kpi 1
  
 h1( output$View2 <- renderText({dataset <- (datasetInput()$X2015Customers- datasetInput()$X2014.customers)*100/(datasetInput()$X2014.customers)})
 )
 
  #kpi2
  output$View3 <- renderText({dataset <- datasetInput()$newcustomers/datasetInput()$lostcustomers})
  
  #plot
  output$View4 <- renderPlot({boxplot(datasetInput()[1,5:6],ylim = c(0,2000))})
 
    })

