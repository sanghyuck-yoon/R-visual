#산점도 
library(ggplot2)
library(dplyr)

ggplot(mpg, aes(cty, hwy)) + geom_smooth(method = 'lm')
ggplot(mpg, aes(cty, hwy)) + geom_jitter() + geom_smooth(method = 'lm')
