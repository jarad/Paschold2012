#' Paschold et. al. (2012) data
#' 
#' A data set containing RNAseq counts for 4 replicates of each of 4 genotypes:
#' B73, Mo17, B73xMo17, and Mo17xB73. The total count is provided as well as the count
#' attributed to the B73 and Mo17 genomes based on comparison to the reference B73 genome
#' and known single nucleotide polymorphisms between the B73 and Mo17 genomes. 
#' 
#' @format A \code{data.frame} with 634,496 rows and 6 variables:
#' \describe{
#'   \item{GeneID}{gene identifier}
#'   \item{genotype}{B73, Mo17, B73xMo17, or Mo17xB73}
#'   \item{replicate}{1-4, the replicate sample for that genotype}
#'   \item{flow_cell}{1-2, two flow cells were used in the experiment, replicates 1 and 2 
#'                    are on flow cell 1 and replicates 3 and 4 are on flow cell 2}
#'   \item{B73}{read count attributed to B73 genome}
#'   \item{Mo17}{read count attributed to Mo17 genome}
#'   \item{total}{read count for that gene}
#' }
#' @details
#' Provides RNA sequencing experiment used in Paschold et. al. (2012). 
#' The data consist of RNAseq counts for 39,656 "genes" for 4 replicates for two 
#' parental varieties of maize and their two crosses: Mo17, B73, Mo17xB73, and 
#' B73xMo17. In addition to the count for each replicate-sample combination, the 
#' data also contain the counts by parental genotype. 
#' 
#' The data have been lengthed so that each gene-sample combination is in a unique row with B73 and 
#' Mo17 indicating the count for each gene attributed to B73 and Mo17 genome and 
#' the total column indicating the total count for that gene. As some genes can not be 
#' attributed to a particular genome, the sum of the B73 and Mo17 columns should be less
#' than or equal to the total column. Non-zero counts in the B73 column for the Mo17 genotype 
#' (and the reverse) indicate false positive reads.
#' @references
#' Paschold, A., Jia, Y., Marcon, C., Lund, S., Larson, N.B., Yeh, C.T., Ossowski, S., 
#' Lanz, C., Nettleton, D., Schnable, P.S. and Hochholdinger, F., 2012. Complementation 
#' contributes to transcriptome complexity in maize (Zea mays L.) hybrids relative to 
#' their inbred parents. Genome research, 22(12), pp.2445-2454.
#' @examples
#' \dontrun{
#' 
#' # Reshape to wide format
#' library(dplyr)
#' wide = Paschold2012 %>%
#'   mutate(genotype_replicate = paste(genotype,replicate,sep="_")) %>%
#'     select(GeneID, genotype_replicate, total) %>%
#'       tidyr::spread(genotype_replicate, total)
#' dim(wide)
#' 
#' # Differential expression data set
#' differential_expression = Paschold2012 %>%
#'   filter(genotype %in% c("B73","Mo17")) %>%
#'   rename(count=total) %>%
#'   select(GeneID, genotype, replicate, count)
#' 
#' # Heterosis data set
#' heterosis = Paschold2012 %>%
#'   select(-B73, -Mo17)
#' 
#' # Allele specific expression data set
#' allele = Paschold2012 %>%
#'   select(-total) %>%
#'   filter(genotype %in% c("B73xMo17","Mo17xB73"))
#' }
"Paschold2012"
