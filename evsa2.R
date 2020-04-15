# Plot with inset of actual vs. expected isolates from LSUCC data

# Clear existing settings and data
rm(list=ls())

# Required libraries
require(ggplot2)
#require(ggrepel)
require(grid)
#require(RColorBrewer)

# cb_Palettelg <- c("#009E73", "#ff7f50", "#808080", "#e79f00", "#9ad0f3", "#0072B2", "#D55E00", "#CC79A7", "#333366", "#000000", "#F0E442")
# Okabe Ito colors
cb_friendly <- c("#E69F00", "#56B4E9", "#009E73", "#CC79A7", "#F0E442", "#0072B2", "#999999")
# modified from https://htmlpreview.github.io/?https://github.com/clauswilke/practical_ggplot2/blob/master/corruption_human_development.html

##############################################################

# Read in the data
evsa<-read.csv("~/Google Drive File Stream/My Drive/Thrash_Lab_Projects/Henson_BOR_2020/Analyses/Temperton_model/final_abundances.csv")

ggplot() +
geom_jitter(data=evsa, aes_string(
  y="num_observed", 
  x="pure_well_med", 
  size="dot.size", 
  col="high_low"), 
  alpha=0.5, width = 0.1, height = 0.05) +  
#geom_jitter(size="dot.size", width=0.05, alpha=0.4) +
  scale_colour_manual(values = cb_friendly) +
  scale_size_continuous(breaks=c(2,5,10,14)) +
#  scale_color_manual(values = c("blue","red","dark grey")) +
#  geom_errorbar(
#    aes(ymin=pure_well_95pc_low, ymax=pure_well_95pc_high),
#    width=0.1, 
#    linetype="dotted",
#    position = position_dodge(width = 0.2)) +
  geom_abline(intercept = 0, color="black", linetype="dotted", alpha=0.6) +
  labs(x="Expected ASV isolates per experiment", y="Actual ASV isolates per experiment", size="Deviance", col="") +
  theme_minimal() 
 