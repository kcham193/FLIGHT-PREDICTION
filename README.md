# Can the Plane Fly? - README

## Overview
This Shiny application predicts whether a plane can fly based on weather conditions. The prediction is made using a Support Vector Machine (SVM) model trained on a dataset of historical weather data and flight outcomes.

## Prerequisites
Before running the application, ensure you have the following R packages installed:
- `shiny`
- `e1071`
- `randomForest`
- `shinythemes`

To install these packages, run:
```R
install.packages(c("shiny", "e1071", "randomForest", "shinythemes"))
```

## Dataset
The dataset used in this application includes the following features:
- `outlook`: Weather outlook (Sunny, Overcast, Rainy)
- `temperature`: Temperature in Fahrenheit
- `humidity`: Humidity percentage
- `windy`: Whether it is windy (TRUE or FALSE)
- `fly`: Whether the plane can fly (yes or no)

The dataset is hardcoded within the app and consists of 14 samples.

## How to Run the Application
1. Open RStudio or any R environment.
2. Ensure all necessary packages are installed.
3. Copy the entire code into an R script file (e.g., `app.R`).
4. Run the script. The Shiny application will launch in your default web browser.

## Application Interface
### Input Parameters
- **Outlook**: Select the weather outlook (Sunny, Overcast, Rainy).
- **Temperature**: Use the slider to select the temperature (64°F to 86°F).
- **Humidity**: Use the slider to select the humidity (65% to 96%).
- **Windy**: Select whether it is windy (Yes or No).
- **Submit Button**: Click to submit the input values and get the prediction.

### Output
- **Status/Output Text Box**: Displays the status of the calculation.
- **Prediction Results Table**: Displays the prediction result (yes or no) indicating whether the plane can fly under the given conditions.

## Model
The application builds an SVM model using the `e1071` package with a radial kernel to predict the flight status. The model is trained on the provided dataset and used to make predictions based on user input.

## Code Structure
- **UI**: Defined in the `ui` variable using `fluidPage`. It includes input fields, a submit button, and output areas.
- **Server**: Defined in the `server` function. It handles the logic for reading inputs, building the model, making predictions, and displaying the results.
- **Shiny App**: The `shinyApp` function combines the UI and server components to create the Shiny application.

## Debugging
For debugging purposes, the input data is printed to the console before making predictions. This can help ensure that the input values are correctly captured and processed.

## Example Usage
1. Select "Sunny" for outlook.
2. Set the temperature to 70°F.
3. Set the humidity to 90%.
4. Select "Yes" for windy.
5. Click "Submit".
6. The prediction result will be displayed in the "Prediction results table".

## Conclusion
This Shiny application provides an interactive interface to predict whether a plane can fly based on weather conditions using a machine learning model. It demonstrates the use of Shiny for building web applications in R and the application of SVM for classification tasks.

## CONTACTS
You may reach me through:
Email: kassimchambulilo@gmail.com
phone: +255 613 048 665
