
server <- function(input, output, session) {

updateSelectizeInput(session = session, inputId = 'id', choices = selection, server = TRUE)


data <- reactive({
    req(input$id)
    all_data %>%
        map(~filter(., transcript_cluster_id %in% input$id))})

output$DTS_probe_gene <- renderDataTable({
    req(input$id)
    data() %>% 
        map(~select(.,1, gene_assignment)) %>% 
        bind_rows(.id = "version") %>% 
        pivot_wider(names_from = version, values_from = gene_assignment) %>% 
        datatable(extensions = 'Buttons', 
                  options = list(autoWidth = TRUE,
                                 dom = 'Bfrtip'))
     })

output$DTS_probe_mRNA <- renderDataTable({
    req(input$id)
    data() %>% 
        map(~select(.,1, mrna_assignment)) %>% 
        bind_rows(.id = "version") %>% 
        pivot_wider(names_from = version, values_from = mrna_assignment) %>% 
        datatable(extensions = 'Buttons', 
                  options = list(autoWidth = TRUE,
                                 dom = 'Bfrtip'))
     })



output$DTS_probe_across_releases <- renderDataTable({
  
  data() %>% 
   map(~mutate_at(., vars(start, stop), as.numeric)) %>% 
    bind_rows(.id = "Release") %>% 
    datatable(extensions = 'Buttons', 
              filter =  list(position = 'top', clear = TRUE),
              callback = JS('table.page(3).draw(false);'),
              options = list(autoWidth = TRUE,
                             dom = 'Bfrtip',
                             columnDefs = list(list(
                               targets = c(9:17),
                               render = JS(
                                 "function(data, type, row, meta) {",
                                 "return type === 'display' && data.length > 6 ?",
                                 "'<span title=\"' + data + '\">' + data.substr(0, 40) + '...</span>' : data;",
                                 "}")
                             ))))
})
}





    




