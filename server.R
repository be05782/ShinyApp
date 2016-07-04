library(shiny)
library(lubridate)
library(forecast)
#consider brabant data (*age of foreign people) as a time serie annual
brabant<-data.frame(part=c(8.3,8.47,8.60,8.58,8.76,8.87,9.11,9.21,9.36,9.29))
brabant<-ts(brabant, start=c(2006,1), end=c(2015,1), frequency=1)
#the 4 missing words are "qui est le mien", the function is simply checking that when  the action button was pressed!
check1<-function(string,action = 0){
        answer<- "qui est le mien"
        if(action>=1) {string==answer}
}
#function checking that the radio button "force" was choosen
check2<-function(radiob,action = 0){
        answer<- "force"
        if(action>=1){
                 if(radiob==answer){
                    "correct!"
                 }
                else {"come on !"}
        }
}
#function checking that B and C boxes were checked.
check3<-function(l,action=0){
        answer<- c("B","C")
        if (action >=1){
        if(all(l == answer)){
                "correct!"
        }
        else {"Nope!"}
        }
}
#function to compute the age of Belgium (independant in 1850) and check the answer.
check4<-function(age,action = 0){
        answer<-year(Sys.time()) - 1850
        if (action >=1){
        if(age==answer){
                "correct!"
        }
        else {
                if(age<answer){
                        "older than that!"
                }
                else { "not that old!"}
        }
        }
}

check5<-function(percentage,action=0){
        if (action >= 1) {
                fit<-forecast(brabant)
                fit$mean[5]
        }
}
plotbrabant<-function(action = 0){
#consider brabant data (*age of foreign people) as a time serie annual and use forecast to predict next values

        if (action >= 1) {
        fit<-forecast(brabant,h=5)
        plot(fit)
        }
}
shinyServer(function(input,output){
        #display answers when the button "submit" is pressed.
        output$fourwords <-renderPrint({input$fourwords})
        output$missingw<-renderText({input$missingw})
        output$check1<-renderPrint({check1(input$fourwords,input$go)})
        output$check2<-renderPrint({check2(input$missingw,input$go)})
        output$check3<-renderPrint({check3(input$misc,input$go)})
        output$check3b<-renderPrint({input$misc})
        output$check4<-renderPrint({check4(input$nby,input$go)})
        output$check5<-renderPrint({check5(input$part,input$go)})
        output$show5<-renderPlot({plotbrabant(input$go)})
})
