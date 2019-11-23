library(shiny)

page_one <- tabPanel(
    "First Page", 
    titlePanel("Page 1"),
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
page_two <- tabPanel(
    "Second Page",
    ui <- fluidPage(
        titlePanel("Technology Used"),
        h2("User Interface(UI)"),
        p("To create the Intro and Conclusion pages I had to install the shiny package and create an app.R file.
      After this I used the fluidPage function to create my titles and write my paragraphs. Some of the other
      functions I used is the h2( ), p( ), and titlePanel( ) function. -Salma"),
        h2("Server"),
        p(""),
        h2("Project Team"),
        p("Destiny’s individual goal for the project is to delve deeper into the problem of homelessness and 
    create viable solutions. Salma’s individual goal is to find the trends in homeless in the U.S and what
    the leading cause is from state to state. Mehul’s individual goal is to understand the trends that take
      place in homelessness and create ideas for solutions that can reduce homelessness.")
    )
    
)
)
page_three <- tabPanel(
    "Third Page",
    ui <- fluidPage(
        titlePanel("Conclusion"),
        h2("Problem Situation"),
        p("The stakeholders in our problem are society and more directly the economy (indirect stakeholder) and those
    who are currently homeless (direct stakeholder). The setting of our problem is cities and societies across the United States, 
    plagued with homelessness. Values and tensions in play when addressing this problem include lack of affordable low-income housing, 
    unemployment, unexpected changes in life (bankruptcy, loss of job). Policy and ethical elements exist within this problem in that
    the government plays a role in regulating institutions and creating policies that may be alleviating or perpetuating the problem of 
    homelessness. On an ethical side, we see that many veterans are currently homeless and the government isn’t providing resources to help them, 
    as well as the apathetic nature of society towards the homeless population. Work done in this area include efforts to increase access to homeless
    shelters, food banks, etc. We are building on this work in that we want to find the most highly affected areas so we can better address this problem 
    and increase efforts in these areas. We chose and care about this problem because we live in Seattle-
    a city that has one of the highest rates of homelessness in the U.S. We can see on a daily basis
    how this affects people's lives, which motivates us to address this issue further."),
        h2("How will it be addressed?"),
        p("Our goal in addressing this problem is to find the most problematic areas (highest rates of
    homelessness) we see in the US and analyze why these areas potentially have the highest homeless rates.
    After analyzing this data, we hope to address and alleviate the problem by providing this data to 
    organizations that seek to help the homeless so they can make the largest impact possible. 
    In addition, we could use this data to provide resources to homeless populations so that they could 
    have access to amenities to help themselves (for example: employment opportunities, food banks, shelters).")
    )
)
)
ui <- navbarPage(
    "My Application",
    page_one,
    page_two,
    page_three
)
shinyApp(ui = ui, server = server)
