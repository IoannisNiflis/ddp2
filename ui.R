
#please put the csv file in your working directory
dataInfoShiny <- read.csv("dataInfoShiny.csv")
library(shiny)
library(shinythemes)

# Define UI for dataset viewer application
shinyUI(fluidPage(theme = shinytheme("Cerulean"),
  
  # Application title
  titlePanel("New and Lost Customers per Segment"),
  
  
  # Sidebar with controls to select a dataset
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset", "Choose a segment:", 
                  choices = c("MASS", "AFFLUENT", "BUSINESS"))
      
      
      
    ),
    
    
    # Create Various types of outputs. Data table, kpis and a plot
    mainPanel(
      
      
      dataTableOutput("View"),
      h3("% Change"),
      verbatimTextOutput("View2"),
      h3("Rate of new customers vs lost customers"),
      verbatimTextOutput("View3"),
      plotOutput("View4")
      
       
    )
  )
))

