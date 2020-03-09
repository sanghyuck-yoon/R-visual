library(gapminder)
library(dplyr)
library(ggplot2)
gapminder %>% filter(year==2007) %>% 
  ggplot(aes(gdpPercap, lifeExp)) +
  geom_point(aes(size=pop, col=continent)) + scale_x_log10() +
  ggtitle('Gapminder data for')