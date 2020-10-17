library("rtweet")
library(dplyr)

token <- create_token(
  app = "Twitter Scrapping",
  consumer_key = "m0dL9rqiA9u2Fy0fpdzlklcML",
  consumer_secret = "v7NsTOxEtG3OppWwIDfB7LcRCtl7gHLTPqIwmSuUk0bi1203ln",
  access_token = "538784946-jVMIlJtz1wKRk9wpAjQMRCwqy7VfEDuYoS5tezMk",
  access_secret = "iRkYrIuaHZXOLPZQHPB2LXyaRVTXSvqyVWd29l567Gdb9")

first_account <- list("IndonesiaHanoi")
users <- list('KBRITokyo', 'IndonesiaInPL', 'KBRI_NewDelhi', 'kbrikualalumpur', 'kbrilima',
              'kbrimoskow', 'KBRI_Bangkok', 'KBRI_Ottawa', 'KBRI_Islamabad', 'KBRIMexicoCity', 'KBRIWashDC', 'kbribxl',
              'IndonesiaInCPH', 'KBRI_Beijing', 'kbriwina', 'KBRI_Beograd', 'KBRI_Athena', 'kbrisantiago',
              'indonesia_sk', 'INAinBucharest', 'KBRI_Paris', 'kbrioslo', 'KBRI__Roma', 'IndonesiaAnkara', 'kbrihelsinki',
              'IndonesiaInBSB', 'KBRI_Brasilia', 'kbriphnompenh', 'IndonesiaInSto', 'kbridili', 'kbriportmoresby',
              'IndonesiainBern', 'KBRILondon', 'KBRIPraha', 'KBRIBuenosAires', 'IndonesiaDhaka', 'KBRIMADRID',
              'kbri_kyiv', 'KBRIPanamaCity', 'kbri_baku', 'INAinPyongyang', 'KBRI_Manila', 'KBRISarajevo', 'kbri_tashkent',
              'kbrisofia', 'IdEmbassy_Seoul', 'kbridenhaag', 'IndonesiainCOL', 'kbrisingapura')

for (awal in first_account){
  tweets <- get_timelines(awal, n=3200)
  df = data.frame(lapply(tweets, as.character))
  for (account in users){
    hasil_tweet <- get_timelines(account, n=3200)
    df_new <- data.frame(lapply(hasil_tweet, as.character))
    df <- rbind(df, df_new)
  }
  write.csv(df, file = "hasil_scrap_4.csv")
}


