#GLM 시각화
library(dplyr)
library(ggplot2)

chall <- read.csv('https://raw.githubusercontent.com/stedy/Machine-Learning-with-R-datasets/master/challenger.csv')
chall <- tbl_df(chall)
glimpse(chall)

chall %>% ggplot(aes(temperature, distress_ct)) + 
  geom_point()
chall %>% ggplot(aes(factor(distress_ct), temperature)) +
  geom_boxplot()

chall_glm <- glm(cbind(distress_ct, o_ring_ct - distress_ct) ~
                   temperature, data = chall, family = 'binomial')
summary(chall_glm)
predict(chall_glm, data.frame(temperature=30))
exp(3.45) / (exp(3.45)+1)
predict(chall_glm, data.frame(temperature=30), type = 'response')

logistic <- function(x) {exp(x)/(exp(x)+1)}
plot(c(20,85), c(0,1), type = 'n', xlab = 'temperature',
     ylab = 'prob')
tp <- seq(20, 85, 1)
chall_glm_pred <-
  predict(chall_glm, data.frame(temperature = tp),
          se.fit = TRUE)
lines(tp, logistic(chall_glm_pred$fit))
lines(tp, logistic(chall_glm_pred$fit - 1.96 * chall_glm_pred$se.fit), lty=2)
lines(tp, logistic(chall_glm_pred$fit + 1.96 * chall_glm_pred$se.fit), lty=2)
abline(v = 30, lty=2, col='blue')
