install.packages("ggpubr")
library(dplyr)

data <- PlantGrowth
set.seed(123)
dplyr::sample_n(data, 10)
levels(data$group)


group_by(data, group) %>%
  summarise(
    count = n(),
    mean = mean(weight, na.rm = TRUE),
    sd = sd(weight, na.rm = TRUE)
  )

library("ggpubr")
ggboxplot(data, x = "group", y = "weight",
          color = "group", palette = c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("ctrl", "trt1", "trt2"),
          ylab = "Weight", xlab = "Treatment")

library("ggpubr")
ggline(data, x = "group", y = "weight",
       add = c("mean_se", "jitter"),
       order = c("ctrl", "trt1", "trt2"),
       ylab = "Weight", xlab = "Treatment")

boxplot(weight ~ group, data = data,
        xlab = "Treatment", ylab = "Weight",
        frame = FALSE, col = c("#00AFBB", "#E7B800", "#FC4E07"))
# One-way Anova
res.aov <- aov(weight ~ group, data = data)
summary(res.aov)

TukeyHSD(res.aov)
