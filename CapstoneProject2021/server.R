# server function
function(input, output) {
        # page 1
        # perhitungan total banyak kendaraan Eropa
        nb_Euro_Total1 <- data_usedCars_Euro %>% nrow()  
        output$vb_Euro1 <- renderValueBox({
            valueBox(
                value = nb_Euro_Total1, 
                subtitle = "Total Kendaraan", 
                icon = icon("car"),
                width = 6, 
                color = "teal",
                href = NULL                
            )
        }) # akhir renderValueBox
        
        output$vb_EuroBr1 <- renderValueBox({
            nb_Euro_Br1 <- data_usedCars_Euro %>%
                          dplyr::filter(brand == input$si_EuroBr1,
                                        if (input$rb_EuroTr1!="") 
                                            transmission==input$rb_EuroTr1
                                        else 
                                            (transmission=="Manual" | transmission=="Automatic")
                                       ) %>% nrow()
                
            valueBox(
                value = percent(nb_Euro_Br1/nb_Euro_Total1, accuracy=0.01), 
                subtitle = paste("Persentase ", input$si_EuroBr1), 
                icon = icon("car"),
                width = 6, 
                color = "yellow",
                href = NULL
            ) # akhir valueBox
        }) # akhir renderValueBox
        
        output$vb_EuroBrTr1 <- renderValueBox({
                nb_Euro_BrTr1 <- data_usedCars_Euro %>%
                        dplyr::filter(if (input$rb_EuroTr1!="") 
                                          transmission==input$rb_EuroTr1
                                      else 
                                          (transmission=="Manual" | transmission=="Automatic")
                        ) %>% nrow()
                
                valueBox(
                        value = nb_Euro_BrTr1, 
                        subtitle = "Total Per Transmisi", 
                        icon = icon("car"),
                        width = 6, 
                        color = "aqua",
                        href = NULL
                ) # akhir valueBox
        }) # akhir renderValueBox        

        # perhitungan total banyak kendaraan Jepang
        nb_Japan_Total1 <- data_usedCars_Japan %>% nrow()
        output$vb_Japan1 <- renderValueBox({
            valueBox(
                value = nb_Japan_Total1, 
                subtitle = "Total Kendaraan", 
                icon = icon("car"),
                width = 6, 
                color = "teal",
                href = NULL
            ) # akhir valueBox
        }) # akhir renderValueBox
        
        output$vb_JapanBr1 <- renderValueBox({
                nb_Japan_Br1 <- data_usedCars_Japan %>%
                        dplyr::filter(brand == input$si_JapanBr1,
                                      if (input$rb_JapanTr1!="") 
                                          transmission==input$rb_JapanTr1
                                      else 
                                          (transmission=="Manual" | transmission=="Automatic")
                                     ) %>% nrow()
                
                valueBox(
                        value = percent(nb_Japan_Br1/nb_Japan_Total1, accuracy=0.01), 
                        subtitle = paste("Persentase ", input$si_JapanBr1), 
                        icon = icon("car"),
                        width = 6, 
                        color = "yellow",
                        href = NULL
                ) # akhir valueBox
        }) # akhir renderValueBox
        
        output$vb_JapanBrTr1 <- renderValueBox({
                nb_Japan_BrTr1 <- data_usedCars_Japan %>%
                        dplyr::filter(if (input$rb_JapanTr1!="") 
                                transmission==input$rb_JapanTr1
                                else 
                                        (transmission=="Manual" | transmission=="Automatic")
                        ) %>% nrow()
                
                valueBox(
                        value = nb_Japan_BrTr1, 
                        subtitle = "Total Per Transmisi", 
                        icon = icon("car"),
                        width = 6, 
                        color = "aqua",
                        href = NULL
                ) # akhir valueBox
        }) # akhir renderValueBox 
        
        # menampilkan plot kendaraan Eropa
        output$plot1a <- 
                renderPlotly({
                        usedCars_Euro_Br_Selected <- data_usedCars_Euro %>%
                                filter(if (input$rb_EuroTr1!="") 
                                           transmission==input$rb_EuroTr1
                                       else 
                                           (transmission=="Manual" | transmission=="Automatic")
                                ) %>%
                                group_by(brand)
                        
                        t_Euro <- data.frame(table(unlist(usedCars_Euro_Br_Selected$brand)))
                        
                        pl_usedCars_Euro_Selected <- plot_ly(t_Euro, labels = ~Var1, 
                                                             values = ~Freq, type = "pie")
                        
                        pl_usedCars_Euro_Selected <- pl_usedCars_Euro_Selected %>% 
                                layout(title = "Persentase Spesifik Banyak Kendaraan Eropa Berdasarkan Transmisi",
                                       xaxis = list(showgrid = FALSE, zeroline = FALSE, 
                                                    showticklabels = FALSE),
                                       yaxis = list(showgrid = FALSE, zeroline = FALSE, 
                                                    showticklabels = FALSE))
                }) # akhir plot1a

        
        # menampilkan plot kendaraan Jepang
        output$plot1b <- 
                renderPlotly({
                        usedCars_Japan_Br_Selected <- data_usedCars_Japan %>%
                                filter(if (input$rb_JapanTr1!="") 
                                           transmission==input$rb_JapanTr1
                                       else 
                                           (transmission=="Manual" | transmission=="Automatic")
                                ) %>%
                                group_by(brand)
                        
                        t_Japan <- data.frame(table(unlist(usedCars_Japan_Br_Selected$brand)))
                        
                        pl_usedCars_Japan_Selected <- plot_ly(t_Japan, labels = ~Var1, 
                                                             values = ~Freq, type = "pie")
                        
                        pl_usedCars_Japan_Selected <- pl_usedCars_Japan_Selected %>% 
                                layout(title = "Persentase Spesifik Banyak Kendaraan Jepang Berdasarkan Transmisi",
                                       xaxis = list(showgrid = FALSE, zeroline = FALSE, 
                                                    showticklabels = FALSE),
                                       yaxis = list(showgrid = FALSE, zeroline = FALSE, 
                                                    showticklabels = FALSE))
                }) # akhir plot1a
        

        # page 2
        
        # perhitungan total banyak kendaraan Eropa
        nb_Euro_Total2 <- data_usedCars_Euro %>% nrow()
        output$vb_Euro2 <- renderValueBox({
                valueBox(
                        value = nb_Euro_Total2,
                        subtitle = "Total Kendaraan",
                        icon = icon("car"),
                        width = 6,
                        color = "teal",
                        href = NULL
                )
        }) # akhir renderValueBox
        
        output$vb_EuroBr2 <- renderValueBox({
                nb_Euro_Br2 <- data_usedCars_Euro %>%
                        dplyr::filter(brand == input$si_EuroBr2,
                                      transmission == input$rb_EuroTr2,
                                      color == input$rb_EuroCol2,
                                      age_Cat == input$rb_EuroAge2
                                     ) %>% nrow()

                valueBox(
                        value = percent(nb_Euro_Br2/nb_Euro_Total2, accuracy=0.01),
                        subtitle = paste("Persentase Kombinasi ",input$si_EuroBr2),
                        icon = icon("car"),
                        width = 6,
                        color = "yellow",
                        href = NULL
                )
        }) # akhir renderValueBox
        
        # perhitungan total banyak kendaraan Jepang
        nb_Japan_Total2 <- data_usedCars_Japan %>% nrow()
        output$vb_Japan2 <- renderValueBox({
                valueBox(
                        value = nb_Japan_Total2,
                        subtitle = "Total Kendaraan",
                        icon = icon("car"),
                        width = 6,
                        color = "teal",
                        href = NULL
                )
        }) # akhir renderValueBox

        output$vb_JapanBr2 <- renderValueBox({
                nb_Japan_Br2 <- data_usedCars_Japan %>%
                        dplyr::filter(brand == input$si_JapanBr2,
                                      transmission == input$rb_JapanTr2,
                                      color == input$rb_JapanCol2,
                                      age_Cat == input$rb_JapanAge2
                                     ) %>% nrow()

                valueBox(
                        value = percent(nb_Japan_Br2/nb_Japan_Total2, accuracy=0.01),
                        subtitle = paste("Persentase Kombinasi ",input$si_JapanBr2),
                        icon = icon("car"),
                        width = 6,
                        color = "yellow",
                        href = NULL
                )
        }) # akhir renderValueBox
        
        # menampilkan scatter plot untuk kendaraan Eropa
        output$plot2a <- renderPlotly({
                             data_usedCars_Euro_Sel_Mil <- reactive({
                                 data_usedCars_Euro_Sel %>%
                                 dplyr::filter(mileage >= (input$sl_Euro2 * 1000))
                             }) # akhir reactive
                             ggplot(data_usedCars_Euro_Sel_Mil(), 
                                    aes(x=mileage/1000, y=price/1000, 
                                        text = paste("Merek: ", brand, "\nWarna: ", color)
                                    ), 
                                    tooltip = "text") + 
                                 geom_point(stat = "identity", alpha = 0.2,
                                            aes(size = age, color = mileage)) +
                                 ggtitle("Harga Kendaraan Bekas vs Jarak Tempuh") +
                                 labs(x = "Jarak tempuh (ribuan)", 
                                      y = "Harga (ribuan)") +
                                 theme(legend.position = "none")
                         })  # akhir renderPlotly

        # menampilkan scatter plot untuk kendaraan Jepang
        output$plot2b <- renderPlotly({
                             data_usedCars_Japan_Sel_Mil <- reactive({
                                 data_usedCars_Japan_Sel %>%
                                 dplyr::filter(mileage >= (input$sl_Japan2 * 1000))
                             }) # akhir reactive
                             ggplot(data_usedCars_Japan_Sel_Mil(),
                                    aes(x=mileage/1000, y=price/1000,
                                        text = paste("Merek: ", brand, "\nWarna: ", color)
                                    ),
                                    tooltip = "text") + 
                                 geom_point(stat = "identity",  alpha = 0.2,
                                            aes(size = age, color = mileage))+
                                 ggtitle("Harga Kendaraan Bekas vs Jarak Tempuh") +
                                 labs(x = "Jarak tempuh (ribuan)", 
                                      y = "Harga (ribuan)") +
                                 theme(legend.position = "none")
                         })  # akhir renderPlotly
        
        
        # page 3 
        # menyajikan data kendaraan Eropa dan kendaraan Jepang  
        dt_usedCars_EuroJapan <- DT::datatable(data_usedCars_EuroJapan)
        
        output$data_inter <- DT::renderDataTable(
            dt_usedCars_EuroJapan, 
            options = list(rownames = TRUE,
                           searching = TRUE,
                           scrollX = TRUE,
                           pageLength = 5,
                           backgroundColor = 
                               styleInterval(3.4, c("gray", "yellow")),
                           class = "hover cell-border stripe"                
            ) # akhir list
        ) # akhir renderDT       
        
} # akhir function

