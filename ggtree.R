library(treeio)
library(ggtree)
tree <- read.newick("03_IQTREE.treefile", node.label = "support") 
# taxa_list <- readxl::read_xlsx("~/Trees/ITS_taxa_list.xlsx") #read taxa ID and taxa Name
# tree_renamed =  rename_taxa(tree, taxa_list, tip_lable, taxa_name)
new_species <- c("SAJIT3462") #assign new species, highlight at the next step
p1 <- ggtree(tree, branch.length = 'none') + 
  geom_tiplab(aes(color = label %in% new_species), size = 4, fontface="italic", hjust = -.2) +
  xlim(NA, 15) + scale_color_manual(values=c("black", "red")) + 
  theme(legend.position='none') #initial tree
p2 <- p1 + geom_text(aes(label=node)) #show node number
p3 <- p1 + geom_strip(1, 4, color = "orange", barsize = 3, offset = 5, label = "Outgroup", offset.text = 0.6, fontsize = 6, hjust = "center", extend = 0.1, angle = 90) #add outgroup bar
p4 <- p3 + geom_strip(8, 18, color = "seagreen", barsize = 3, offset = 5, label = "Hydrostachys", offset.text = 0.6, fontsize = 6, hjust = "center", extend = 0.1, angle = 90) #add ingroup bar
# p5 <- p4 + geom_treescale(fontsize=3, linesize=0.5, offset=-0.5) #add scale
p5 <- p4 + geom_text2(aes(subset=!isTip, label=support), hjust=-0.3, size=3, color="deepskyblue4") #add support value
