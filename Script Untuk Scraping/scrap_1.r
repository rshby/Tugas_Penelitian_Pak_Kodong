#import library
library("rtweet")
library("dplyr")
library("tidyr")

keyword <- "@kbridenhaag"
jumlahtweet <- 5000
type <- "recent"
bahasa <- "en" && "id"
retweet <- TRUE

token <- create_token(
  app = "Reo Scrapping",
  consumer_key = "m0dL9rqiA9u2Fy0fpdzlklcML",
  consumer_secret = "v7NsTOxEtG3OppWwIDfB7LcRCtl7gHLTPqIwmSuUk0bi1203ln",
  access_token = "538784946-jVMIlJtz1wKRk9wpAjQMRCwqy7VfEDuYoS5tezMk",
  access_secret = "iRkYrIuaHZXOLPZQHPB2LXyaRVTXSvqyVWd29l567Gdb9")

crawling <- search_tweets(
  keyword,
  n = jumlahtweet,
  include_rts = retweet,
  type = type,
  lang = bahasa,
  retryonratelimit = FALSE
)

#save to cvs
write.table()

