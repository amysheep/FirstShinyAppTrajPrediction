## deployApp() to publish to shinyapps.io
## Including the required R packages.
packages <- c('shiny')
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

library(shiny)

shinyUI(fluidPage(
  headerPanel('Trajectory prediction'),
  sidebarPanel(
    numericInput('age', 'Age of mom',25,10,99),
    selectInput("diagnosis","Diagnosis",c("Depression only","Anxiety and Depression","Anxiety only")),
    numericInput("parity","Parity",1,0,10),
    radioButtons("adulphysicalabuse","Adult Physical Abuse", c("Yes","No")),
    numericInput("chronicillness","Number of Chronic Illness Diagnosed",0,0,10),
    numericInput("globlefun","Global Functioning",0,0,100),
    actionButton('score1', 'Probability in Trajectory 1'),
    actionButton('score2', 'Probability in Trajectory 2'),
    actionButton('score3', 'Probability in Trajectory 3')
    
    
    

  ),
  mainPanel(
    h3(textOutput('title')),
    h4(textOutput('label1')),
    htmlOutput('prediction1'),
    h4(textOutput('label2')),
    htmlOutput('prediction2'),
    h4(textOutput('label3')),
    htmlOutput('prediction3')
  )
))


