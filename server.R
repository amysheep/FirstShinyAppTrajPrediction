# Including the required R packages.
packages <- c('shiny')
if (length(setdiff(packages, rownames(installed.packages()))) > 0) {
  install.packages(setdiff(packages, rownames(installed.packages())))  
}

library(shiny)

shinyServer(function(input, output) {
  submit <- FALSE
  output$title <- eventReactive(input$score1, {
    'Predicted probabilities for each trajectory'
  })
  
  output$label1 <- eventReactive(input$score1, {
    'Traj 1 probability'
  })
  output$prediction1 <- eventReactive(input$score1, {
    paste0('<pre>', prob1(input$age,input$diagnosis,input$parity,input$adulphysicalabuse,input$chronicillness,input$globlefun)*100, '%', '</pre>')
  })
 
 output$label2 <- eventReactive(input$score2, {
   'Traj 2 probability'
 })
 output$prediction2 <- eventReactive(input$score2, {
   paste0('<pre>', prob2(input$age,input$diagnosis,input$parity,input$adulphysicalabuse,input$chronicillness,input$globlefun)*100, '%', '</pre>')
 })
 
 output$label3 <- eventReactive(input$score2, {
   'Traj 3 probability'
 })
 output$prediction3 <- eventReactive(input$score3, {
   paste0('<pre>', prob3(input$age,input$diagnosis,input$parity,input$adulphysicalabuse,input$chronicillness,input$globlefun)*100, '%', '</pre>')
 })
})

prob1 <- function(age,diagnosis,parity,adulphysicalabuse,chronicillness,globlefun) {
b2x=6.37- 0.032*age + 1.45*ifelse(diagnosis=="Depression only",1,0) + 2.07 *ifelse(diagnosis=="Anxiety and Depression",1,0) + 0.18* parity + 0.78 * ifelse(adulphysicalabuse=="Yes",1,0) + 0.14 * chronicillness - 0.14 *globlefun
b3x=7.30- 0.15*age + 0.29* ifelse(diagnosis=="Depression only",1,0)+ 1.29 *ifelse(diagnosis=="Anxiety and Depression",1,0) + 0.62 * parity+ 0.63 *ifelse(adulphysicalabuse=="Yes",1,0) + 0.12 * chronicillness - 0.13 * globlefun
return(1/(1+exp(b2x)+exp(b3x)))
}

prob2 <- function(age,diagnosis,parity,adulphysicalabuse,chronicillness,globlefun) {
  b2x=6.37- 0.032*age + 1.45*ifelse(diagnosis=="Depression only",1,0) + 2.07 *ifelse(diagnosis=="Anxiety and Depression",1,0) + 0.18* parity + 0.78 * ifelse(adulphysicalabuse=="Yes",1,0) + 0.14 * chronicillness - 0.14 *globlefun
  b3x=7.30- 0.15*age + 0.29* ifelse(diagnosis=="Depression only",1,0)+ 1.29 *ifelse(diagnosis=="Anxiety and Depression",1,0) + 0.62 * parity+ 0.63 *ifelse(adulphysicalabuse=="Yes",1,0) + 0.12 * chronicillness - 0.13 * globlefun
  return(exp(b2x)/(1+exp(b2x)+exp(b3x)))
}

prob3 <- function(age,diagnosis,parity,adulphysicalabuse,chronicillness,globlefun) {
  b2x=6.37- 0.032*age + 1.45*ifelse(diagnosis=="Depression only",1,0) + 2.07 *ifelse(diagnosis=="Anxiety and Depression",1,0) + 0.18* parity + 0.78 * ifelse(adulphysicalabuse=="Yes",1,0) + 0.14 * chronicillness - 0.14 *globlefun
  b3x=7.30- 0.15*age + 0.29* ifelse(diagnosis=="Depression only",1,0)+ 1.29 *ifelse(diagnosis=="Anxiety and Depression",1,0) + 0.62 * parity+ 0.63 *ifelse(adulphysicalabuse=="Yes",1,0) + 0.12 * chronicillness - 0.13 * globlefun
  return(exp(b3x)/(1+exp(b2x)+exp(b3x)))
}