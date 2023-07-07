setwd("C:/Users/sunli/Desktop/Jordan/Math 381/Assignment Tool") // set folder directory
ptm<-proc.time() // start time tracker
data<-read.csv(file="930.csv",header=TRUE,sep=",") // read the preference matrix
na<-data[,1] // isolate the first column (student names)
data<-as.matrix(data[,-1]) // convert data frame into matrix form
rownames(data)<-na // add the first column as row names

library(RBGL)
S<-rownames(data)
which(duplicated(S)) // make sure every student name is unique
E<-colnames(data)
which(duplicated(E)) // make sure every course title is unique
V<-c(S,E)  // combine two sets of vertices together
g <- new("graphNEL", nodes=V, edgemode="directed") // construct a bipartite graph with all vertices
for(i in 1:nrow(data)) // for each student 
{
for(j in 1:ncol(data)) // for each class
{
if(data[i,j]==1) // if the student has interest in that class
g<-addEdge(S[i],E[j],g) // connect the student to that class
}
}
x9 <- edmondsMaxCardinalityMatching(g) // find the maximum matching using augmenting-path algorithm
write.table(x9,file="930output.csv",sep=",") // output the results
proc.time()-ptm 

