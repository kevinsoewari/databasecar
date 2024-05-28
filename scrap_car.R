message('Loading Packages')
library(devtools)
library(rvest)
library(tidyverse)
library(mongolite)
devtools::install_github("r-lib/conflicted")


url_audi<-"https://mobilbaru.mobil123.com/search/audi"
page_audi<-read_html(url_audi)

url_toyota<-"https://mobilbaru.mobil123.com/search/toyota"
page_toyota <-read_html(url_toyota)

url_honda<-"https://mobilbaru.mobil123.com/search/honda"
page_honda<-read_html(url_honda)

url_suzuki<-"https://mobilbaru.mobil123.com/search/suzuki"
page_suzuki<-read_html(url_suzuki)



audi_mobil<-page_audi %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "link-header", " " ))]//a') %>% 
  html_text() 

harga_audi <-page_audi %>% 
  html_elements(xpath = '//*[(@id = "show-results")]//*[contains(concat( " ", @class, " " ), concat( " ", "total-price", " " ))]') %>% 
  html_text() %>% 
  gsub("\n","",.) %>% 
  gsub("RP","",.)

tipe_audi <- page_audi %>%
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]') %>%
  html_text() %>%
  gsub("\n", "", .) %>%
  gsub("Body Type:", "", .)

engine_audi<-page_audi %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)]') %>%
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Engine:", "", .) %>% 
  gsub("- 2995 cc", "", .) %>%
  gsub("- 2894 cc", "", .) %>%
  gsub("cc", "", .) 

kapasitas_audi <-page_audi %>% 
  html_elements(xpath='//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 5) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Seat Capacity:", "", .)


toyota_mobil <- page_toyota %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "link-header", " " ))]//a') %>% 
  html_text()

harga_toyota <-page_toyota %>% 
  html_elements(xpath = '//*[(@id = "show-results")]//*[contains(concat( " ", @class, " " ), concat( " ", "total-price", " " ))]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("RP","",.)

tipe_toyota<-page_toyota %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Body Type:", "", .)

engine_toyota<-page_toyota %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Engine:", "", .) %>% 
  gsub("- 1200 cc", "", .) %>%
  gsub("- 1496 cc", "", .) %>%
  gsub("- 2500 cc", "", .) %>%
  gsub("cc", "", .)

kapasitas_toyota<-page_toyota %>% 
  html_elements(xpath='//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 5) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Seat Capacity:", "", .) %>% 
  gsub("- 5","",.)


honda_mobil<-page_honda %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "link-header", " " ))]//a') %>% 
  html_text()

harga_honda<-page_honda %>% 
  html_elements(xpath = '//*[(@id = "show-results")]//*[contains(concat( " ", @class, " " ), concat( " ", "total-price", " " ))]') %>% 
  html_text() %>% 
  gsub("RP","",.) %>% 
  gsub("\n","",.)

tipe_honda <-page_honda %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Body Type:", "", .)

engine_honda<-page_honda %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Engine:", "", .) %>% 
  gsub("- 1200 cc", "", .) %>%
  gsub("- 1498 cc", "", .) %>%
  gsub("- 1997 cc", "", .) %>%
  gsub("cc", "", .) 

kapasitas_honda<-page_honda %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 5) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Seat Capacity:", "", .) %>% 
  gsub(" - 7","",.)

suzuki_mobil<-page_suzuki %>% 
  html_elements(xpath='//*[contains(concat( " ", @class, " " ), concat( " ", "link-header", " " ))]//a') %>% 
  html_text()

harga_suzuki<-page_suzuki %>% 
  html_elements(xpath = '//*[(@id = "show-results")]//*[contains(concat( " ", @class, " " ), concat( " ", "total-price", " " ))]') %>% 
  html_text() %>% 
  gsub("RP","",.) %>% 
  gsub("\n","",.)

tipe_suzuki <-page_suzuki %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 1) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Body Type:", "", .)

engine_suzuki<-page_suzuki %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 3) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Engine:", "", .) %>%
  gsub("- 1500 cc", "", .) %>%
  gsub("cc", "", .) 

kapasitas_suzuki<-page_suzuki %>% 
  html_elements(xpath = '//*[contains(concat( " ", @class, " " ), concat( " ", "listing-specs-item", " " )) and (((count(preceding-sibling::*) + 1) = 5) and parent::*)]') %>% 
  html_text() %>% 
  gsub("\n", "", .) %>% 
  gsub("Seat Capacity:", "", .) %>% 
  gsub("- 8","",.)

nama_mobil <-c(audi_mobil,toyota_mobil,honda_mobil,suzuki_mobil)
harga_mobil<-c(harga_audi,harga_toyota,harga_honda,harga_suzuki)
tipe_mobil<-c(tipe_audi,tipe_toyota,tipe_honda,tipe_suzuki)
engine_mobil<-c(engine_audi,engine_toyota,engine_honda,engine_suzuki)
kapasitas_mobil<-c(kapasitas_audi,kapasitas_toyota,kapasitas_honda,kapasitas_suzuki)


mobil$harga_mobil[1]<-"7,500,000,000"
mobil$harga_mobil[11]<-"167,900,000"
mobil$harga_mobil[12]<-"1,150,000,000"
mobil$harga_mobil[13]<-"353,900,000"




#MONGODB
message('Input Data to MongoDB Atlas')
atlas_conn <- mongo(
  collection = Sys.getenv("ATLAS_COLLECTION"),
  db         = Sys.getenv("ATLAS_DB"),
  url        = Sys.getenv("ATLAS_URL")
)

atlas_conn$insert(mobil)
rm(atlas_conn)
