
## Set working directory
setwd("location/where/tabulated/data/stored")
output_format = "CSV" # Option to output as CSV or TXT

subjects <- read.delim("abcd_mri01.txt")
subjects <- subjects[-c(1),] # Remove label row if present
subjects <- subjects[!(subjects$mri_info_manufacturer=="Philips Medical Systems"),]
subjects <- subset(subjects, select=subjectkey)

for (tabulated_data in c("abcd_betnet02.txt",
                          "abcd_midabwdp01.txt",
                          "abcd_midabwdp202.txt",
                          "abcd_midasemdp101.txt",
                          "abcd_midasemdp202.txt",
                          "abcd_midasemp102.txt",
                          "abcd_midasemp202.txt",
                          "abcd_midr1bwdp101.txt",
                          "abcd_midr1bwdp202.txt",
                          "abcd_midr1bwp102.txt",
                          "abcd_midr1bwp202.txt",
                          "abcd_midr2semp102.txt",
                          "abcd_midr2semp202.txt",
                          "abcd_midsemp102.txt",
                          "abcd_midsemp202.txt",
                          "abcd_tfabwdp101.txt",
                          "abcd_tfabwdp201.txt",
                          "abcd_tfnbr1semdp101.txt",
                          "abcd_tfnbr1semdp201.txt",
                          "abcd_tfnbr2bwdp101.txt",
                          "abcd_tfnbr2bwdp201.txt",
                          "abcd_tfnbr2dp101.txt",
                          "abcd_tfnbr2dp201.txt",
                          "abcd_tfncr1bwdp101.txt",
                          "abcd_tfncr1bwdp201.txt",
                          "abcd_tfsstabwdp101.txt",
                          "abcd_tfsstabwdp201.txt",
                          "abcd_tfsstasemdp101.txt",
                          "abcd_tfsstasemdp201.txt",
                          "abcd_tfsstr1bwdp101.txt",
                          "abcd_tfsstr1bwdp201.txt",
                          "abcd_tfsstr1semdp101.txt",
                          "abcd_tfsstr1semdp201.txt",
                          "abcd_tfsstr2bwdp101.txt",
                          "abcd_tfsstr2bwdp201.txt",
                          "abcd_tfsstr2semdp101.txt",
                          "abcd_tfsstr2semdp201.txt",
                          "abcd_tmidr1semdp101.txt",
                          "abcd_tmidr1semdp202.txt",
                          "abcd_tnbasemdp101.txt",
                          "abcd_tnbasemdp201.txt",
                          "abcd_tr2bwdp01.txt",
                          "abcd_tr2bwdp202.txt",
                          "abcd_tr2semdp101.txt",
                          "abcd_tr2semdp202.txt",
                          "midaparc03.txt",
                          "midaparcp203.txt",
                          "midr2bwp102.txt",
                          "midr2bwp202.txt",
                          "mrirscor02.txt",
                          "mrisst02.txt",
                          "mrisstr1bw01.txt",
                          "mrisstr1sem01.txt",
                          "mrisstr2bw01.txt",
                          "mrisstr2bwsem01.txt",
                          "mrisstsem01.txt",
                          "nback_bwroi02.txt",
                          "nbackallsem01.txt",
                          "nbackr101.txt",
                          "nbackr1sem01.txt",
                          "nbackr201.txt",
                          "nbackr2sem01.txt"))
{
  if (file.exists(tabulated_data)){
    print(paste("Processing",tabulated_data), quote=FALSE)
    df <- read.delim(tabulated_data)
    df <- df[-c(1),] # Remove label row if present
    df <- merge(subjects,df,by="subjectkey")
    if (output_format == "CSV"){
      outfile <- paste0("new_",tabulated_data,".csv")
      write.csv(df, outfile, row.names = FALSE) # Write out as CSV
    } else {
      outfile <- paste("new_",tabulated_data)
      write.delim(df, outfile, row.names = FALSE) # Write out as deliminated txt
    }
  } else {
    print(paste("Unable to locate",tabulated_data), quote=FALSE)
  }
}
print("Completed")

