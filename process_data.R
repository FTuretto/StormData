
library(ggplot2)
library(dplyr)

# Carregar os dados
activity_data <- read.csv("activity.csv")

# Converter a coluna date para formato Date
activity_data$date <- as.Date(activity_data$date, format="%Y-%m-%d")

# Criar dataset com valores imputados
activity_data_imputed <- activity_data %>%
  group_by(interval) %>%
  mutate(steps = ifelse(is.na(steps), mean(steps, na.rm = TRUE), steps))

# Salvar novo dataset
write.csv(activity_data_imputed, "activity_imputed.csv", row.names = FALSE)
