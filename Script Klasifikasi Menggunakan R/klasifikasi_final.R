#library
library(tidyverse)

# Import Datasest
df <- read.csv("C:\\Users\\ROG\\Documents\\Tugas_Penelitian_Pak_Kodong\\gabungan_file_2.csv", header =  TRUE)

# Select column
df <- df %>% select(user_id, screen_name, created_at, source, location, text, retweet_count, favorite_count, lang)

# Lowecase all text
 df$text <- tolower(df$text)
 
 # select language english dan indonesia
 df <- df %>% filter(str_detect(lang, 'en|in'))
 
 # Klasifikai berdasarkan kolom text
 klasifikasiA <- df %>% filter(str_detect(text, 'wni|dokumen|#negaranelindungi|#covid19|#covid|#corona'))
 klasifikasiB <- df %>% filter(str_detect(text, 'hubungan diplomatik|hubungan bilateral|kerja sama|#inidiplomasi|#sahabatkemlu|#menluretno|#fmmarsudi|#rintiskemajuan|#batikdiplomacy|#indonesianway|#digitaldiplomacy|#diplomasikuliner'))
 klasifikasiC <- df %>% filter(str_detect(text, 'un|un / united nation|asean|kerjasama multilateral|rohingya|palestina|suriah|irak|isis|#indonesiauntukdunia|#counterterrorism|#diplomacyforpeaceandprosperity'))
 klasifikasiD <- df %>% filter(str_detect(text, 'papua|sawit|perbatasan|demokrasi indonesia|#balidemocracyforum'))
 
 # Menambahkan kolom untuk klasifikasi
 klasifikasiA$klasifikasi <- "A"
 klasifikasiB$klasifikasi <- "B"
 klasifikasiC$klasifikasi <- "C"
 klasifikasiD$klasifikasi <- "D"
 
 # menambahkan kolom baru untuk hasil jumlah retweet + like
 klasifikasiA$jumlah_rt_like <- klasifikasiA$retweet_count + klasifikasiA$favorite_count
 klasifikasiB$jumlah_rt_like <- klasifikasiB$retweet_count + klasifikasiB$favorite_count
 klasifikasiC$jumlah_rt_like <- klasifikasiC$retweet_count + klasifikasiC$favorite_count
 klasifikasiD$jumlah_rt_like <- klasifikasiD$retweet_count + klasifikasiD$favorite_count
 
 # Menambahkan kolom percent
 klasifikasiA$percent <- klasifikasiA$jumlah_rt_like/(max(klasifikasiA$jumlah_rt_like))*100
 klasifikasiB$percent <- klasifikasiB$jumlah_rt_like/(max(klasifikasiB$jumlah_rt_like))*100
 klasifikasiC$percent <- klasifikasiC$jumlah_rt_like/(max(klasifikasiC$jumlah_rt_like))*100
 klasifikasiD$percent <- klasifikasiD$jumlah_rt_like/(max(klasifikasiD$jumlah_rt_like))*100
 
 # menghilangkan decimal di kolom percent, supaya rapi
 klasifikasiA$percent <- lapply(klasifikasiA$percent, round, 0)
 klasifikasiB$percent <- lapply(klasifikasiB$percent, round, 0)
 klasifikasiC$percent <- lapply(klasifikasiC$percent, round, 0)
 klasifikasiD$percent <- lapply(klasifikasiD$percent, round, 0)

 View(klasifikasiA)
 max(klasifikasiA$jumlah_rt_like)
 