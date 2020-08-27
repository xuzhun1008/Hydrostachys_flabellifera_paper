library(treeio)
library(ggtree)
tree <- read.newick("v2.4.contree", node.label = "support") 
taxa_list <- read.csv("ITS_taxa_list_v2.4.csv") #read taxa ID and taxa Name
tree_renamed =  rename_taxa(tree, taxa_list, tip_lable, taxa_name)
new_species <- c("Hydrostachys flabellifera SAJIT3462") #assign new species, highlight at the next step
p1 <- ggtree(tree_renamed, branch.length = 'none') + 
  geom_tiplab(aes(color = label %in% new_species), size = 4, fontface="italic", hjust = -0.01) +
  xlim(NA, 14) + scale_color_manual(values=c("black", "red")) + 
  theme(legend.position='none') #initial tree
p2 <- p1 + geom_text(aes(label=node)) #show node number
p3 <- p1 + geom_strip(3, 4, color = "orange", barsize = 3, offset = 6.5, label = "Outgroup", offset.text = 0.3, fontsize = 6, hjust = "center", extend = 0.1, angle = 90) #add outgroup bar
p4 <- p3 + geom_strip(5, 10, color = "seagreen", barsize = 3, offset = 6.5, label = "Hydrostachys", offset.text = 0.3, fontsize = 6, hjust = "center", extend = 0.1, angle = 90) #add ingroup bar
p5 <- p4 + geom_text2(aes(subset=!isTip, label=support), hjust=-0.3, size=3, color="deepskyblue4") #add support value


detach("package:ggtree", unload = TRUE)  
detach("package:treeio", unload = TRUE) 
# Clear plots
dev.off() 
