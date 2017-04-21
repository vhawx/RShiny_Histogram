library(XLConnect)
library(shiny)
#poke <- readWorksheetFromFile("Pokemon.xlsx", sheet = 1)
#dir.create("03PokemonApp2")

ui <- fluidPage("Pokemon App",
                sliderInput(inputId = "sliderVal", label = "Select value", 
                            min = 0, max = 20, value = 10, step = 1, ticks = TRUE),
                plotOutput(outputId = "pokePlot", width = "100%", height = "400px")
)
server <- function(input, output) {
  output$pokePlot <- renderPlot({
    title <- "Histogram of Attack Points"
    hist(poke$Attack, main = title, breaks = input$sliderVal)
  })
}

shinyApp(ui = ui, server = server) 
