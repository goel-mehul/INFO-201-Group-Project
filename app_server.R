library(dplyr)
library(ggplot2)
library(plotly)

# Define server logic required to draw a histogram
server <- function(input, output) {
  output$Types_Plot <- renderPlotly(

    graph1 <- plot_ly(
      type = "bar",
      homelessness_type_by_state,
      x = homelessness_type_by_state[["State"]],
      y = ~get(input$types)
    ) %>%
      layout(title = paste(input$types,
                           "in different states from 2008-2016",
                           sep = "<br>"),
             xaxis = list(title = "Different States"),
             yaxis = list(title = input$types)
      ),
  )

  output$Number_Plot <- renderPlotly(

    graph2 <- plot_ly(
      type = "bar",
      number_homeless,
      x = number_homeless$Year,
      y = number_homeless$Number_Homeless,
      color = I("Red")
    ) %>%
      layout(xaxis = list(title = "Year"),
             yaxis = list(title = "Total Number of Homeless People"))
  )

}
