install.packages("C50")
install.packages("printr")
lokasi_kerja <- "D:/KULIAH/SEMESTER 3/DATA MINING/UAS/TBDataMining"
setwd(lokasi_kerja)
getwd()
#Dataset yang Digunakan
dataset <- read.csv("feverdengue.csv", sep=",")
#Deskripsi Dataset
View(dataset)
summary(dataset)
str(dataset)
#Menjadikan Kolom Keputusan / Faktor
dataset$station_avg_temp_c <- as.factor(dataset$station_avg_temp_c)
#Library yang Digunakan
library(C50)
library(printr)
#Membuat Model
model <- C5.0(station_avg_temp_c ~., data=datatesting)
#Melihat Hasil Model
model
summary(model)
#Gambar Model
plot(model)
#Membuat Dataset
datatesting <- dataset[1:7]
View(datatesting)
#Prediksi
predictions <- predict(model, datatesting)
#Bandingkan Hasil Prediksi dengan Dataset
table(predictions, dataset$year)
