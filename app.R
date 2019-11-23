library(dplyr)
library(shiny)
library(leaflet)
library(ggplot2)
library(plotly)

homelessness_type_by_state <- read.csv("Data/homelessness_type_by_state.csv",
                                       stringsAsFactors = FALSE)

number_homeless <- read.csv("Data/number_homeless.csv", stringsAsFactors = FALSE)

page_one <- tabPanel(
    "Introduction",
    titlePanel("Background on Homelessness"),
    p(" Homeslesness is when an individual, family or community is without
    a stable housing condition and lacks basic needs like health care.
    The problem is that homelessness is increasing exponentially due
    to unemployment, lack of low-income housing, substance abuse problems,
    healthcare, etc. The effects of homelessness are devastating in that many
    homeless people are without basic necessities, including food security, and
    lack the resources to achieve upward mobility (i.e. higher education,
    employment opportunities). It matters because this problem is causing
    homeless people to have physical and mental health problems, children are
    suffering from hunger and malnutrition, and homeless people are an easy
    target for criminals to exploit. This matters because homelessness is
    usually caused by unexpected life events or unemployment and there aren't
    many or any resources to help people rebuild their lives after facing such
    tragedies."),
    h2("Research Questions"),
    p("1. Why do we see higher rates of homelessness in certain
      areas and cities and what could potentially be perpetuating these high
      rates?"),
    p("2. What are the different causes of homelessness and how can our
    solutions address these causes? Are there already existing solutions
     in place / how can we maximize these efforts?"),
)

page_two <- tabPanel(
    "Visualizations",
    ui <- fluidPage(
        titlePanel("Gain insights"),

        sidebarLayout(
            sidebarPanel(
                selectInput(
                    inputId = "types",
                    label = "Different types of Homelessness",
                    choices = c("Homeless_Individuals",
                                "Homeless_People_in_Families",
                                "Homeless_Veterans", "Total_Homeless",
                                "Sheltered_Homeless_Individuals",
                                "Sheltered_Homeless_People_in_Families",
                                "Sheltered_Homeless_Veterans",
                                "Total_Sheltered_Homeless",
                                "Unsheltered_Homeless_Individuals",
                                "Unsheltered_Homeless_People_in_Families",
                                "Unsheltered_Homeless_Veterans",
                                "Total_Unsheltered_Homeless")
                )
            ),

            # Show a plot of the generated distribution
            mainPanel(
                plotlyOutput("Types_Plot"),

                h2("Total Number of Homeless People Per Year"),

                plotlyOutput("Number_Plot")
            )
        )

    )
)

page_three <- tabPanel(
    "Future Steps",
    ui <- fluidPage(
        titlePanel("Conclusion"),
        h2("Problem Situation"),
        p("The stakeholders in our problem are society and more directly the
        economy (indirect stakeholder) and those who are currently homeless
        (direct stakeholder). The setting of our problem is cities and societies
        across the United States, plagued with homelessness. Values and tensions
        in play when addressing this problem include lack of affordable
        low-income housing, unemployment, unexpected changes in life (bankruptcy
        , loss of job). Policy and ethical elements exist within this problem in
        that the government plays a role in regulating institutions and creating
        policies that may be alleviating or perpetuating the problem of
        homelessness. On an ethical side, we see that many veterans are
        currently homeless and the government isn't providing resources to help
        them, as well as the apathetic nature of society towards the homeless
        population. Work done in this area include efforts to increase access to
        homeless shelters, food banks, etc. We are building on this work in that
        we want to find the most highly affected areas so we can better address
        this problem and increase efforts in these areas. We chose and care
        about this problem because we live in Seattle- a city that has one of
        the highest rates of homelessness in the U.S. We can see on a daily
        basis how this affects people's lives, which motivates us to address
        this issue further."),
        h2("How will it be addressed?"),
        p("Our goal in addressing this problem is to find the most problematic
        areas (highest rates of homelessness) we see in the US and analyze why
        these areas potentially have the highest homeless rates. After analyzing
        this data, we hope to address and alleviate the problem by providing
        this data to organizations that seek to help the homeless so they can
        make the largest impact possible. In addition, we could use this data to
        provide resources to homeless populations so that they could have access
        to amenities to help themselves (for example: employment opportunities,
        food banks, shelters).")
    )
)

page_four <- tabPanel(
    "About the app",
    ui <- fluidPage(
        titlePanel("Technology Used"),
        h2("User Interface(UI)"),
        p("To create the Intro and Conclusion pages I had to install the shiny
        package and create an app.R file. After this I used the fluidPage
        function to create my titles and write my paragraphs. Some of the other
        functions I used is the h2( ), p( ), and titlePanel( ) function.
        In our UI we also cretaed our drop down menuusing selctInput function"),
        h2("Server"),
        p(" In the server, we created our visualizations using plotly. We used
        different layout schemes to see which type of visualization represented
        our data the best. Finally we created two bar graphs, one that was
        interactive and the other which isn't. The interactive bar graph can
        change its variables based on the input that is chosen from the drop
        down menu present in the UI"),
    )

)

page_five <- tabPanel(
    "About us",
    ui <- fluidPage(
        titlePanel("Who Are We"),
            "Team #1", br(), "Mehul Goel, Destiny Broughton, Salma Mohamed",
            br(), "Technical Foundations of Informatics",
            br(), "The Information School",
            br(), "University of Washington",
            br(), "Autumn 2019",
        h2("Project Team's Goals"),
            "Destiny's individual goal for the project is to delve deeper into
            the problem of homelessness and create viable solutions.", br(),
            "Salma's individual goal is to find the trends in homeless in the
            U.S and what the leading cause is from state to state.", br(),
            "Mehul's individual goal is to understand the trends that take
            place in homelessness and create ideas for solutions that can reduce
            homelessness."),
        h2("Links"),
            a("Link to the Github Repository ",
              href = "https://github.com/goel-mehul/INFO-201-Group-Project"),
            br(),
            a("Link to the Technical Report",
              href = "https://github.com/goel-mehul/INFO-201-Group-Project/wiki/
              INFO-201-Technical-Report")
)

ui <- navbarPage(
    "My Application",
    page_one,
    page_two,
    page_three,
    page_four,
    page_five
)

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

# Run the Application
shinyApp(ui = ui, server = server)
