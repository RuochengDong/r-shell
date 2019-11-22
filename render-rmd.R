library(rmarkdown)
library(stringr)
# render("surveys-report.Rmd")
# Or you can type Rscript render-rmd.R in rstudio terminal

# Git basics, in case I forget
# git add
# git commit -m "message"
# git push

# render("surveys-report.Rmd", output_dir = "reports")

# render("surveys-report.Rmd", output_dir = "reports", params = list(file = "data/plot1.csv"))

# file_names = commandArgs(trailingOnly = TRUE)
# render("surveys-report.Rmd", output_dir = "reports", params = list(file = file_names))
# This need you to specify the file name you want to use
# Rscript render-rmd.R data/complete_surveys.csv

# file_names = commandArgs(trailingOnly = TRUE)
# for (file in file_names) {
#   render("surveys-report.Rmd", output_dir = "reports", params = list(file = file))
# }
# Rscript render-rmd.R data/plot1.csv data/plot2.csv


file_names = commandArgs(trailingOnly = TRUE)
for (file in file_names) {
  out_name <- str_split_fixed(string = file, pattern = "[/|.]", n =3)
  out_name <- str_c(out_name[2], ".html")
  render("surveys-report.Rmd", output_file = out_name, output_dir = "reports", params = list(file = file))
}


