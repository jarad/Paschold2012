library(dplyr)
library(tidyr)

d = read.table("data-raw/CorrectedGenomeResearchData.txt", header=TRUE)

Paschold2012 = d %>%
  gather(tmp,count,-GeneID) %>%
  mutate(tmp_ = gsub("\\.","_",tmp)) %>%
  separate(tmp_, c("replicate","genotype","line")) %>%
  mutate(genotype = plyr::revalue(genotype, c("B"="B73","M"="Mo17","BM"="B73xMo17","MB"="Mo17xB3")),
         line = plyr::revalue(line, c("b"="B73","m"="Mo17")),
         replicate = substr(replicate,4,4),
         flow_cell = ceiling(as.numeric(replicate)/2)) %>%
  select(GeneID, genotype, replicate, flow_cell, line, count) %>%
  arrange(GeneID, genotype, replicate) %>%
  spread(line,count)


