library(rmarkdown)

# render("surveys-report.Rmd")
# Or you can type Rscript render-rmd.R in rstudio terminal

# Git basics, in case I forget
# git add
# git commit -m "message"
# git push

# render("surveys-report.Rmd", output_dir = "reports")

render("surveys-report.Rmd", output_dir = "reports", params = list(file = "data/plot1.csv"))