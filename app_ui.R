library(dplyr)
library(ggplot2)
library(plotly)

homelessness_type_by_state <- read.csv("Data/homelessness_type_by_state.csv",
                                       stringsAsFactors = FALSE)

number_homeless <- read.csv("Data/number_homeless.csv",
                            stringsAsFactors = FALSE)

page_one <- tabPanel(
  "Introduction",
  sidebarLayout(
    sidebarPanel(),
    mainPanel(
      titlePanel("Background on Homelessness"),
      p(" Homeslesness is when an individual, family or community is without
        a stable housing condition and lacks basic needs like health care.
        The problem is that homelessness is increasing exponentially due
        to unemployment, lack of low-income housing, substance abuse problems,
        healthcare, etc. The effects of homelessness are devastating in that
        many homeless people are without basic necessities, including food
        security, and lack the resources to achieve upward mobility (i.e.
        higher education, employment opportunities). It matters because this
        problem is causing homeless people to have physical and mental health
        problems, children are suffering from hunger and malnutrition, and
        homeless people are an easy target for criminals to exploit. This
        matters because homelessness is usually caused by unexpected life
        events or unemployment and there aren't many or any resources to help
        people rebuild their lives after facing such tragedies."),
      h2("Research Questions"),
      p("1. Why do we see higher rates of homelessness in certain
        areas and states and what could potentially be perpetuating these high
        rates?"),
      p("2. What are the different causes of homelessness? Are there already
        existing solutions in place / how can we maximize these efforts?"),
    )
  )
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
    sidebarLayout(
      sidebarPanel(),
      mainPanel(
        h2("Problem Situation"),
        p("The stakeholders in our problem are society and more directly the
          economy (indirect stakeholder) and those who are currently homeless
          (direct stakeholder). The setting of our problem is cities and
          societies across the United States, plagued with homelessness. Values
          and tensions in play when addressing this problem include lack of
          affordable low-income housing, unemployment, unexpected changes in
          life (bankruptcy loss of job). Policy and ethical elements exist
          within this problem in that the government plays a role in regulating
          institutions and creating policies that may be alleviating or
          perpetuating the problem of homelessness. On an ethical side, we see
          that many veterans are currently homeless and the government isn't
          providing resources to help them, as well as the apathetic nature of
          society towards the homeless population. Work done in this area
          include efforts to increase access to homeless shelters, food banks,
          etc. We are building on this work in that we want to find the most
          highly affected areas so we can better address this problem and
          increase efforts in these areas. We chose and care about this problem
          because we live in Seattle- a city that has one of the highest rates
          of homelessness in the U.S. We can see on a daily basis how this
          affects people's lives, which motivates us to address this issue
          further."),
        h2("How will it be addressed?"),
        p("Our goal in addressing this problem is to find the most problematic
          areas (highest rates of homelessness) we see in the US and analyze why
          these areas potentially have the highest homeless rates. After
          analyzing this data, we hope to address and alleviate the problem by
          providing this data to organizations that seek to help the homeless so
          they can make the largest impact possible. In addition, we could use
          this data to provide resources to homeless populations so that they
          could have access to amenities to help themselves (for example:
          employment opportunities, food banks, shelters)."),
        h2("Research Answers"),
        p("In our first research question, we asked, why some states have a
          higher number of homeless people. From our visualizations, we can
          clearly see that California and Florida have the highest homeless
          people when compared to other states. In comparison, Washington
          has a realtively low number of homeless people. From our research,
          we found out that most of it is related to the fact that California
          in genral have a very high housing cost when compared to its
          neighboring states. Another reason why homelessness is so much in
          California and Florida is because in both states, the whether is
          mostly sunny and hot, which makes it easier for people to spend
          the night outside when compared to other states like Washington
          where the nights are very cold."),
        br(),
        p("In our second research question, we asked what were the reasons
          for increasing number of homeless people, and whether any existing
          solutions can counter this upward movement. So from our research, we
          found that homelessness is increasing due to the constant increase in
          housing rents. People have to now pay more percent of their income to
          rent a house when compared to previous years, which has led to a rapid
          increase in homelessness thoughout the US. One of the solution is for
          government and non profit agencies to take actions and provide a means
          of affordable housing. With our application, we hope we can provide
          the data for people to see and bring the issue of rising homelessness
          to their concern. Only when more and more people talk about this issue
          , would there be a change in the current housing system which would
          help reduce the number of homeless people in the USA.")
      )
    )
  )
)

page_four <- tabPanel(
  "About the app",
  ui <- fluidPage(
    titlePanel("Technology Used"),
    sidebarLayout(
      sidebarPanel(),
      mainPanel(
        h2("User Interface(UI)"),
        p("To create our UI pages we first installed the shiny package and
          created three seperate files, app.R, app_ui.R and app_server.R.
          We first started working on our app_ui.R file. To do this we used
          the fluidPage function to create a navigation bar for our different
          tabs. On each tab we used a common sidebarLayout, so that our tabs
          remained consistent with each other. While creating these tabs, we
          also used basic HTML functions like h2(), p(), br() and titlePanel().
          For our \"visualizations\" page we created a SelectInput which could
          help our users change the type of homelessness and see which state
          suffers what kind of homelessness."),
        h2("Back End Server"),
        p(" We created our server file in app_server.R. We created two different
          visualizations using the plotly package. The first visualization we
          created is interactive and can be manipulated by a user. A user can
          change the field on the SelectInput drop down button on the right to
          see the type of homelessness that exists in each state. For the second
          visualization, we agin used plotly, but made it non-interactive. For
          these visualizations, we used different colors and areas, so that they
          become aesthetically appealing."),
      )
    )
  )
)

page_five <- tabPanel(
  "About us",
  ui <- fluidPage(
    titlePanel("Who Are We"),
    sidebarLayout(
      sidebarPanel(),
      mainPanel(
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
        homelessness.",
        h2("Links"),
        a("Link to the Technical Report",
          href = "https://github.com/goel-mehul/INFO-201-Group-Project/wiki/
          INFO-201-Technical-Report")
      )
    )
  )
)
ui <- navbarPage(
  "INFO 201 Project",
  page_one,
  page_two,
  page_three,
  page_four,
  page_five
)
