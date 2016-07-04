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
                        radioButtons("part",label="in 2020, the part would be ",c(0,5,10,20)),
                        actionButton("go","GO!")
                ),
                mainPanel(tabsetPanel(
                        tabPanel("answers",
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
                                plotOutput("show5")),
                        tabPanel("documentation", 
                                 h1("This is just a little quiz about Belgium"),
                                 h3("Q1-  enter the 4 missing words of this song. If you have no idea get there http://lyricstranslate.com/en/le-plat-pays-flat-land.html"),
                                 h3("Q2 - like all country, Belgium has a motto, there is one word missing (it is the french word for -strenght-"),
                                 h3("Q3 - just check the boxes containing true lies about belgium"),
                                 h3("Q4 - move the circle on the slider to indicate the age of Belgium"),
                                 h3("Q5 - just guess, then the app will display a prediction based on open data published in http://data.gov.be/en/node/17268")
                                 ))
                )
        )
)



