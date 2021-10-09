# global: pustaka fungsi yang digunakan dalam proyek Capstone
library(shiny)
library(shinydashboard)
library(dplyr)
library(tidyverse)
library(ggplot2)
library(plotly)
library(glue)
library(scales)
library(DT)

euroCars_Brand = c("Audi", "BMW", "Mercedes-Benz", "Porsche", "Volkswagen")
japanCars_Brand = c("Daihatsu", "Honda", "Mazda", "Suzuki", "Toyota")

data_usedCars <- read_csv("data_input/cars_train_new.csv")
data_usedCars <- na.omit(data_usedCars)

# seleksi kolom dan filter baris terentu 
data_usedCars_selected <- data_usedCars %>% 
    subset(select = -c(id, title, image))
    #dplyr::filter(brand %in% euroCars_Brand | brand %in% japanCars_Brand)

data_usedCars_selected <- data_usedCars_selected %>%
    mutate(age = 2020 - year,
         age_Cat = if_else(2020-year<=3, "Low", 
                       if_else(2020-year>3 & 2020-year<=10, "Medium", "High"))
                   ) # akhir if

# seleksi kendaraan Eropa dan Jepang 
 data_usedCars_EuroJapan <- data_usedCars_selected %>%   
     dplyr::filter(brand %in% euroCars_Brand |
            brand %in% japanCars_Brand)

# pisahkan data kendaraan buatan Eropa dan Jepang
data_usedCars_Euro <- data_usedCars_selected %>%   
    filter(brand %in% euroCars_Brand)
data_usedCars_Japan <- data_usedCars_selected %>%   
    filter(brand %in% japanCars_Brand)

# dataset dengan kolom terbatas: merek, transmisi, warna, usia dan harga
data_usedCars_Euro_Sel <- dplyr::select(data_usedCars_Euro,
                                        c("brand","transmission", "color",
                                          "age", "age_Cat","mileage", "price")
                                 ) # akhir select

data_usedCars_Japan_Sel <- dplyr::select(data_usedCars_Japan, 
                                         c("brand","transmission", "color",
                                           "age", "age_Cat", "mileage", "price")
                                  ) # akhir select



