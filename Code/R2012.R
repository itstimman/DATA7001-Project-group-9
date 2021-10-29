a1 = read.csv("/Users/niejingxin/Desktop/7001/1/data2.csv", header=TRUE, stringsAsFactors=FALSE)
a1
a1<- a1[-which(is.na(a1$GDP)), ]
a1
a1=data.frame(a1)
a1=a1[,-1]
a2=scale(a1)
a2
cor(a2)
install.packages('car')
library(ggplot2)
ggplot(a2,x=a1$GDP,y=a1$medal)

a2=data.frame(a2)
lm1=lm(medal~.,a2)
summary(lm1)

library(car)
library (carData)
ncvTest(lm1)
durbinWatsonTest(lm1)
vif(lm1)
outlierTest(lm1)

lm2=step(lm1)
summary(lm2)

par(mfrow=c(2,2)) 
plot(lm1)

library(car)
boxTidwell(medal~GDP+Population,data=a1)

lmfit2 <- lm(medal~I(Population^0.16127)+I(GDP^0.10468),data=a1)
summary(lmfit2)
plot(lm1,which = 1)
plot(lmfit2,which = 1)




lm3=lm(medal~I(Population^2)+GDP,a2)
summary(lm3)
m <- nls(medal ~ a*Population/(b+Population))
plot(medal~.,a2)


#pca
a3=a2[,-1]
me1 <- prcomp(a3, center = F,scale. = F)
summary(me1)
plot(me1$x, main = "after PCA")
me1

