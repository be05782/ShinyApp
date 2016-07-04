library(shiny)
shinyUI(
        pageWithSidebar(
                headerPanel("Assignment Data Products - Some tips about Belgium "),
                sidebarPanel(
                        h3("Q1.Complete the sentence of this well-known song (4 words)"),
                        textInput("fourwords", label="Avec infiniment de brumes à venir Avec le vent de l'Est écoutez-le tenir Le plat pays..."),
                        h3("Q2.complete the missing word of belgian motto"),
                        radioButtons("missingw",label="L'union fait la",c("No idea", "force", "farce", "pluie")),
                        h3("Q3.Which are exact?"),
                        checkboxGroupInput("misc",label="",choices=c("A.Belgium is a city"="A", "B.Le Plat Pays is a song of Jacques Brel"="B", "C.It rains a lot in Belgium"="C")),
                        h3("Q4.how old is the country ?"),
                        sliderInput("nby",label="Guess the age", value=0,min=100,max=200,step=2),
                        h3("Q5.Prediction of the part(%) of non belgian population in Brabant Wallon (belgium) "),
                        radioButtons("part",label="in 2020, according to the data 2010-2015 published in http://data.gov.be/en/node/17268,the part would be ",c(0,5,10,20)),
                        actionButton("go","GO!")
                ),
                mainPanel(
                        h3("Q1-check"),
                        h4("you entered"),
                        verbatimTextOutput("fourwords"),
                        h4("that's"),
                        verbatimTextOutput("check1"),
                        h3("Q2-check"),
                        h4("your choice :"),
                        verbatimTextOutput("missingw"),
                        h4(""),
                        verbatimTextOutput("check2"),
                        h3("Q3-check"),
                        h4(""),
                        verbatimTextOutput("check3"),
                        h4(""),
                        verbatimTextOutput("check3b"),
                        h3("Q4-check"),
                        h4(""),
                        verbatimTextOutput("check4"),
                        h3("Q5-check"),
                        h4("the correct answer is"),
                        verbatimTextOutput("check5"),
                        h4("Prediction for the next years"),
                        plotOutput("show5")
                )
        )
)



