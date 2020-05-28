# Affymetrix-HTA2.0-Transcript-cluster-annotation
App to illustrate the history of transcript cluster annotations of the Affy array HTA2.0

Rational: since some annotations have been changed from release to release and I noticed that different people have been working with the same HTA2.0 gene-level dataset, but using different releases, there 
 was the idea to establish an easy method to compare the annotations using e.g. a shiny app.

The small and straightforward app shows the annotation history of HTA2.0 transcript clusters according to http://www.affymetrix.com/support/technical/byproduct.affx?product=human_transcriptome.

In brief, all available releases e.g. 33-36 were downloaded and matched by the column transcript_cluster_id. The app allows the user to search for multiple ids in the search field (of note, not all ids are shown due to speed issues). After a selection, the gene_assignment is illustrated for the id stratified by the release history. Furthermore all available columns are shown in a table at the bottom of the single-page-app.

# Running application

Get a first impression of the first 100 probes per chromosome using 

    lapply(c("shiny", "tidyverse", "DT"), function(x) if(!require(x,character.only = TRUE)) install.packages(x))
    shiny::runGitHub("roman-tremmel/Affymetrix-HTA2.0-Transcript-cluster-annotation")

The full dataset can be downloaded here https://alioth.workupload.com/download/NpKCD7p9xmS. The 
Then
