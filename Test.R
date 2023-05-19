library(shiny)
library(shinydashboard)
library(DT)


ui <- dashboardPage(
  dashboardHeader(),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    tabItem(tabName = "signup",
            fluidRow(
              # box(textInput("name",  "이름"),
              #     textInput("gender",  "이름"),
              #     selectInput("college", "대학",
              #                 choices = list("간호대학", "경영대학",
              #                                "공과대학", "농업생명과학대학",
              #                                "미술대학", "법과대학",
              #                                "사범대학", "사회과학대학",
              #                                "수의과대학", "생활과학대학",
              #                                "약학대학", "음악대학",
              #                                "인문대학", "의과대학",
              #                                "자연과학대학", "기타"),
              #                 selected = 1),
              #     selectInput("team", "교내 소속축구팀",
              #                 choices = list("싸커21", "아르마다",
              #                                "에코플러스", "아크로",
              #                                "P.O.S", "공대",
              #                                "자연대", "관악사",
              #                                "농대축구부 휘모리", "지오싸카스",
              #                                "새츠", "샥스",
              #                                "FC SEES", "Cells United",
              #                                "프리템포", "남풍",
              #                                "없음")),
              #     textInput("score", "점수"),
              #     actionButton("click_counter","Submit")),
              box(DT::dataTableOutput("nText"),
                title = tags$h4("Component 2", style = "text-align: center; font-size: 18px; font-weight: bold;"),
                width = 18,
                style = "overflow-x: scroll;",  # 添加 CSS 样式以启用水平滚动
                tags$div(
                  style = "white-space: nowrap;",  # 添加 CSS 样式以防止换行
                  tags$ul(
                    style = "list-style-type: none; padding: 0; margin: 0;",
                  )
                )
              )
            )
    )))

server <- shinyServer(function(input, output, session) {
  cwurData <- read.csv("data/school_data/cwurData.csv")
  values<- reactiveValues(df = cwurData) 
  #values$df<- data.frame()
  
  observeEvent(input$click_counter, {
    name<- input$name
    gender<- input$gender
    college<- input$college
    team<- input$team
    score<- as.numeric(input$score)
    rank<- 0
    
    new_row<- data.frame(rank,name,college,gender,team,score)
    
    values$df<- rbind(values$df, new_row)
    values$df<- values$df[order(values$df$score,decreasing=TRUE),]
    #print(values$df)
    values$df$rank<- 1:nrow(values$df) 
  })
  
  output$nText<- renderDataTable({
    datatable(values$df, options = list(orderClasses = TRUE,lengthMenu = c(5, 10, 30), pageLength = 5))})
})

shinyApp(ui = ui, server = server)