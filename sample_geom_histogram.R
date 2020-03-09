library(gapminder)
library(ggplot2)
library(dplyr)
gapminder %>% ggplot(aes(x=gdpPercap)) + geom_histogram()
gapminder %>% ggplot(aes(x=gdpPercap)) + geom_histogram() +
  scale_x_log10()
gapminder %>% ggplot(aes(x=gdpPercap)) + geom_freqpoly() +
  scale_x_log10()
gapminder %>% ggplot(aes(x=gdpPercap)) + geom_density() +
  scale_x_log10()