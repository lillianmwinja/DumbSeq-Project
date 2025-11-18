
#Importing and reading the dataset
url<- "https://gist.githubusercontent.com/stephenturner/806e31fce55a8b7175af/raw/1a507c4c3f9f1baaa3a69187223ff3d3050628d4/results.txt"
Dumbseq_data<- read.table(url, header = TRUE)
head (Dumbseq_data)
View(Dumbseq_data)

#Generating a volcano plot
# Create a basic volcano plot
with(Dumbseq_data, plot(log2FoldChange, -log10(pvalue),
                        pch = 20, col = "grey",
                        xlab = "Log2 Fold Change",
                        ylab = "-Log10(p-value)",
                        main = "Volcano Plot"))

# Add color to highlight significant genes
with(subset(Dumbseq_data, log2FoldChange > 1 & pvalue < 0.01),
     points(log2FoldChange, -log10(pvalue), pch = 20, col = "purple"))

with(subset(Dumbseq_data, log2FoldChange < -1 & pvalue < 0.01),
     points(log2FoldChange, -log10(pvalue), pch = 20, col = "pink"))

legend("topright", legend = c("Upregulated", "Downregulated"),
       col = c("purple", "pink"), pch = 20)

#Up-regulated genes
up_genes<- subset(Dumbseq_data, log2FoldChange > 1 & pvalue < 0.01)
head(up_genes)
up_genes[order(up_genes$log2FoldChange, decreasing = TRUE),]

#Down-regulated genes
down_genes <- subset(Dumbseq_data, log2FoldChange < -1 & pvalue < 0.01)
head(down_genes)
down_genes[order(down_genes$log2FoldChange, decreasing = TRUE),]

