% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/OneStep_PRC_Mayer.R
\name{OneStep_PRC_Mayer}
\alias{OneStep_PRC_Mayer}
\title{Generate precision recall curve and related statistics directly from bam files in mayer's method.}
\usage{
OneStep_PRC_Mayer(
  bam_ip,
  bam_input,
  txdb,
  bsgenome = NULL,
  paired_end = FALSE,
  ground_truce_gr,
  exp_label = "MeRIP_experiment_1",
  N = 200
)
}
\arguments{
\item{bam_ip}{a vector containing the BAM files for IP samples.}

\item{bam_input}{a vector containing the BAM files for input samples.}

\item{txdb}{a TxDb object for the transcript annotation.}

\item{bsgenome}{a BSgenome object for the genome sequence.}

\item{paired_end}{a logical value indicating wheather the data is paired end sequencing; default = FALSE.}

\item{ground_truce_gr}{a GRanges for the ground truce of positive methylation sites, recommended to be in single based resolution.}

\item{exp_label}{a character for the label of the experiment; default = "MeRIP_experiment_1".}

\item{N}{number of points sampled for each PRC curve; default = 200.}
}
\value{
The table for AUPRC and the AUROC curve will be saved on the disc under a folder named by exp_label.
}
\description{
Generate precision recall curve and related statistics directly from bam files in mayer's method.
}
\examples{
library(exomePeak2Test)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(exomePeak2)
library(BSgenome.Hsapiens.UCSC.hg19)

whistle_predict <- readRDS("predictedResults.rds")
whistle_gr <- readRDS("exon_DRACH.rds")
whistle_gr$prob <- whistle_predict

OneStep_PRC_Mayer(bam_ip = c("bam_local/SRR1035214_sorted.bam",
                       "bam_local/SRR1035216_sorted.bam",
                       "bam_local/SRR1035222_sorted.bam",
                       "bam_local/SRR1035224_sorted.bam"),
            bam_input = c("bam_local/SRR1035213_sorted.bam",
                          "bam_local/SRR1035215_sorted.bam",
                          "bam_local/SRR1035221_sorted.bam",
                          "bam_local/SRR1035223_sorted.bam"),
            txdb = TxDb.Hsapiens.UCSC.hg19.knownGene,
            bsgenome = Hsapiens,
            paired_end = FALSE,
            ground_truce_gr = whistle_gr[whistle_gr$prob > 0.5],
            exp_label = "MeRIP_experiment_1",
            N = 200)

}
