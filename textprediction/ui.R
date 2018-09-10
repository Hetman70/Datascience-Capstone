library(shiny)
library(shinythemes)
library(shinyBS) 
shinyUI(
  fluidPage(theme = shinytheme("simplex"),
            column(6,offset = 4, titlePanel("I Think the next word is ...")),
    
    sidebarPanel(
      textInput("inputText", h5("Text input")),
      
      sliderInput("numToPredict", "Numbers of words to predict", min = 1, max = 5, value = 3, step = 1),
      bsTooltip(id = "numToPredict", title = "Numbers of words to predict", placement = "right", options = list(container = "body")),
      
      submitButton("SUBMIT"),
                    br()),
    mainPanel(
      tabsetPanel(type = "tabs", 
        tabPanel(h4("Overview"), 
          h4("Introduction"),
          p("This  Application is the final Capstone project 
            for the Coursera Data Science Specialization"),
          p("The guideline of this application came from the SwiftKey
            Keyboard application, which is a tool
            that is capable of predicting the next word as user types onto
            the smart phone keyboard."),
          h4("Text Prediction Model"),
          p("The model used for this text prediction is the Markov Chain Model
            Which each word is modeled as transitional probability state."),
          h4("Application Instruction"),
          p("1. Type some text into the text box under the \"Text input\" heading"),
          p("2. \"Text input\" values are restricted to only alphabetical words."),
          p("3. Select the number of words to be predicted. default is 3, minimum is 1 and maximum is 5."),
          p("4. Click submit button once inputs are statisfied."),
          p("5. Navigate to Output Panel to view results by clicking on the \"Output\" tab."),
          h4("Input / Output"),
          p("1. User may input any words, however it will be preprocessed before
            pushing into prediction executor"),
          p("2. Under the \"Output\" tab in text box under heading \"You have entered\" will show
            the text user has entered. Text box under heading \"Your preprocessed input\" will
            show the text after preprocessed. Text box under heading \"The predicted words are
            as follow\" will show the predicted words.")),
        
        tabPanel(h4("Output"),
          h4("You have entered"),
          span(h4(textOutput("inputText")), style="font-weight: bold; color: #4582ec"),
          br(),
          h4("Your preprocessed input"),
          span(h4(textOutput("preprocessedInputText")), style="font-weight: bold; color: #4582ec"),
          br(),
          h4("The predicted words are as follow"),
          span(h4(textOutput("predictedWords")), style="font-weight: bold; color: #4582ec")
          ))
  ))
)