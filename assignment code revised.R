setwd("C:/Users/sunli/Desktop/Jordan/Math 381/Assignment Tool")
ptm<-proc.time()
data<-read.csv(file="testversion.csv",header=TRUE,sep=",") 
na<-data[,1]
data<-as.matrix(data[,-1]) 
rownames(data)<-na
library(RBGL)
S<-rownames(data)
which(duplicated(S)) 
E<-colnames(data)
which(duplicated(E)) 
V<-c(S,E)  
g <- new("graphNEL", nodes=V, edgemode="directed")
for(i in 1:nrow(data)) 
{
for(j in 1:ncol(data)) 
{
if(data[i,j]==1) 
g<-addEdge(S[i],E[j],g) 
}
}
x9 <- edmondsMaxCardinalityMatching(g) 
write.table(x9,file="testoutput.csv",sep=",") 
proc.time()-ptm 

