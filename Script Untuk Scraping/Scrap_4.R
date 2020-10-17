library("rtweet")
library(dplyr)

token <- create_token(
  app = "Reo Scrapping",
  consumer_key = "m0dL9rqiA9u2Fy0fpdzlklcML",
  consumer_secret = "v7NsTOxEtG3OppWwIDfB7LcRCtl7gHLTPqIwmSuUk0bi1203ln",
  access_token = "538784946-jVMIlJtz1wKRk9wpAjQMRCwqy7VfEDuYoS5tezMk",
  access_secret = "iRkYrIuaHZXOLPZQHPB2LXyaRVTXSvqyVWd29l567Gdb9")

first_account <- list("kbridenhaag")
users <- list("IndonesiaInCPH", "KBRI_Athena", "kbrimoskow", "kbrihelsinki",
              "KBRI_Paris", "IndonesiaInSto", "IndonesiaInPL", "KBRIPraha", "KBRIBerlin", "IndonesiainBern",
              "kbri_baku", "KBRI__Roma", "kbriwina", "kbrioslo", "KBRILondon", "KBRIMADRID",
              "INAinLisbon", "indonesia_sk", "KBRI_Beograd", "kbribxl", "KBRISarajevo", "kbrisofia", "indonesiazagreb",
              "INAinBucharest", "KBRIWashDC", "KBRI_Brasilia", "kbrisantiago", "KBRIMexicoCity",
              "KBRI_Beijing", "IdEmbassy_Seoul", "INAinPyongyang", "IndonesiaEmbVte", 
              "IndonesiaInBSB", "kbridili", "kbriportmoresby", "kbriphnompenh", "KBRI_NewDelhi", 
              "IndonesiaHanoi", "IndonesiaAnkara", "KBRI_Ottawa", "KBRIPanamaCity", "KbriHavana", 
              "KBRIBuenosAires", "kbri_caracas", "kbrilima", "IndonesiainCOL", "KbriParamaribo", "kbri_kyiv",
              "kbri_tashkent", "KbriYangon", "KBRI_Islamabad", "KBRITokyo", "IndonesiaDhaka", "KBRI_Manila",
              "kbrikualalumpur", "kbrisingapura", "KBRI_Bangkok")

for (awal in first_account){
  tweets <- get_timelines(awal, n=5)
  df = data.frame(lapply(tweets, as.character))
  for (account in users){
    hasil_tweet <- get_timelines(account, n=5)
    df_new <- data.frame(lapply(hasil_tweet, as.character))
    df <- rbind(df, df_new)
  }
  write.csv(df, file = "hasil_scrap_4.csv")
}

for (akun in users) {
  tweets <- get_timelines(akun, n=3200)
  df = data.frame(lapply(tweets, as.character))
}
write.csv(df, file = sprintf("%s.csv", akun))

# -------- List Akun yang ingin di scrap ----------
users <- list("kbridenhaag", "IndonesiaInCPH", "KBRI_Athena", "kbrimoskow", "kbrihelsinki",
              "KBRI_Paris", "IndonesiaInSto", "IndonesiaInPL", "KBRIPraha", "KBRIBerlin", "IndonesiainBern",
              "kbri_baku", "KBRI__Roma", "kbriwina", "kbrioslo", "KBRILondon", "KBRIMADRID",
              "INAinLisbon", "indonesia_sk", "KBRI_Beograd", "kbribxl", "KBRISarajevo", "kbrisofia", "indonesiazagreb",
              "INAinBucharest", "KBRIWashDC", "KBRI_Brasilia", "kbrisantiago", "KBRIMexicoCity")



