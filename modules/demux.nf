process DEMUX {
  
    container 'fastq_demux:master'
    containerOptions '--entrypoint=""'
    publishDir path: 'fastq', mode: 'copy'
    
    input:
    file(read1)
    file(read3)
    file(insert1)
    file(insert2)
    file(samplesheets)
    
    output:
    path('*')
    
    script:
    """
    fastq_demux \
    --R1 ${read1} \
    --R2 ${read3} \
    --I1 ${insert1} \
    --I2 ${insert2} \
    --samplesheet ${samplesheets} --mismatches 1 --outdir .
    """
}
