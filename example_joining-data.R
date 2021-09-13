library(tidyverse)

first_test <- read_csv(here::here("data", "First Test.csv"))
second_test <- read_csv(here::here("data", "Second Test.csv"))


joined <- left_join(second_test, first_test, by = c("first_name", "last_name"))
joined

write_csv(joined, here::here("data", "joined.csv"))
