

include { DEMUX } from './modules/demux.nf'


workflow {
    read1_ch = channel.fromPath("Undetermined_S0_R1_001.fastq.gz")
    read3_ch = channel.fromPath("Undetermined_S0_R3_001.fastq.gz")
    insert1_ch = channel.fromPath("Undetermined_S0_I1_001.fastq.gz")
    insert2_ch = channel.fromPath("Undetermined_S0_I2_001.fastq.gz")
    
    samplesheets_ch = channel.fromPath("samplesheet.tsv")
    
    demux(read1_ch, read3_ch, insert1_ch, insert2_ch, samplesheets_ch)
}