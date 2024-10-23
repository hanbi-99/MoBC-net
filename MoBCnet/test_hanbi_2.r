

library(dplyr)
library(clusterProfiler)



#-------------------------------------------------------------------------------------
#--------------- run

setwd('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/hanbi/Script/Project/MoBC-net/MoBCnet')
# devtools::document()

dir.set='/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/hanbi/Script/Project/MoBC-net/MoBCnet/R/'
ff = list.files(dir.set)


for(ii in ff) source(paste0(dir.set,ii))

library(magrittr)

user.id <- getwd()
user.id <- gsub('/.*','',gsub('/Users/','',user.id))


if(user.id=='hanbilee'){
    fdir.set = paste0('/Users/',user.id,'/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/Package')
}else if(user.id=='yoomibaek'){
    dir.set = paste0('/Users/',user.id,'/Library/CloudStorage/OneDrive-GCCORP/Community distance/Package')
}




#--------------- ym results
# library(igraph)

# fn = '/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/Validation data results/breast.deg.results.700.sd.4.Rdata'
# load(fn)
# # [1] "breast.deg.results.700.sd.4" "CONFIG"                     
# # [3] "dateTag"                     "fn"   

# res = breast.deg.results.700.sd.4
# class(res)
# re = res@MoBCresults %>% dplyr::arrange(z_score)

# res@MoBCresults %>% dplyr::arrange(z_score)

# plot.Dist(res)
# # 2,3,5



# #--------------- save results
# # new
# # 여기에 comm.breast.RData (comm.breast), human.ppi.network.csv
# load('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/community_distance_file/network/binning/comm.breast.RData') #comm.breast
# orig.ppi = read.csv('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/community_distance_file/network/binning/human.ppi.network.csv', row.names=1)

# res2 = CommDistFunction(orig.ppi,comm.breast)


# res@MoBCresults %>% dplyr::arrange(z_score)
# res2@MoBCresults %>% dplyr::arrange(z_score)

# res2@MoBCresults %>% dplyr::arrange(distance_score)

# resm = res2@MoBCresults

# linkgl = lapply(1:nrow(resm), function(ixix){
#     cm1 = resm[ixix,c('community_1')]
#     cm2 = resm[ixix,c('community_2')]
#     re1 = cal.MoBCgenes(res@graph, 
#                 community1=res2@filtered.communities[[cm1]], 
#                 community2=res2@filtered.communities[[cm2]])
#     re1$community1 = cm1
#     re1$community2 = cm2
#     return(re1)
# })

# lapply(linkgl, head)
# names(linkgl) = sapply(1:nrow(resm), function(ixix){
#     cm1 = resm[ixix,c('community_1')]
#     cm2 = resm[ixix,c('community_2')]
#     paste0(cm1,'_',cm2)
#     }) %>% unlist


# linkgl[c('2_3','2_5','6_7')] %>% lapply(head)



# #----- shortest-based
# resm1 = resm %>% filter(pvalue<0.05) %>% arrange(pvalue)

# sp.linkgl = lapply(1:nrow(resm1), function(ixix){
#     cat(ixix,'\n')
#     cm1 = resm1[ixix,c('community_1')]
#     cm2 = resm1[ixix,c('community_2')]
#     re1 = cal.FCgene(res2@graph, 
#                 community1=res2@filtered.communities[[cm1]], 
#                 community2=res2@filtered.communities[[cm2]])
#     re1$community1 = cm1
#     re1$community2 = cm2
#     return(re1)
# })

# linkgl = lapply(1:nrow(resm1), function(ixix){
#     cm1 = resm1[ixix,c('community_1')]
#     cm2 = resm1[ixix,c('community_2')]
#     re1 = cal.MoBCgenes(res2@graph, 
#                 community1=res2@filtered.communities[[cm1]], 
#                 community2=res2@filtered.communities[[cm2]])
#     re1$community1 = cm1
#     re1$community2 = cm2
#     return(re1)
# })


# lapply(sp.linkgl, head)
# lapply(linkgl, head)



# plot.MoBC.genes(res2)
# plot.Dist(res)

# cenm = linkgl[[1]]
# spm = sp.linkgl[[1]]
# spm$cl.score =  cenm[match(spm$gene, cenm$gene),'score']
# spm$sp.rank = rank(-spm$score)
# spm$cl.rank = rank(-spm$cl.score)
# spm1 = subset(spm, cl.rank < 100 | sp.rank  < 100)

# plot(spm$cl.rank, spm$sp.rank, xlab='MoBC', ylab='Flow centrality')
# plot(spm$cl.score, spm$score, xlab='MoBC', ylab='Flow centrality')


# plot(spm1$cl.rank, spm1$sp.rank, xlab='MoBC', ylab='Flow centrality')

# plot(spm1$cl.score, spm1$score, xlab='MoBC', ylab='Flow centrality')

# subset(spm1, )


#--------------- edit
# new
# 여기에 comm.breast.RData (comm.breast), human.ppi.network.csv
load('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/community_distance_file/network/binning/comm.breast.RData') #comm.breast
orig.ppi = read.csv('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/community_distance_file/network/binning/human.ppi.network.csv', row.names=1)

res2 = CommDistFunction(orig.ppi,comm.breast)


res@MoBCresults %>% dplyr::arrange(z_score)
res2@MoBCresults %>% dplyr::arrange(z_score)

res2@MoBCresults %>% dplyr::arrange(distance_score)


network = orig.cls
community.genelist = comm.breast

#------
ntkg = res@graph
class(ntkg)

# mobc.res - mobc results
# res2 - disntace results
#  res2.sd (Deseq 결과), allid(ginfo), deseq.deg(Deseq deg 결과), pathway.go, pathway.kegg, comm.dist.result(distance 결과), 
# human.ppi.network.final(전체 ppi network), deg.network(deg network), comm.breast(comm list), mobc.genes.results(link gene 결과)

breast.comm.dist.RData
load('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/논문_RECOMB/result file/breast.comm.dist.RData')
load('/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/논문_RECOMB/result file/breast.comm.dist.RData')

# mobc.genes.results(link gene 결과)
# comm.dist.result(distance 결과), 


rel = lapply(mobc.genes.results, function(dm){
    comv <- sapply(dm$gene, function(xx)  xxv = names(comm.breast)[sapply(comm.breast, function(yy) any(yy %in% xx))])
    comv[lengths(comv)==0] = ''
    dm$comm.gene=unlist(comv)
    dm = dm %>% as.data.frame
    return(dm)
})

lapply(rel, head)

rel1 = lapply(rel, as.data.frame)
rel[[1]] %>% str

cls = res@filtered.communities
use.cls = cls[c(2,3,5)]

top = 5


comm1='2'
comm2='3'

re1 = cal.MoBCgenes(res2@graph, 
                community1=res2@filtered.communities[[comm1]], 
                community2=res2@filtered.communities[[comm2]])

re2 = cal.MoBCgenes.v2(res@graph, 
                community1=res@filtered.communities[[comm1]], 
                community2=res@filtered.communities[[comm2]])


re3 = cal.MoBCgenes.v3(res@graph, 
                community1=res@filtered.communities[[comm1]], 
                community2=res@filtered.communities[[comm2]])


# head(re1)
# head(re2)


sig.re = re[1:2,1:2]
linkg = lapply(1:2, function(ix){

    comm1 = sig.re[ix,1]
    comm2 = sig.re[ix,2]

	link.re = cal.MoBCgenes.v3(res@graph, 
					community1=res@filtered.communities[[comm1]], 
					community2=res@filtered.communities[[comm2]])
    link.re = link.re[1:top,]
}) %>% bind_rows %>% pull(gene) %>% unique




#---------------------- link gnene

library(org.Hs.eg.db)


cls=res2@filtered.communities
allg = V(res2@graph)$name

ginfo = select(org.Hs.eg.db, allg, c("ENTREZID","GENENAME"), "ALIAS")
ginfo1 = ginfo[which(!is.na(ginfo$ENTREZID)),]
setdiff(allg, ginfo1$ALIAS)
is.na(ginfo$ENTREZID) %>% sum

allg.egs = subset(ginfo1, ALIAS %in% allg)$ENTREZID

egol = mclapply(names(cls), mc.cores=4, function(gix){
    egs = subset(ginfo1, ALIAS %in% cls[[gix]])$ENTREZID
	ego = enrichGO(egs, 
		# organism="mmu", 
		ont='BP',
		OrgDb ='org.Hs.eg.db' ,
		universe=as.character(allg.egs),
		pAdjustMethod = "BH", pvalueCutoff = 1.1, qvalueCutoff = 1.1)
	if(is.null(ego)) return(NULL)
	ego = ego@result
	colnames(ego) = c('ID','ont','GeneRatio','GgRatio','pval','p.adj','qval','commonL','commonN')

	ego$cl = gix
	return(ego)
	})
names(egol) = names(cls)
egodf = do.call(rbind, egol)

lapply(pml, head)


keggpl = mclapply(names(cls), mc.cores=4, function(gix){
    egs = subset(ginfo1, ALIAS %in% cls[[gix]])$ENTREZID
	keggp = enrichKEGG(egs, 
		organism="hsa", 
		# ont='BP',
		# OrgDb ='org.Mm.eg.db' ,
		universe=as.character(allg.egs),
		pAdjustMethod = "BH", pvalueCutoff = 1.1, qvalueCutoff = 1.1)
	if(is.null(keggp)) return(NULL)
	keggp = keggp@result
	colnames(keggp) = c('ID','ont','GeneRatio','GgRatio','pval','p.adj','qval','commonL','commonN')

	keggp$cl = gix
	return(keggp)
	})
names(keggpl) = names(cls)
lapply(keggpl, head)



#---------------------- comm plot

MoBC.result = res2
pval = 0.05

distm = MoBC.result@MoBCresults %>% arrange(z_score)
sig.dist = distm #subset(distm, pvalue < pval)[,1:3]
sig.dist$community_1 = paste0('M', sig.dist$community_1)
sig.dist$community_2 = paste0('M', sig.dist$community_2)
sig.dist$weight = (sig.dist$z_score+5)
sig.dist$weight = 1/sig.dist$weight
ntkg = igraph::graph_from_data_frame(sig.dist[,c('community_1','community_2','weight')], directed=FALSE)
ntkg = igraph::simplify(ntkg, remove.multiple = TRUE, remove.loops = TRUE)

# maxn = max(lengths(MoBC.result@filtered.communities))
# col_fun = circlize::colorRamp2(c(0, round(maxn/4),round(maxn/4)*2,round(maxn/4)*3,maxn), c("grey", "orange", "#FF6566","red","darkred"))
# colv = sapply(igraph::V(ntkg)$name, function(gn){
#     xx = col_fun(length(MoBC.result@filtered.communities[[gn]])) %>% c
#     return(xx)
# }) %>% 'names<-'(igraph::V(ntkg)$name)



plt.dir = '/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/Validation data results/plot'
png(
	file = paste0(plt.dir,"/between_comm_pval_0.05.png"),
	# file=paste0(DIR_Presult,"/Cachexia/plt_CAD_dexX/network/method1_clusters_",focus.type,".png"), #kpath c2_cp
	width = 7, height =6, 
    # type='cairo', 
    units = "in", res = 300,  bg='white')


library(colorspace)
cov3 <- sequential_hcl(8, "Terrain") %>% 'names<-'(igraph::V(ntkg)$name)
sizev=7

set.seed(52) #42
layout <- igraph::layout_nicely(ntkg,dim=3)
layout <- igraph::layout_with_fr(ntkg, weights=1/igraph::E(ntkg)$weight)
# layout <- igraph::layout_on_grid(ntkg)

plre = plot(ntkg, 
    layout = layout, 
    # mark.groups = split(V(g)$name,clv),
    # vertex.label = fgid1[match(V(g)$name, fgid1$EntrezID),'gene_name'],
    # vertex.label = '', #vns
    vertex.color=cov3[igraph::V(ntkg)$name],
    vertex.frame.width=0.3,
    vertex.frame.color='white',
    # edge.color ="grey",#adjustcolor('black', alpha=0.6),
    # vertex.size= (cln[V(cl.ntkg)$name]^0.5)*4,
    vertex.size=sizev,
    # vertex.label.dist=1,
    # vertex.frame.color = 'grey90',
    vertex.label.color='black',
    # vertex.label.font=ifelse(V(g)$name %in% np.gl[[pn]], 2,1),
    vertex.label.size = 0.1,
    edge.label = round(sig.dist[match(igraph::E(ntkg)$weight, sig.dist$weight),'z_score'],3), #-round(E(ntkg)$weight,2),
    vertex.label.family = "Arial",
    edge.label.family = "Arial",
    edge.label.color='black',
    edge.color=ifelse(sig.dist[match(igraph::E(ntkg)$weight, sig.dist$weight),'pvalue']<0.05,'red','grey'),
    edge.width=(igraph::E(ntkg)$weight)*10
)

plre





df1 = data.frame(n = lengths(MoBC.result@filtered.communities)[igraph::V(ntkg)$name], col=cov3[V(ntkg)$name]) %>% unique
df1 = df1[order(df1$n, decreasing=T),]
df1$comm = paste0('M',igraph::V(ntkg)$name)
legend("bottomleft", col=df1[,2], pch=19, 
    legend=paste0(df1[,'comm'],' (',df1[,'n'],')'), title='Module size')

dev.off()




#---------------------- link gnene
# subgraph


top = 5
sig.re = subset(res2@MoBCresults, pvalue < 2)
linkgl = lapply(1:nrow(sig.re), function(ix){

    comm1 = sig.re[ix,1]
    comm2 = sig.re[ix,2]

	link.re = cal.MoBCgenes(res2@graph, 
					community1=res2@filtered.communities[[comm1]], 
					community2=res2@filtered.communities[[comm2]])
    link.re = link.re[1:top,'gene']
})

sig.re%>% bind_rows %>% pull(gene) %>% unique

ixix = 1:4
key.module =sig.re[ixix,] %>% unlist %>% c %>% unique

use.cls = res2@filtered.communities
useg = unlist(use.cls[key.module])
linkg = unlist(linkgl[ixix])
useg = c(useg, linkg)

all.ntkg = res2@graph

g2 = igraph::induced_subgraph(all.ntkg, useg)

setdiff(useg, V(g2)$name)

vcolor = rep('grey', length(igraph::V(g2)$name))
vcolor[igraph::V(g2)$name %in% use.cls[['2']]] = 'orange'
vcolor[igraph::V(g2)$name %in% use.cls[['3']]] = 'dodgerblue'
vcolor[igraph::V(g2)$name %in% use.cls[['5']]] = 'forestgreen'

vcolor[igraph::V(g2)$name %in% use.cls[['6']]] = 'lightpink'
vcolor[igraph::V(g2)$name %in% use.cls[['7']]] = 'plum1'

tcolor = rep(NA, length(igraph::V(g2)$name))
tcolor[igraph::V(g2)$name %in% linkg] = 'white'

tfv = igraph::V(g2)$name %in% linkg
names(tfv) = V(g2)$name

labels = V(g2)$name
labels[!tfv] = ''


plt.dir = '/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/Validation data results/plot'
png(
	# file = paste0(plt.dir,"/comm_2_3_5_linkers_update.png"),
	file = paste0(plt.dir,"/comm_2_3_5_6_7_linkers_update.png"),
	width = 9, height =11, 
    # type='cairo', 
    units = "in", res = 300,  bg='white')

set.seed(47)
layout <- igraph::layout_with_fr(g2)

plot(g2, 
    layout = layout, 
    # mark.groups = split(V(g)$name,clv),
    # vertex.label = fgid1[match(V(g)$name, fgid1$EntrezID),'gene_name'],
    vertex.label = labels,
    vertex.color=vcolor,
    vertex.frame.width=1,
    vertex.frame.color=tcolor,#'white',
    edge.color ='grey', #adjustcolor('black', alpha=0.6),
    # vertex.size= (cln[V(cl.g2)$name]^0.5)*4,
    vertex.size=ifelse(tfv, 8,3),
    # vertex.label.dist=1,
    vertex.label.family='Arial',
    # vertex.frame.color = 'grey90',
    vertex.label.color='black',
    # vertex.label.font=ifelse(V(g)$name %in% np.gl[[pn]], 2,1),
    vertex.label.size = 0.0001,
    edge.width=0.5
)

legend("topleft", 
    # col=c('orange','dodgerblue','forestgreen'), pch=19, 
    # legend=c('M2','M3','M5'))
    # col=c('lightpink','plum1'), pch=19, 
    # legend=c('M6','M7'))
    col=c('orange','dodgerblue','forestgreen','lightpink','plum1'), pch=19, 
    legend=c('M2','M3','M5','M6','M7'))


dev.off()

#---------- all

# subgraph

cls = res2@filtered.communities
useg = unlist(cls)

res2m = res2@MoBCresults

g2 = igraph::induced_subgraph(res2@graph, useg)




vcolor = rep(adjustcolor('grey80', 0.5), length(igraph::V(g2)$name))
vcolor[igraph::V(g2)$name %in% cls[['1']]] = 'black'
vcolor[igraph::V(g2)$name %in% cls[['2']]] = 'orange'
vcolor[igraph::V(g2)$name %in% cls[['3']]] = 'dodgerblue'
vcolor[igraph::V(g2)$name %in% cls[['4']]] = 'red'
vcolor[igraph::V(g2)$name %in% cls[['5']]] = 'forestgreen'
vcolor[igraph::V(g2)$name %in% cls[['6']]] = 'lightpink'
vcolor[igraph::V(g2)$name %in% cls[['7']]] = 'lightgreen'
vcolor[igraph::V(g2)$name %in% cls[['8']]] = 'salmon'

tcolor = rep(NA, length(igraph::V(g2)$name))
tcolor[igraph::V(g2)$name %in% linkg] = 'white'

# tfv = igraph::V(g2)$name %in% linkg
# names(tfv) = V(g2)$name

# labels = V(g2)$name
# labels[!tfv] = ''

plt.dir = '/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/Validation data results/plot'
png(
	file = paste0(plt.dir,"/comm_all.png"),
	# file=paste0(DIR_Presult,"/Cachexia/plt_CAD_dexX/network/method1_clusters_",focus.type,".png"), #kpath c2_cp
	width = 8, height =8, 
    # type='cairo', 
    units = "in", res = 300,  bg='white')

set.seed(3)
layout <- igraph::layout_with_fr(g2)

plot(g2, 
    layout = layout, 
    # mark.groups = split(V(g)$name,clv),
    # vertex.label = fgid1[match(V(g)$name, fgid1$EntrezID),'gene_name'],
    vertex.label = '',#labels,
    vertex.color=adjustcolor(vcolor,alph=0.8),
    vertex.frame.width=1,
    vertex.frame.color="white",#NA,#tcolor,#'white',
    edge.color ='grey70', #adjustcolor('black', alpha=0.6),
    # vertex.size= (cln[V(cl.g2)$name]^0.5)*4,
    vertex.size=3, #ifelse(tfv, 7,3),
    # vertex.label.dist=1,
    vertex.label.family='Arial',
    # vertex.frame.color = 'grey90',
    vertex.label.color='black',
    # vertex.label.font=ifelse(V(g)$name %in% np.gl[[pn]], 2,1),
    vertex.label.size = 0.0001,
    edge.width=0.2
)
legend("bottomleft", 
    # col=c('orange','dodgerblue','forestgreen'), pch=19, 
    # legend=c('M2','M3','M5'))
    # col=c('lightpink','plum1'), pch=19, 
    # legend=c('M6','M7'))
    col=c('black','orange','dodgerblue','red','forestgreen','lightpink','lightgreen','salmon'), pch=19, 
    legend=paste0('M',1:8))

dev.off()





#---------- all + bg

# subgraph

cls = res2@filtered.communities
useg = unlist(cls)

res2m = res2@MoBCresults

all.shortestm = igraph::distances(g, igraph::V(g)$name, unlist(cls))

# candi.gl <- lapply(1:nrow(res2m), function(ixix){
#     cat(ixix,'\n')
#     community1 = cls[[res2m[ixix,'community_1']]]
#     community2 = cls[[res2m[ixix,'community_2']]]

# 	shortestm = igraph::distances(g, community1, community2)
# 	rmin  = apply(shortestm,1,function(xx) colnames(shortestm)[which(xx %in% min(xx))])
# 	cmin  = apply(shortestm,2,function(xx) rownames(shortestm)[which(xx %in% min(xx))])

#     c.sp.genel = sapply(names(cmin), function(start.node){
# 		end.node = cmin[[start.node]]
#         edges = igraph::all_shortest_paths(g, start.node, end.node)
#         edges = edges$res %>% lapply(names) %>% unlist %>% unique
# 		return(edges)
# 	})

#     r.sp.genel = sapply(names(rmin), function(start.node){
# 		end.node = rmin[[start.node]]
#         edges = igraph::all_shortest_paths(g, start.node, end.node)
#         edges = edges$res %>% lapply(names) %>% unlist %>% unique
# 		return(edges)
# 	})
#     c(unlist(c.sp.genel), unlist(r.sp.genel)) %>% unique
# })

candi.gl %>% unlist %>% unique %>% length


useg1 = c(useg, unique(unlist(candi.gl)))
g2 = igraph::induced_subgraph(res2@graph, useg1)




set.seed(2)
layout <- igraph::layout_with_fr(g2)

vcolor = rep(adjustcolor('grey80', 0.5), length(igraph::V(g2)$name))
vcolor[igraph::V(g2)$name %in% cls[['1']]] = 'black'
vcolor[igraph::V(g2)$name %in% cls[['2']]] = 'orange'
vcolor[igraph::V(g2)$name %in% cls[['3']]] = 'dodgerblue'
vcolor[igraph::V(g2)$name %in% cls[['4']]] = 'red'
vcolor[igraph::V(g2)$name %in% cls[['5']]] = 'forestgreen'
vcolor[igraph::V(g2)$name %in% cls[['6']]] = 'lightpink'
vcolor[igraph::V(g2)$name %in% cls[['7']]] = 'lightgreen'
vcolor[igraph::V(g2)$name %in% cls[['8']]] = 'salmon'

tcolor = rep(NA, length(igraph::V(g2)$name))
tcolor[igraph::V(g2)$name %in% linkg] = 'white'

# tfv = igraph::V(g2)$name %in% linkg
# names(tfv) = V(g2)$name

# labels = V(g2)$name
# labels[!tfv] = ''

plt.dir = '/Users/hanbilee/Library/CloudStorage/OneDrive-GCCORP/문서 - AI & BI 연구팀 - Community distance/Community distance/Validation data results/plot'
png(
	file = paste0(plt.dir,"/comm_all.png"),
	# file=paste0(DIR_Presult,"/Cachexia/plt_CAD_dexX/network/method1_clusters_",focus.type,".png"), #kpath c2_cp
	width = 7, height =7, 
    # type='cairo', 
    units = "in", res = 300,  bg='white')

plot(g2, 
    layout = layout, 
    # mark.groups = split(V(g)$name,clv),
    # vertex.label = fgid1[match(V(g)$name, fgid1$EntrezID),'gene_name'],
    vertex.label = '',#labels,
    vertex.color=vcolor, #adjustcolor(vcolor,alph=0.5),
    vertex.frame.width=1,
    vertex.frame.color=NA,#tcolor,#'white',
    edge.color ='grey70', #adjustcolor('black', alpha=0.6),
    # vertex.size= (cln[V(cl.g2)$name]^0.5)*4,
    vertex.size=1, #ifelse(tfv, 7,3),
    # vertex.label.dist=1,
    vertex.label.family='Arial',
    # vertex.frame.color = 'grey90',
    vertex.label.color='black',
    # vertex.label.font=ifelse(V(g)$name %in% np.gl[[pn]], 2,1),
    vertex.label.size = 0.0001,
    edge.width=0.1
)

dev.off()












