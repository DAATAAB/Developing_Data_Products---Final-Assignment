library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    set.seed(2016-05-25)
    
    numbers <- input$numeric
    
    x<-seq(0,numbers,0.01)
    
    number_of_points <- rnorm(numbers, mean = 0, sd = 1)
    number_df <- as.data.frame(number_of_points)
    
    if (input$show_title == TRUE){
    
    g <- geom_density(alpha=.2, fill="#FF6666")
    
    } else {
      
      g <- NULL
    }
    
    if (input$show_mean == TRUE){
      
      m <- geom_vline(aes(xintercept = mean(number_of_points)), colour="blue", lwd = 1)
      
    } else {
      
      
      m <- NULL
    }
    
    ggplot(number_df, aes(x = number_of_points, y=..density..)) + xlab("Values") +
      ylab("Density") + geom_histogram(color="black", fill="white") + g + m
    

  })
})