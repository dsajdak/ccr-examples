#!/bin/bash -l

##   This file is intended to serve as a template to be downloaded and modified for your use case.
##   For more information, refer to the following resources whenever referenced in the script-
##   README- https://github.com/ubccr/ccr-examples/tree/main/slurm/2_Applications/matlab/README.md
##   DOCUMENTATION- https://docs.ccr.buffalo.edu/en/latest/hpc/jobs

##   Select a cluster, partition, qos and account that is appropriate for your use case
##   Available options and more details are provided in README
#SBATCH --cluster=[cluster]
#SBATCH --partition=[partition]
#SBATCH --qos=[qos]
#SBATCH --account=[SlurmAccountName]

##   Job runtime limit. Format- dd:hh:mm
#SBATCH --time=00:01:00

##   Refer to DOCUMENTATION for details on the next three directives

##   Number of nodes
#SBATCH --nodes=1

##   Allocate CPUs per task
#SBATCH --cpus-per-task=1

##   Number of "tasks" per node (use with distributed parallelism)
#SBATCH --ntasks-per-node=24

##   Specify real memory required per node. Default units are megabytes
#SBATCH --mem=64000

module load ansys
export LSTC_LICENSE=ansys
echo $SLURM_NPROCS

# replace with your model file name
MODEL=ball_and_plate.k

##   For single precision use this
$EBROOTANSYS/v231/ansys/bin/linx64/lsdyna_sp.e ncpus=$SLURM_NPROCS i=$MODEL

##   For double precision use this, uncommenting the next line and commenting out the line above
##   $EBROOTANSYS/v231/ansys/bin/linx64/lsdyna_dp.e ncpus=$SLURM_NPROCS i=$MODEL

echo 'all done'
exit

