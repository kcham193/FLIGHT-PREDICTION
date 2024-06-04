# Import required library
#library(e1071)  # For SVM
#install.packages(e1071)

# Clear workspace
rm(list = ls())

# Import libraries  
library(shiny)
library(e1071)
#library(randomForest)
library(shinythemes)

# Read data
weather <- data.frame(
  outlook = c("Sunny", "Sunny", "Overcast", "Rainy", "Rainy", "Rainy", "Overcast", "Sunny", "Sunny", "Rainy", "Sunny", "Overcast", "Overcast", "Rainy"),
  temperature = c(85, 80, 83, 70, 68, 65, 64, 72, 69, 75, 75, 72, 81, 71),
  humidity = c(85, 90, 86, 96, 80, 70, 65, 95, 70, 80, 70, 90, 75, 91),
  windy = c(FALSE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, FALSE, FALSE, TRUE, TRUE, FALSE, TRUE),
  fly = c("no", "no", "yes", "yes", "yes", "no", "yes", "no", "yes", "yes", "yes", "yes", "yes", "no")
)


# Convert 'fly' to a factor
weather$fly <- factor(weather$fly, levels = c("no", "yes"))

# Build logistic regression model
#model <- glm(play ~ ., data = weather, family = binomial)
#model <- randomForest(fly ~ ., data = weather, ntree = 1000, mtry = 3, importance = FALSE)

####################################
# User interface                   #
####################################

ui <- fluidPage(theme = shinytheme('superhero'), 
  # Page header
  headerPanel('Can the Plane fly?'),
  
  # Input values 
  sidebarPanel(
    HTML("<h3>Input parameters</h3>"),
    selectInput("outlook", label = "outlook:", 
                choices = c("Sunny", "Overcast", "Rainy"), 
                selected = "Sunny"),
    sliderInput("temperature", label = "Temperature:",
                min = 64, max = 86,
                value = 70),
    sliderInput("humidity", label = "Humidity:",
                min = 65, max = 96,
                value = 90),
    selectInput("windy", label = "Windy:", 
                choices = list("Yes" = TRUE, "No" = FALSE), 
                selected = TRUE),
    
    actionButton("submitbutton", "Submit", class = "btn btn-primary")
  ),
  
  mainPanel(
    tags$label(h3('Status/Output')), # Status/Output Text Box
    verbatimTextOutput('contents'),
    tableOutput('tabledata') # Prediction results table
  )
)

####################################
# Server                           #
####################################

# Define server logic
server <- function(input, output, session) {
  
  # Input Data
  datasetInput <- reactive({  
    
    # Create a data frame with input parameters
    df <- data.frame(
      outlook = factor(input$outlook, levels = c("Sunny", "Overcast", "Rainy")),
      temperature = input$temperature,
      humidity = input$humidity,
      windy = as.logical(input$windy)
    )
    
    # Ensure factor levels match
    df$outlook = factor(input$outlook, levels = c("Sunny", "Overcast", "Rainy"))
    
    
    # Debug: Print input data
    print("Input data:")
    print(df)
    
    # Build SVM model
    model <- svm(fly ~ ., data = weather, kernel = "radial")
    
    # Predict using the model
    prediction <- predict(model, newdata = df)
    
    # Return the predictions
    return(prediction)
  })
  
  # Status/Output Text Box
  output$contents <- renderPrint({
    if (input$submitbutton > 0) { 
      "Calculation complete." 
    } else {
      "Server is ready for calculation."
    }
  })
  
  # Prediction results table
  output$tabledata <- renderTable({
    if (input$submitbutton > 0) { 
      datasetInput() 
    } 
  })
  
}
  

####################################
# Create the shiny app             #
####################################
shinyApp(ui = ui, server = server)

