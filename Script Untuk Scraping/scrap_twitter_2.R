#Crawling Data Menggunakan R


#Jika sudah pernah install sebelumnya, cukup running syntax berikut:
library(twitteR)
library(ROAuth)
library(RCurl)
library(expss)
library("dplyr")
library("tidyr")

#Download sertifikat dari curl
download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.pem")

#Meminta izin kepada twitter dengan meruning berikut:
reqURL <-"https://api.twitter.com/oauth/request_token"
accessURL <-"https://api.twitter.com/oauth/access_token"
CUSTOMER_KEY <- "m0dL9rqiA9u2Fy0fpdzlklcML"
CUSTOMER_SECRET <-"v7NsTOxEtG3OppWwIDfB7LcRCtl7gHLTPqIwmSuUk0bi1203ln"
ACCESS_TOKEN <- "538784946-jVMIlJtz1wKRk9wpAjQMRCwqy7VfEDuYoS5tezMk"
ACCESS_Secret <-"iRkYrIuaHZXOLPZQHPB2LXyaRVTXSvqyVWd29l567Gdb9"


#Men setup autorization
setup_twitter_oauth(CUSTOMER_KEY, CUSTOMER_SECRET, ACCESS_TOKEN, ACCESS_Secret)


#Tahap 2 Pengambilan Data dari Twitter
#Mengambil tweet tentang corona dengan filter language versi bahasa indonesia
search.string <-"#corona"
no.of.tweets <- 1000
kata_kunci <- list("kbridenhaag", "IndonesiaInCPH", "KBRI_Athena", "kbrimoskow", "kbrihelsinki",
                   "BRI_Paris", "IndonesiaInSto", "ndonesiaInPL", "BRIPraha", "BRIBerlin", "ndonesiainBern",
                   "BRIBudapest", "bri_baku", "KBRI__Roma", "briwina", "brioslo", "BRILondon", "KBRIMADRID",
                   "NAinLisbon", "indonesia_sk")


for (k in kata_kunci)
  {
  hasil.Tweets <- searchTwitter(k, n=no.of.tweets,lang="id",)
  df_id <- do.call("rbind", lapply(hasil.Tweets, as.data.frame))
  
  View(df_id)
  
  write.csv(df_id, 's.csv')
}
