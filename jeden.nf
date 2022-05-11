#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.analyze_text = 'Silesia is not in Poland'

process splitLetters {
  output:
    path 'chunk_*'

  """
  printf '${params.analyze_text}' | split -b 6 - chunk_
  """
}

process convertToUpper {
  input:
    file x
  output:
    stdout

  """
  rev $x
  """
}

workflow {
  splitLetters | flatten | convertToUpper | view { it.trim() }
}