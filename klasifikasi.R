#library
library(tidyverse)

# Import Datasest
df <- read.csv("C:\\Users\\ROG\\Documents\\Hasil Scrap Twitter\\gabungan_file.csv", header =  TRUE)

# Klasifikai berdasarkan kolom text
klasifikasiA <- df %>% filter(str_detect(text, 'WNI|Dokumen|#NegaraMelindungi|#Covid19'))
klasifikasiB <- df %>% filter(str_detect(text, 'Hubungan Diplomatik|Hubungan Bilateral|Kerja sama|#IniDiplomasi|#SahabatKemlu|#MenluRetno|#FMMarsudi|#RintisKemajuan|#BatikDiplomacy|#IndonesianWay|#DigitalDiplomacy|#DiplomasiKuliner'))
klasifikasiC <- df %>% filter(str_detect(text, 'UN / United Nation|ASEAN|Kerjasama Multilateral|Rohingya|Palestina|Suriah|Irak|ISIS|#IndonesiaUntukDunia|#CounterTerrorism|#DiplomacyforPeaceandProsperity'))
klasifikasiD <- df %>% filter(str_detect(text, 'Papua|Sawit|Perbatasan|Demokrasi Indonesia|#BaliDemocracyForum'))

# Jumlah Data hasil klasifikasi
cat("Jumlah data klasifikasi A:", dim(klasifikasiA)[1], "\n")
cat("Jumlah data klasifikasi B:", dim(klasifikasiB)[1], "\n")
cat("Jumlah data klasifikasi C:", dim(klasifikasiC)[1], "\n")
cat("Jumlah data klasifikasi D:", dim(klasifikasiD)[1])

# Jumlah retweet dan like masing masing klasifikasi
cat("Jumlah retweet klasifikasi A:", sum(klasifikasiA$retweet_count), "\n")
cat("Jumlah like klasifikasi A:", sum(klasifikasiA$favorite_count), "\n")
cat("Jumlah retweet klasifikasi B:", sum(klasifikasiB$retweet_count), "\n")
cat("Jumlah like klasifikasi B:", sum(klasifikasiB$favorite_count), "\n")
cat("Jumlah retweet klasifikasi C:", sum(klasifikasiC$retweet_count), "\n")
cat("Jumlah like klasifikasi C:", sum(klasifikasiC$favorite_count), "\n")
cat("Jumlah retweet klasifikasi D:", sum(klasifikasiD$retweet_count), "\n")
cat("Jumlah like klasifikasi D:", sum(klasifikasiD$favorite_count))
