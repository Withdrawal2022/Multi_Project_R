#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

library(shiny)
library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "选择框传入参数"),
  dashboardSidebar(
    # 定义选择框
    selectInput("variable",  # 传入变量名称
                "Ranking Type：", # 提示文字
                # 选项内容，左边是显示字符，右边是传入变量名称，若是向量传递则字符与变量相同
                list("CWUR" = "cyl",  
                     "ARWU" = "am", # 列表传递，可以修改显示
                     "THE" = "gear",
                     "Romanian"= "",
                     "EduExp"="")
    )
    # 定义勾选框
    # checkboxInput("outliers",  # 传入变量名称
    #               "显示离群值", # 勾选框提示文字
    #               FALSE  # 默认状态
    # )
  ),
  dashboardBody(
    fluidRow(
      box(
        plotOutput("mpgPlot"), # 以图片形式输出mpgPlot变量
        title = h3(textOutput("caption")) # 以三级标题形式输出caption变量
      )
    )
  )
)




