#load packages
library(dplyr)
library(shiny)
library(ggplot2)
library(plotly)

#get source files for ui and server of the app
source("app_ui.R")
source("app_server.R")

# Run the Application
shinyApp(ui = ui, server = server)
