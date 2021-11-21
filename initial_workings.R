library(dplyr)
library(stringr)

# merge datasets
df_2021 <- read.csv("data/pp-2021.csv",stringsAsFactors = F, header = F)
df_2020 <- read.csv("data/pp-2020.csv",stringsAsFactors = F, header = F)
df <- rbind(df_2020,df_2021)

# split postcode
df[,c('postcode_district','postcode_end')] <- str_split_fixed(df$V4,' ', 2)

# filter for properties selling under £450,000
df <- filter(df,V2 <= 450000)

length(unique(df$postcode_district))
nrow(df)