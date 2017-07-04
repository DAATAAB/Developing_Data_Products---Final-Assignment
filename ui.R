library(shiny)
library(ggplot2)

shinyUI(fluidPage(
  titlePanel("Normal distribution simulation"),
  sidebarLayout(
    sidebarPanel(
      numericInput("numeric", "How many random numbers do you want to include in the simulation?", 
                   value = 0, min = 0, max = 1000, step = 1),
      
      p("The random numbers are normaly distributed with mean ~ 0, and standard deviation ~ 1"),

      br(),
        
      checkboxInput("show_title", "Show density curve", value = FALSE),
      checkboxInput("show_mean", "Show mean value", value = FALSE),
      
      br(),
      
      p(strong("How to use the app")),
      
      br(),
      
      p("The app helps you understand the basic mechanism behind normal distribution."), 
      
      wellPanel(
      helpText(a("For more information on normal distribution click here.", 
                 href = "http://rpubs.com/Andrei_Damsa/normal_dist"))
      ),
      p("Enter a number at the input field and wait for the plot to be drawn. You can add the density curve and
        the mean value to the plot by checking the boxes.")
    ),
    mainPanel(
      h3("Distribution"),
      plotOutput("plot1")
    )
  )
))