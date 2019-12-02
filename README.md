ABCD Release 2.0.1 fMRI-cleanup README

Issue:
Due to incorrect post-processing, all task and resting-state fMRI data obtained on Phillips scanners should be excluded from all analyses. This includes tabulated and minimally processed data. This issue does not affect other modalities (sMRI, dMRI) or raw DICOM data (Fast Track). In DEAP and RDS, Philips fMRI data has been removed. They will be corrected and made available with Data Release 3.0. The field map direction for these data was mistakenly flipped, which led to increased distortion in processed fMRI images. 1512 participants are affected by this issue, which is 13% of baseline MRI visits.

Recommendations: 
We recommend that all users re-run fMRI related analyses without the Philips fMRI data. For published studies, we encourage users to confirm findings without the Philips fMRI data and provide a corrigendum with the updated results. 

Instructions:
This R script is to parse the ABCD Release 2.0.1 fMRI tabulated data to remove subjects that have incorrect post-processing distortion correction. 

1. Open the fMRI-cleanup.R in R, RStudio or preferred text editor.'
2. Edit the working directory (line 2: setwd) to point to a location that contains the ABCD Release 2.0.1 tabulated fMRI text files downloaded from NDA. The full list of affected fMRI instruments is list below. Instruments from previous releases may have different names:

abcd_betnet02.txt
abcd_midabwdp01.txt
abcd_midabwdp202.txt
abcd_midasemdp101.txt
abcd_midasemdp202.txt
abcd_midasemp102.txt
abcd_midasemp202.txt
abcd_midr1bwdp101.txt
abcd_midr1bwdp202.txt
abcd_midr1bwp102.txt
abcd_midr1bwp202.txt
abcd_midr2semp102.txt
abcd_midr2semp202.txt
abcd_midsemp102.txt
abcd_midsemp202.txt
abcd_tfabwdp101.txt
abcd_tfabwdp201.txt
abcd_tfnbr1semdp101.txt
abcd_tfnbr1semdp201.txt
abcd_tfnbr2bwdp101.txt
abcd_tfnbr2bwdp201.txt
abcd_tfnbr2dp101.txt
abcd_tfnbr2dp201.txt
abcd_tfncr1bwdp101.txt
abcd_tfncr1bwdp201.txt
abcd_tfsstabwdp101.txt
abcd_tfsstabwdp201.txt
abcd_tfsstasemdp101.txt
abcd_tfsstasemdp201.txt
abcd_tfsstr1bwdp101.txt
abcd_tfsstr1bwdp201.txt
abcd_tfsstr1semdp101.txt
abcd_tfsstr1semdp201.txt
abcd_tfsstr2bwdp101.txt
abcd_tfsstr2bwdp201.txt
abcd_tfsstr2semdp101.txt
abcd_tfsstr2semdp201.txt
abcd_tmidr1semdp101.txt
abcd_tmidr1semdp202.txt
abcd_tnbasemdp101.txt
abcd_tnbasemdp201.txt
abcd_tr2bwdp01.txt
abcd_tr2bwdp202.txt
abcd_tr2semdp101.txt
abcd_tr2semdp202.txt
midaparc03.txt
midaparcp203.txt
midr2bwp102.txt
midr2bwp202.txt
mrirscor02.txt
mrisst02.txt
mrisstr1bw01.txt
mrisstr1sem01.txt
mrisstr2bw01.txt
mrisstr2bwsem01.txt
mrisstsem01.txt
nback_bwroi02.txt
nbackallsem01.txt
nbackr101.txt
nbackr1sem01.txt
nbackr201.txt
nbackr2sem01.txt

3. This folder also requires the MRI Info instrument (abcd_mri01.txt).
4. Edit the output format (line  3: output_format) to export as either a csv file "CSV" or the original text format "TXT".
Run the R script. As the files are large it can take a few minutes per table. Updated tables are created in the working directory with a "new_" prefix. Ensure there is enough disk space to create a copy of all the data to be processed.  

Alternative datasets available:
Additionally, a secondary release of processed ABCD fMRI data not affected by this issue will be shared shortly in NDA collection #3165 (https://nda.nih.gov/edit_collection.html?id=3165).  These data have been processed through the ABCD-BIDS pipelines (https://github.com/ABCD-STUDY/abcd-hcp-pipeline). This collection will provide minimally processed data, but not tabulated data.
