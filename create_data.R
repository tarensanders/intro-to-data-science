library(tidyverse)
library(randomNames)

# Make csv files for the matching demo

df1_size <- 10000
df2_ratio <- 0.8

df1 <- randomNames(
  df1_size,
  gender = sample(0:1, df1_size, replace = TRUE),
  ethnicity = sample(1:6, df1_size, replace = TRUE),
  return.complete.data = TRUE
) %>%
  as_tibble() %>%
  distinct(first_name, last_name, .keep_all = TRUE) %>%
  mutate(age = floor(rnorm(n(), 25, 3)),
         "First Score" = sample(0:100, n(), replace = TRUE)) %>%
  relocate(first_name, last_name)

df2 <- df1 %>%
  select(first_name, last_name) %>%
  slice_sample(n = nrow(df1) * df2_ratio, replace = FALSE) %>%
  mutate("Second Score" = sample(0:100, n(), replace = TRUE))

dir.create(here::here("data"), showWarnings = FALSE)
write_csv(df1, here::here("data", "First Test.csv"))
write_csv(df2, here::here("data", "Second Test.csv"))
