library("dplyr")
library("readr")

rates <- read_csv("../data/soc-sign-bitcoinotc.csv")

greater_than_8 <- rates %>% filter(RATING >= 8)

write_csv(greater_than_8, "../data/bitcoin_ratings.csv")
