#!/bin/bash

#SBATCH -p priopark
#SBATCH -A park_contrib
#SBATCH -t 120:00:00
#SBATCH --mem 4000


/n/data1/hms/dbmi/park/jluquette/pta/scan2_used_here_old/SCAN2/bin/scansnv \
    --ref /n/data1/hms/dbmi/park/jluquette/genotyper1/paper/resources/human_g1k_v37_decoy.fasta \
    --dbsnp /n/data1/hms/dbmi/park/jluquette/balance/resources/dbsnp_147_b37_common_all_20160601.vcf \
    --snakefile /n/data1/hms/dbmi/park/jluquette/pta/scan2_used_here_old/SCAN2/snakemake/Snakefile \
    --scripts /n/data1/hms/dbmi/park/jluquette/pta/scan2_used_here_old/SCAN2/scripts \
    --shapeit-panel /n/data1/hms/dbmi/park/jluquette/genotyper1/paper/resources/1000GP_Phase3 \
    --regions-file /n/data1/hms/dbmi/park/jluquette/walsh-1465/regions_1-22_1166windows.txt \
    --output-dir scansnv_fdr01_noX \
    --abmodel-chunks 10 \
    --abmodel-samples-per-chunk 2000 \
    --target-fdr 0.01 \
    --add-chr-prefix \
    --bam UMB5666_F1 /n/data1/bch/genetics/walsh-park/PTA/AD_control_neurons/UMB5666_F1.bam \
    --sc-sample UMB5666_F1 \
    --bam UMB5666_F2 /n/data1/bch/genetics/walsh-park/PTA/AD_control_neurons/UMB5666_F2.bam \
    --sc-sample UMB5666_F2 \
    --bam UMB5666_F5 /n/data1/bch/genetics/walsh-park/PTA/AD_control_neurons/UMB5666_F5.bam \
    --sc-sample UMB5666_F5 \
    --bam UMB5666_bulk /n/data1/bch/genetics/walsh-park/PTA/AD_control_neurons/UMB5666_bulk.bam \
    --bulk-sample UMB5666_bulk \
    --somatic-indels --somatic-indel-pon /n/data1/hms/dbmi/park/jluquette/pta/panels/panel_52_pta_neurons_042521.partial_100pct.mmq60.indels.rda \
    --joblimit 1000 \
    --drmaa ' -p park -A park_contrib --mem={resources.mem} -t 12:00:00 -o %logdir/slurm-%A.log' \
    --resume --snakemake-args ' --keep-going --max-status-checks-per-second 0.1' # --dryrun --quiet'
