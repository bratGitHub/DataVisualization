dashboardPage(
      dashboardHeader(
          title = "Analisis Kendaraan Bekas"
      ), # akhir dashboardHeader  

      dashboardSidebar(
          tags$style("
              .main-header .navbar {
                  margin-left: 275px;
              }
            
              .main-header .logo {
                  width: 275px;
              }
          "), # akhir tags
         
          width = "275px",
          sidebarMenu(
                      menuItem(text = "Introduksi",
                               tabName = "page1",
                               icon = icon("lightbulb")
                      ), #akhir menuItem
                      menuItem(text = "Analitik",
                               tabName = "page2",
                               icon = icon("chart-bar")
                      ), #akhir menuItem
                      menuItem(text = "Dataset",
                               tabName = "page3",
                               icon = icon("table"),
                               badgeLabel = "Orisinal",
                               badgeColor = "red"
                      ) #akhir menuItem
          ) # akhir sidebarMenu
      ), # akhir dashboardSidebar

      dashboardBody(
          tags$head(tags$style(
                        HTML("
                            .form-group, .selectize-control {
                                margin-bottom: 0px;
                            }
                            .box-body {
                                padding-bottom: 0px;
                            }
                        ") # akhir HTML
                   ) # akhir tags 
          ), # akhir head
          
          tabItems(
              # isi dari page 1
              tabItem(tabName = "page1",
                  fluidPage(
                      # baris pertama
                      fluidRow(
                          box(width = 6, status = "primary",
                              selectInput("si_EuroBr1", "Merek Kendaraan Eropa", 
                                          c("Audi", "BMW", "Mercedes-Benz", "Porsche", "Volkswagen"),
                                          multiple = FALSE,
                                          selected = "Audi") 
                          ), # akhir box
                          box(width = 6, status = "primary",
                              selectInput("si_JapanBr1", "Merek Kendaraan Jepang", 
                                          c("Daihatsu", "Honda", "Mazda", "Suzuki", "Toyota"),
                                          multiple = FALSE,
                                          selected = "Daihatsu") 
                          ) # akhir box                                   
                      ), # akhir fluidRow

                      # baris kedua
                      fluidRow(
                          box(width = 6,
                              title = span(icon("chart-pie"), "Populasi Kendaraan Eropa"),
                              status = "primary",
                              fluidRow(
                                  column(6,
                                      valueBoxOutput("vb_Euro1", width = 10)
                                  ), # akhir column
                                  column(6,
                                      valueBoxOutput("vb_EuroBr1", width = 10)       
                                  ) # akhir column
                              ) # akhir fluidRow
                              
                          ), #akhir box    
                        
                          box(width = 6, 
                              title = span(icon("chart-pie"), "Populasi Kendaraan Jepang"),
                              status = "primary",
                              fluidRow(
                                 column(6,
                                        valueBoxOutput("vb_Japan1", width = 10)
                                 ), # akhir column
                                 column(6,
                                        valueBoxOutput("vb_JapanBr1", width = 10)       
                                 ) # akhir column
                              ) # akhir fluidRow
                          ) # akhir box     
                        
                      ), # akhir fluidRow
                    
                      # baris ketiga
                      fluidRow(
                          box(width = 6, status = "primary",
                              fluidRow(
                                 column(6,
                                     radioButtons("rb_EuroTr1", "Jenis Transmisi",
                                                  c("Manual" = "Manual",
                                                    "Otomatis" = "Automatic",
                                                    "Manual Atau Otomatis" = "")
                                     ) # akhir radio button
                                 ), # akhir column
                                 column(6,
                                     valueBoxOutput("vb_EuroBrTr1", width = 10)
                                 ) # akhir column
                              ), # akhir fluidRow
                              fluidRow(style="height:1vh"),
                              plotlyOutput("plot1a")
                          ), # akhir box
                          
                          box(width = 6, status = "primary",
                              fluidRow(
                                 column(6,
                                        radioButtons("rb_JapanTr1", "Jenis Transmisi",
                                                     c("Manual" = "Manual",
                                                       "Otomatis" = "Automatic",
                                                       "Manual Atau Otomatis" = "")
                                        ) # akhir radio button
                                 ), # akhir column
                                 column(6,
                                        valueBoxOutput("vb_JapanBrTr1", width = 10)
                                 ) # akhir column
                              ), # akhir fluidRow
                              fluidRow(style="height:1vh"),
                              plotlyOutput("plot1b")
                          )
                     ),
                    
                     # baris keempat
                     fluidRow(
                         box(width = 6, status = "primary"
                             
                         ), # akhir box
                        
                         box(width = 6, status = "primary"
                             
                         ) # akhir box
                     ) # akhir fluidRow
                 ) # akhir fluidPage
          ), # akhir tabItem 0
        
          # isi dari page 2
          tabItem(tabName = "page2",
              fluidPage(
                  # baris pertama
                  fluidRow(
                      box(width = 6, status = "primary",
                          selectInput("si_EuroBr2", "Merek Kendaraan Eropa", 
                                      c("Audi", "BMW", "Mercedes-Benz", "Porsche", "Volkswagen"),
                                      multiple = FALSE,
                                      selected = "Audi") 
                      ), # akhir box
                      box(width = 6, status = "primary",
                          selectInput("si_JapanBr2", "Merek Kendaraan Jepang", 
                                      c("Daihatsu", "Honda", "Mazda", "Suzuki", "Toyota"),
                                      multiple = FALSE,
                                      selected = "Daihatsu")
                      ) # akhir box                                   
                  ), # akhir fluidRow
                  
                  # baris kedua
                  fluidRow(
                      box(width = 6, 
                          title = "Populasi Kendaraan Eropa", icon = icon("chart-pie"),
                          status = "primary",
                          fluidRow(
                             column(6,
                                 valueBoxOutput("vb_Euro2", width = 10)      
                             ), # akhir column
                             column(6,
                                 valueBoxOutput("vb_EuroBr2", width = 10)      
                             ) # akhir column
                          ) # akhir fluidRow
                      ), #akhir box    
                      
                      box(width = 6, 
                          title = "Populasi Kendaraan Jepang", icon = icon("chart-pie"),
                          status = "primary",
                          fluidRow(
                             column(6,
                                    valueBoxOutput("vb_Japan2", width = 10)      
                             ), # akhir column
                             column(6,
                                    valueBoxOutput("vb_JapanBr2", width = 10)      
                             ) # akhir column
                          ) # akhir fluidRow
                      ) # akhir box     
                  ), # akhir fluidRow
                  
                  # baris ketiga
                  fluidRow(
                      # kendaraan Eropa
                      box(
                          h4("Kombinasi Faktor"), status = "primary",
                          fluidRow(
                              column(4,
                                  radioButtons("rb_EuroTr2", "Jenis Transmisi",
                                               c("Manual" = "Manual",
                                                 "Otomatis" = "Automatic")
                                  ) # akhir radio button
                              ), # akhir column
                              column(4,
                                  radioButtons("rb_EuroCol2", "Warna",
                                               c("Hitam" = "Hitam",
                                                 "Putih" = "Putih")
                                  ) # akhir radio button
                              ), # akhir column
                              column(4,
                                  radioButtons("rb_EuroAge2", "Usia",
                                               c("Muda (<= 3 th)" = "Low",
                                                 "Sedang (>3 th & <= 10 th)" = "Medium",
                                                 "Tua (> 10 th)" = "High")
                                  ) # akhir radio button
                              ) # akhir column
                          ), # akhir fluidRow 
                          fluidRow(
                              column(12,
                                  plotlyOutput("plot2a", width = "96%")
                              ) # akhir column
                          ) # akhir fluidRow                                
                      ), # akhir box
                      
                      # kendaraan Jepang
                      box(
                          h4("Kombinasi Faktor"), status = "primary",
                          fluidRow(
                              column(4,
                                     radioButtons("rb_JapanTr2", "Jenis Transmisi",
                                                  c("Manual" = "Manual",
                                                    "Otomatis" = "Automatic")
                                    ) # akhir radio button
                              ), # akhir column
                              column(4,
                                     radioButtons("rb_JapanCol2", "Warna",
                                                  c("Hitam" = "Hitam",
                                                    "Putih" = "Putih")
                                    ) # akhir radio button
                              ), # akhir column
                              column(4,
                                    radioButtons("rb_JapanAge2", "Usia",
                                                 c("Muda (<= 3 th)" = "Low",
                                                   "Sedang (>3 th & <= 10 th)" = "Medium",
                                                   "Tua (> 10 th)" = "High")
                                    ) # akhir radio button
                              ) # akhir column
                          ), # akhir fluidRow
                          fluidRow(
                             column(12,
                                    plotlyOutput("plot2b", width = "96%")
                             ) # akhir column
                          ) # akhir fluidRow
                      ) # akhir box
                  ), # akhir fluidRow
                  
                  # baris keempat
                  fluidRow(
                      box(width = 6, status = "primary",
                          sliderInput("sl_Euro2", "Jarak tempuh (dalam ribuan):", 1, 2000, 25)
                      ), # akhir box
                        
                      box(width = 6, status = "primary",
                          sliderInput("sl_Japan2", "Jarak tempuh (dalam ribuan):", 1, 5000, 25)
                      ) # akhir box
                  ) # akhir fluidRow
              ) # akhir fluidPage      
          ), #akhir tabItem 0
          
          # isi dari page 3
          tabItem(tabName = "page3",
              fluidPage(
                  fluidRow(
                      box(width = 12,
                          DT::dataTableOutput("data_inter")
                      ) # akhir box
                  ), # akhir fluidRow
                  fluidRow(
                      box(width = 5,
                          title = span(icon("table"), "Sumber Data"),
                          h5("Data dalam proyek ini diambil dari data harga mobil bekas per Juli 2020 yang disimpan di AtapData.ai."),
                          h5("Untuk keperluan pembahasan, hanya sebagian kecil merek kendaraan yang digunakan."),
                          h5("Jika Anda tertarik dengan data aslinya, silakan mengunjungi AtapData.ai dan mengakses"), 
                          h5("data tersebut melalui alamat berikut: https://atapdata.ai/dataset/231/harga_mobil_bekas"),
                          h5("Sebagai catatan, usia kendaraan dihitung dari tahun 2020 sebagai patokan."),
                          h5("Dengan demikian, sebuah kendaraan VW yang diiklankan dan diproduksi tahun 2012 akan dicatat berusia 8 tahun."),
                          h5("Sedangkan sebuah kendaraan Toyota Kijang warna putih yang diproduksi tahun 1990 akan dicatat berusia 30 tahun.")
                      ) # akhir box
                  ) # akhir fluidRow
              ) # akhir fluidPage
          ) # akhir tabItem
      ) # akhir tabItems    
    
   ) # akhir dashboardBody
) # akhir dashboardPage