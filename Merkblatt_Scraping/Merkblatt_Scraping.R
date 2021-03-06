
# This script automates the the process of passing html files 
# into the jekyll system. Its done for the handbook for infectious diseases


library(rmarkdown)
library(knitr)
library(tidyverse)


# Unzip the file
zipfiles <- list.files(".", pattern = ".zip$")
unzip(zipfiles[1])

file.remove("./Merkblätter/Textbausteine.docx")

files <- list.files(".", pattern = ".docx$", recursive = TRUE)
files <- files[!grepl("*99 alte Merk*", x = files)]
files <- files[!grepl("*01 ", x = files)]
files <- files[!grepl("*02 Rohversion*", x = files)]

# a <- files[12]

# loop through all files
for (a in files) {
  
  titlename <- as.character(strsplit(strsplit(a, "[////]")[[1]][3], "[\\.]")[[1]][1])
  status <- strsplit(a, "[////]")[[1]][2]
  
  newfilename <- paste0(titlename, ".md")
  
  # remove the old file if it exists
  if (file.exists(newfilename)) file.remove(newfilename)
  
  # the new file is created line by line. This is where the jekyll front matter is included
  write("---", newfilename)
  write("layout: merkblatt", file = newfilename, append = T)
  write(paste("title:", titlename), newfilename, append = T)
  write(paste("status:", status), newfilename, append = T)
  write(paste("output:"), newfilename, append = T)
  write(paste("  pdf_document:"), newfilename, append = T)
  write(paste("    highlight: zenburn"), newfilename, append = T)
  write("---", newfilename, append = T)
  # write(paste("Entwurfstatus:", status), newfilename, append = T)
  write(paste(" "), newfilename, append = T)
  pandoc_convert(paste0(getwd(),"/", a), to = "gfm", output = paste0("../../intermediate"))
  write(readLines("intermediate"), newfilename, append = TRUE )
  
  file.remove("intermediate")
  
}

# Removing all md-files in docs folder
oldfiles <- list.files("../_merkblaetter/", pattern = ".md$")
for(i in oldfiles){
  file.remove(paste0("../_merkblaetter/", i))
}

# Copying all md-files to the docs folder
pics <- list.files(".", pattern = ".md$")
for (i in pics) {
  file.copy(i, paste0("../_merkblaetter/", i), overwrite = TRUE)
  file.remove(i)
}


test <- pics[2]
test2 <- paste0("../_merkblaetter/", test)

render(input="Brucellose.md", pdf_document(highlight="espresso", template="/usr/share/pandoc/data/templates/merkblatt.latex"))

