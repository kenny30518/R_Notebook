r_version <- R.Version()
r_version_str <- r_version$version.string
print(r_version_str)


?iris
head(iris)
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)
hist(iris$Petal.Length)
hist(iris$Petal.Width)
par(mfrow = c(3,1))
hist(iris$Petal.Width [iris$Species == "setosa"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Widtj for Setosa",
     xlab = "",
     col = "red"
     )
hist(iris$Petal.Width [iris$Species == "versicolor"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Widtj for Versicolor",
     xlab = "",
     col = "purple"
)

hist(iris$Petal.Width [iris$Species == "virginica"],
     xlim = c(0, 3),
     breaks = 9,
     main = "Petal Widtj for Virginica",
     xlab = "",
     col = "blue"
)


plot(mtcars$wt, mtcars$mpg,
     pch = 19,
     cex = 1.5,
     col = "#cc0000",
     main = "MPG as a Function of Weight of Cars",
     xlab = "Weight (in 1000 pounds)",
     ylab = "MPG"
     )

?lynx
head(lynx)
hist(lynx)
hist(lynx,
     breaks = 14,
     freq = FALSE,
     col = "thistle1",
     main = "Histogram of Annual Canadian Lynx", "Trapping, 1821-1934",
     xlab = "Number of Lynx Trapped"
)

curve(dnorm(x,mean = mean(lynx), sd = sd(lynx)),
      col = "thistle4",
      lwd = 2,
      add = TRUE
      )
lines(density(lynx), col = "blue", lwd = 2)
lines(density(lynx, adjust = 3), col = "purple", lwd = 2)

rug(lynx, lwd = 2, col = "gray")

head(iris)
summary(iris$Species)
summary(iris$Sepal.Length)
summary(iris)




head(iris)
hist(iris$Petal.Length)

summary(iris$Petal.Length)

summary(iris$Species)

hist(iris$Petal.Length [iris$Species == "versicolor"],
     main = "Petal Length: Versicolor")

hist(iris$Petal.Length [iris$Petal.Length < 2],
     main = "Petal Length < 2")


n1 <- 15
n1
typeof(n1)


n2<- 1.5
n2
typeof(n2)

c1 <- "c"
c1
typeof(c1)

c2<-"a string text"
c2
typeof(c2)

l1<-TRUE
l1
typeof(l1)

v1<-c(1,2,3,4,5)
v1
is.vector(v1)

v2<-c("a","b","c")
v2
is.vector(v2)

v3<-c(TRUE,TRUE,FALSE,FALSE)
v3
is.vector(v3)

m1 <- matrix(c(F, T, T, T, F, F), nrow = 2)
m1

m2<-matrix(c("a","b","c","d"),nrow=2,byrow = T)
m2

a1<-array(c(1:24),c(4,3,2))
a1

vNumeric<-c(1,2,3)
vCharacter<-c("a","b","c")
vLogical<-c(T,F,T)

dfa<-cbind(vNumeric,vCharacter,vLogical)
dfa

dfa<-as.data.frame(cbind(vNumeric,vCharacter,vLogical))
dfa

o1<-c(1,2,3)
o2<-c("a","b","c","d")
o3<-c(T,F,T,T,F)
list1<-list(o1,o2,o3)
list1

list2<-list(o1,o2,o3,list1)
list2

(coerce1<-c(1,"b",TRUE))
typeof(coerce1)

(coerce2<-5)
typeof(coerce2)

(coerce3<-as.integer(5))
typeof(coerce3)

(coerce4<-c("1","2","3"))
typeof(coerce4)

(coerce5<-as.numeric(c("1","2","3")))
typeof(coerce5)

(coerce6<-matrix(1:9,nrow = 3))
is.matrix(coerce6)

(coerce7<-as.data.frame(matrix(1:9,nrow=3)))
is.data.frame(coerce7)

(x1<-1:3)
(y<-1:9)
(df1<-cbind.data.frame(x1,y))
typeof(df1$x1)
str(df1)


(x2<-as.factor(c(1:3)))
(df2<-cbind.data.frame(x2,y))
typeof(df2$x2)
str(df2)


install.packages('IRkernel')
install.packages("devtools")
devtools::install_github("IRkernel/IRkernel") IRkernel::installspec()

getwd()
