source("ShinyStanModules/MODULES/UTILS/plotOptions.r", local = TRUE)
source("ShinyStanModules/MODULES/UTILS/report.r", local = TRUE)

# home tab
source("ShinyStanModules/MODULES/HOME/homepage.r", local = TRUE)
source("ShinyStanModules/MODULES/HOME/warnings.r", local = TRUE)

# diagnoses tab
source("ShinyStanModules/MODULES/DIAGNOSE/diagnoseHomepage.r", local = TRUE)

source("ShinyStanModules/MODULES/DIAGNOSE/divergentScatter.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/divergentTransitions.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/energy.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/treedepth.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/stepSize.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/parallelCoordinates.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/pairs.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/acceptance.r", local = TRUE)

source("ShinyStanModules/MODULES/DIAGNOSE/tracePlot.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/rankPlot.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/rhat_n_eff_se_mean.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/autoCorrelation.r", local = TRUE)

source("ShinyStanModules/MODULES/DIAGNOSE/statsTableHMC.r", local = TRUE)
source("ShinyStanModules/MODULES/DIAGNOSE/rhat_n_eff_se_mean_stats.r", local = TRUE)

# estimate tab
source("ShinyStanModules/MODULES/ESTIMATE/estimateHomepage.r", local = TRUE)

source("ShinyStanModules/MODULES/ESTIMATE/visualEstimate.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/scatterPlot.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/densityPlot.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/histogramPlot.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/intervalsPlot.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/areasPlot.r", local = TRUE)

source("ShinyStanModules/MODULES/ESTIMATE/numericalEstimate.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/summaryTable.r", local = TRUE)
source("ShinyStanModules/MODULES/ESTIMATE/summaryTableLatex.r", local = TRUE)

# more tab
source("ShinyStanModules/MODULES/MORE/about.r", local = TRUE)
source("ShinyStanModules/MODULES/MORE/modelCode.r", local = TRUE)
source("ShinyStanModules/MODULES/MORE/help.r", local = TRUE)


# Begin shinyUI -----------------------------------------------------------
# _________________________________________________________________________
tagList(
  tags$head(
    tags$script("src"="func.js")),
  tags$noscript(
    style = "color: orange; font-size: 30px; text-align: center;",
    "Please enable JavaScript to use ShinyStan."
  ), 
  shinyjs::useShinyjs(),
  includeCSS("css/ShinyStan.css"),
  
  navbarPage(
    tags$button(
      id = 'save_and_close_button',
      type = "button",
      class = "btn action-button",
      onclick = "window.close();",
      "Close"
    ), 
    id = "nav",
    position = "fixed-top",
    collapsible = TRUE,
    theme = shinythemes::shinytheme("flatly"),
    windowTitle = "ShinyStan",
    
    
    #### HOME ####
    tabPanel(
      title = strong(style = "color: #B2011D;", "ShinyStan"),
      value = "home",
      homepageUI("homepage")
    ),
    
    #### DIAGNOSE ####
    tabPanel(
      title = "Diagnose",
      icon = icon("medkit"),
      diagnoseUI("diagnoseHomepage")
    ),
    
    #### ESTIMATE ####
    tabPanel(
      title = "Estimate",
      icon = icon("stats", lib = "glyphicon"),
      estimateUI("estimateHomepage")
    ),
    navbarMenu(
      title = "More",
      
      #### model code ####
      tabPanel(
        title = "Model Code",
        modelCodeUI("modelCode")
      ),
      #### about ####
      tabPanel(
        title = "About",
        aboutUI("about")
      ),
      #### help ####
      tabPanel(
        title = "Help",
        helpUI("help")
      )
    )
    
  ) # End navbarPage
) # End tagList

# End shinyUI -------------------------------------------------------------
# -------------------------------------------------------------------------
