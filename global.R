lapply(c("shiny", "tidyverse", "DT"), function(x) if(!require(x,character.only = TRUE)) install.packages(x))

# all_data <- list.files(".", recursive = T, full.names = T) %>%
#   grep("csv/", ., value = T) %>%
#   grep("txt", ., value = T, invert = T) %>%
#   set_names(str_split(., pattern = "/") %>% map_chr(last)) %>%
#   map(read.csv, comment.char = "#", stringsAsFactors =F) %>%
#   map(as_tibble)
# all_data <- all_data[order(names(all_data))][c(2,1,3:6)]
# saveRDS(all_data, "HTA2.0Transcript_Cluster_Annotations.rds")

all_data <- readRDS("HTA2.0Transcript_Cluster_Annotations_snippet.rds")
selection <- all_data$`HTA-2_0.na36.hg19.transcript.csv` %>% 
  split(.$seqname) %>% 
  map(pull, transcript_cluster_id)

