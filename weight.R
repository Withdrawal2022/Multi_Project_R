setwd("E:/Multivariate statistical analysis")
data <- read.csv("data.csv",header=T,as.is=T)
data <- data[,3:10]

pca0<-scale(data,scale=T)%>%cor()%>%eigen()
pca0$values #  eigenvalues，特征值。
pca0$vectors# eigenvectors，单位特征向量,即变量与主成分的线性组合回归系数(系数权重)。

# 特征值分析
## 主成分方差贡献率
eig0 <- data.frame(
  eigenvalue =pca0$va,
  variance.percent = pca0$va/sum(pca0$va),
  cumulative.variance.percent = cumsum(pca0$va)/sum(pca0$va)
)
eig0

## Scree plot(悬崖碎石图)
plot(x=1:8,y=eig0[,1],type = "b",main="Scree plot",ylab = "Eigen Value",xlab ="Component Number" )

## 累积特征值比例图
plot(x=1:8,y=eig0[,3],type="b",main="Cumulative Eigen Value (Ratio)",
     xlab="Component Number",ylab="Cumulative Eigen Value (Ratio)")

# 变量载荷
## 回归系数载荷表(Component Matrix)
reg.loadings <- pca0$ve
colnames(reg.loadings) <- paste("PC",1:8,sep = "")
rownames(reg.loadings) <- colnames(data)
write.csv(reg.loadings,"reg.loading.csv",quote = FALSE)

## 计算相关系数载荷表(Component Matrix)
cor.loadings <- sweep(pca0$ve,2,sqrt(pca0$va),"*")
colnames(cor.loadings) <- paste("PC",1:8,sep = "")
rownames(cor.loadings) <- colnames(data)
write.csv(cor.loadings,"cor.loading.csv",quote = FALSE)

reg <- read.csv("reg.loading.csv")
reg <- reg[,-1]
reg <- reg[,-5:-8]
reg <- t(reg)

a<-c(0.3108231/0.8003677, 0.24236357/0.8003677,0.13169749/0.8003677,0.11548353/0.8003677)

A <- function(a,b){
  c<- a%*%b
  return(c)
}

w <- c()
sum = 0 


for ( i in 1:8) {
  b <- as.vector(reg[,i])
  c <- A(a,b)
  sum = sum + c
}

sum

for ( i in 1:8) {
  b <- as.vector(reg[,i])
  c <- A(a,b)/sum
  w <-append(w,c)
}

w
sum
