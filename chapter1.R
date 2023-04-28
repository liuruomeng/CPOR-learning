library(igraph)
library(readr)

##### intro ####

# 数据描述是Twitter上对于2012年美国威斯康星州州长补选的讨论。
# 收集了2012年5月29日到6月5日期间包含#wirecall话题标签的推文。
# 原始数据库包括8957名用户，为了方便之后的手工编码，作者从中随机抽样出1000名用户。

edgelist <- read.csv("https://curiositybits.cc/files/edgelist.csv")
g <- graph.data.frame(edgelist, directed = TRUE) #基于edgelist构建网络

plot(g, layout = layout_with_kk,
     vertex.color = "green", vertex.label = NA,
     vertex.size = 0.0001, edge.arrow.size = 0.0001)#visulisation

# Louvain 发现聚类
g <- graph.data.frame(edgelist, directed=FALSE) 
lc <- cluster_louvain(g)
membership(lc)

#
communities(lc)

#
plot(lc, g,vertex.color="green",vertex.label=NA,
     vertex.size=0.0001,edge.arrow.size=0.001)
