install.packages("DataExplorer")
library(DataExplorer)
install.packages("readxl")
library(readxl)
data_path<-"D:/TMU/CIND820/Datasets/GDP_and_Components.xlsx"
gdp_data<-read_excel(data_path,sheet = "Annual",skip = 6)
gdp_data<-gdp_data[-1,]
row.names(gdp_data)<-NULL
install.packages("dplyr")
library(dplyr)
gdp_data<-gdp_data %>%
  mutate_at(vars(-Indicator),as.numeric)
gdp_data[is.na(gdp_data)]<-0
head(gdp_data)
str(gdp_data)
create_report(gdp_data)
install.packages("readr")
library(readr)
write_csv(gdp_data, "D:/TMU/CIND820/Datasets/gdp_data.csv")


unemployment_data<-read.csv("D:/TMU/CIND820/Datasets/unemployment rate.csv")
head(unemployment_data)
str(unemployment_data)
summary(unemployment_data)
install.packages("janitor")
library(janitor)
unemployment_data<-unemployment_data %>%
  remove_empty(which="cols" )
unemployment_data<-unemployment_data[,!duplicated(as.list(unemployment_data))]
print(unemployment_data)
str(unemployment_data)
colSums(is.na(unemployment_data))
create_report(unemployment_data)
write_csv(unemployment_data, "D:/TMU/CIND820/Datasets/unemployment_data.csv")

cpi_data<-read.csv("D:/TMU/CIND820/Datasets/PRICES_CPI.csv")
head(cpi_data)
str(cpi_data)
summary(cpi_data)
colSums(is.na(cpi_data))
cpi_data<-cpi_data %>%
  remove_empty(which="cols")
cpi_data<-cpi_data[,!duplicated(as.list(cpi_data))]
create_report(cpi_data)
write_csv(cpi_data, "D:/TMU/CIND820/Datasets/cpi_data.csv")