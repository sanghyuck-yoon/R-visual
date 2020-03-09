library(gapminder)
library(ggplot2)
library(dplyr)
df <- data.frame(gp = factor(rep(letters[1:3], each = 10)),
                  y = rnorm(30))
ds <- df %>% group_by(gp) %>% summarise(mean = mean(y), sd = sd(y))
ggplot() +
  geom_point(data = df, aes(x = gp, y = y)) +
  geom_point(data = ds, aes(x = gp, y = mean),
                        color = 'red', size = 3) +
  geom_errorbar(data = ds, aes(x = gp, y = mean,
                ymin = mean - sd, ymax = mean + sd),
                color = 'red', widht = 0.4)
