#library
library(tidyverse)

# Import Datasest
df <- read.csv("C:\\Users\\ROG\\Documents\\Tugas_Penelitian_Pak_Kodong\\gabungan_file_2.csv", header =  TRUE)

df <- df %>% select(user_id, screen_name, created_at, source, location, text, retweet_count, favorite_count, lang)
View(df)