library(shiny)
ui <- fluidPage(
    titlePanel("Midpoint Project Deliverable"),
    h2("Background on Homelessness"),
    p(" Homeslesness is when an individual, family or community is without a stable housing condition and
    lacks basic needs like health care. The problem is that homelessness is increasing exponentially due 
    to unemployment, lack of low-income housing, substance abuse problems, healthcare, etc. The effects of
    homelessness are devastating in that many homeless people are without basic necessities, including food 
    security, and lack the resources to achieve upward mobility (i.e. higher education, employment
    opportunities).It matters because this problem is causing homeless people to have physical and mental health
    problems, children are suffering from hunger and malnutrition, and homeless people are an easy target for 
    criminals to exploit. This matters because homelessness is usually caused by unexpected life events or 
    unemployment and there aren't many or any resources to help people rebuild their lives after facing such tragedies."),
    h2("Research Questions"),
    p("1. Why do we see higher rates of homelessness in certain
      areas and cities and what could potentially be perpetuating these high rates?"),
    p("2. What are the different causes of homelessness and how can our solutions address these causes? 
    Are there already existing solutions in place/ how can we maximize these efforts?"),
)
shinyApp(ui = ui, server = server)
