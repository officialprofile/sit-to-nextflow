#!/usr/bin/env nextflow
nextflow.enable.dsl=2

process SALMON {
    
    script:
    """
    #!/usr/bin/env Rscript
    print('cos')
    
    """
}

workflow {
    SALMON()
}