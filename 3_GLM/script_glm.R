############################
# Régression de Logistique #
############################

A = read.table("3_GLM/chd.txt", header = TRUE)
plot(A$age, A$chd, 
     xlab = "AGE", ylab = "CHD", 
     pch = 16, col = c("green3", "red")[A$chd+1]
)

fit.glm = glm(chd~age, family = binomial("logit"), data = A)
summary(fit.glm)

plot(A$age, A$chd, 
     xlab = "AGE", ylab = "CHD", 
     pch = 16, col = c("green3", "red")[A$chd+1]
)
points(A$age, predict(fit.glm, type = "response"), 
       type = "b", pch = 16, col = "black")

beta = matrix(0, 2,10000)
for (b in 1:10000) {
   idx = sample (1:NROW(A), size =NROW(A), replace = TRUE )
   beta[ , b] = glm(chd~age, 
                   family = binomial("logit"), 
                   data = A[idx, ])$coefficients
}

B = summary (glm(chd~age, family = binomial("logit"), 
                 data = A))$coefficients
m = B [1:2 ,1]
V = vcov (glm(chd~age, family = binomial("logit"), 
                  data = A))
library ( mnormt )
dn = function (x,y) dmnorm ( cbind (x,y),m,V)

vx=seq(range(beta[1, ])[1],range(beta[1, ])[2], length=201)
vy=seq(range(beta[2, ])[1],range(beta[2, ])[2], length=201)
z=outer(vx,vy,dn)

xhist <- hist(beta[1, ], plot=FALSE)
yhist <- hist(beta[2, ], plot=FALSE)
top <- max(c(xhist$density, yhist$density,dnorm(0)))
nf <- layout(matrix(c(2,0,1,3),2,2,byrow=TRUE), c(3,1), c(1,3), TRUE)
par(mar=c(3,3,1,1))
image(vx,vy,z,col=rev(heat.colors(101)))
points(t(beta),cex=.2)
contour(vx,vy,z,col="blue",add=TRUE)
abline(v=m[1],h = m[2], col = "red")
par(mar=c(0,3,1,1))
hist(beta[1, ], proba = TRUE, axes=FALSE, col="light green", 
     xlab = "", ylab = "", main = "")
par(mar=c(3,0,1,1))
barplot(yhist$density, axes=FALSE, xlim=c(0, top), space=0, 
        horiz=TRUE,col="light green")

#########################
# Régression de Poisson #
#########################

death_aids = c(0, 1, 2, 3, 1, 4, 9, 18, 23, 31, 20, 25, 37, 45)
quarter = c(1:14)

df = data.frame(quarter = quarter,
                death_aids = death_aids 
                )

fit.glm = glm(death_aids~quarter, family = "poisson", data = df)
summary(fit.glm)

plot(df$quarter, df$death_aids, xlab = "quarter", ylab = "death_aids")
points(df$quarter, predict(fit.glm, type = "response"), 
       type = "b", pch = 16, col = "red")



#Criteria for assessing goodness of fit
summary(fit.glm)

# Log likelihood du mod?le ?tudi? 
-2*logLik(fit.glm)
# Log Likelihood du mod?le satur?
yy = y ; yy[1] = 1
-2*(logLik(fit.glm)-sum(y*log(yy)-y-log(fact(y))))


XBeta = predict(fit.glm)
Prediction = predict(fit.glm, type = "response", se.fit = TRUE)

####################
# Régression Gamma #
####################


#Y = Durée de vie entre le diagnostic et le décès en semaines

y = c(65, 156, 100, 134, 16, 108, 121, 4, 39, 
      143, 56, 26, 22, 1, 1, 5,  65) 

# X = log(Nombre de globules blancs initial)       
      
x = c(3.36, 2.88, 3.63, 3.41, 3.78, 4.02, 4.00, 
      4.23, 3.73, 3.85, 3.97, 4.51, 4.54, 5.00, 
      5.00, 4.72, 5.00)	

df = data.frame(survival = y, globules = x) 
df = df[order(df[, 2]), ]

fit.glm = glm(survival~globules, family = Gamma(link = "log"), data = df, )

fit.glm = glm(survival~globules, family = Gamma(link = "inverse"), data = df)

#Gamma(link = "inverse")
#gamma.shape(fit.glm)
#summary(fit.glm, dispersion=gamma.shape(fit.glm)[1]$alpha)   
#library(MASS)
#myshape <- gamma.shape(fit.glm)


plot(df$globules, df$survival, ylim = c(0, 235),
     xlab = "globules",
     ylab = "survival",
     main = "Durée de survie vs #globules blancs")

points(df$globules, 
       predict(fit.glm, type = "response"), 
       pch = 16, col = "red",
       type = 'b')




  
  	
