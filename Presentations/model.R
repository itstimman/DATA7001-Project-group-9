#data2012
a1 = read.csv("/Users/niejingxin/Desktop/7001/1/2012.csv", header=TRUE, stringsAsFactors=FALSE)
a1=data.frame(a1)
a2=scale(a1)#Data standardization
a2=data.frame(a2)
cor(a2)#Linear correlation coefficient view

#Scatter plot
install.packages("psych")
library(psych)
pairs.panels(a1[c("GDP","Population","medal")])

library(car)
scatterplotMatrix(a1,smooth=F,spread=FALSE,main='Scatter Plot Matrix')

plot(GDP,medal)
plot(a1$Population,a1$medal)

# Multiple linear regression of medal to GDP and Population
lm1=lm(medal~.,a2)
summary(lm1)
#Stepwise regression to select variables
step(lm1)
#model checking
#Some inspection charts
par(mfrow=c(2,2)) 
plot(lm1)
#Test whether the hypothesis is satisfied
library(car)
library (carData)
ncvTest(lm1)#Homoscedasticity test
durbinWatsonTest(lm1)#Independence test
vif(lm1)#Multicollinearity test
outlierTest(lm1)#Outlier test

#Do power transformation to remove heteroscedasticity
library(car)
boxTidwell(medal~GDP+Population,data=a1)#Find the best power value

#New model
lm2 <- lm(medal~I(Population^0.16127)+I(GDP^0.10468),data=a1)
summary(lm2)
#Comparison of residual plots of two models
plot(lm1,which = 1)
plot(lm2,which = 1)

#3d
library(car)
install.packages("MASS")
library(rgl)
pic1=scatter3d(medal~GDP+Population,data=a1,fit="smooth")

medal~I(Population^0.16127)+I(GDP^0.10468)

newpopulation=a1$Population^0.16127
newGDP=a1$GDP^0.10468

a4=data.frame(a1$medal,newpopulation,newGDP)
a4
pic2=scatter3d(a1.medal~newpopulation+newGDP,data=a4,fit="smooth")

persp3d(a1$medal,newpopulation,newGDP,col="skyblue")

#data 2000
a3 = read.csv("/Users/niejingxin/Desktop/7001/1/2000.csv", header=TRUE, stringsAsFactors=FALSE)
lm3 <- lm(medal~I(Population^0.16127)+I(GDP^0.10468),data=a3)
summary(lm3)
