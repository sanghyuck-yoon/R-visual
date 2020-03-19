#mpg$hwy 이상점 확인
library(dplyr)
library(ggplot2)
glimpse(mpg)
str(mpg)
summary(mpg)

mpg %>% ggplot() + geom_histogram(aes(x=hwy))
mpg %>% ggplot() + geom_boxplot(aes(x=1, y=hwy))
qqnorm(mpg$hwy)
qqline(mpg$hwy)
median(mpg$hwy)
mad(mpg$hwy)

mpg %>% filter(hwy > 40)
mpg %>% filter(model == 'new beetle')
mpg %>% filter(model == 'jetta')
mpg %>% filter(fl == 'd')
