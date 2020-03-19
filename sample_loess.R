#LOESS 
library(ggplot2)
library(dplyr)

plot(hwy ~ displ, data=mpg)
mpg_lo <- loess(hwy~displ, data=mpg)
mpg_lo
summary(mpg_lo)

xs <- seq(2,7,length.out = 100)
mpg_pre <- predict(mpg_lo, newdata=data.frame(displ=xs), se=TRUE)
lines(xs, mpg_pre$fit)
lines(xs, mpg_pre$fit - 1.96*mpg_pre$se.fit, lty=2)
lines(xs, mpg_pre$fit + 1.96*mpg_pre$se.fit, lty=2)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth()
