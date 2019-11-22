library(rmarkdown)
library(stringr)
# render("surveys-report.Rmd")
# Or you can type Rscript render-rmd.R in rstudio terminal

# Git basics, shell basics, in case I forget
# git add
# git commit -m "message"
# git push
# *.csv to represent all csv file

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

if ("-a" %in% file_names){
  folder = file_names[2]
  file_names = Sys.glob(str_c(folder, "/*.csv"))

  if(length(file_names == 0)) {
    print ("No files found in the specified folder")
  }
  
} else {file_names = file_names}

if(length(file_names) == 0){
  print("Please provid list of .csv files.
         To specify all .csv files, use -a and a data directory as input")
}
for (file in file_names) {
  out_name <- str_split_fixed(string = file, pattern = "[/|.]", n =3) # split data file name into 3 parts by / | and .
  out_name <- str_c(out_name[2], ".html")
  render("surveys-report.Rmd", output_file = out_name, output_dir = "reports", params = list(file = file))
}

# Rscript render-rmd.R -a data

