#!/usr/bin/bash
#SBATCH --cpus-per-task=16
#SBATCH --mem=64G
#SBATCH -p normal
#SBATCH -q fpgasynthesis
#SBATCH -t 14:00:00
#SBATCH --mail-type=ALL
#SBATCH --mail-user=papeg@mail.upb.de

module reset
module load mpi/OpenMPI/4.1.1-GCC-10.3.0 devel/CMake/3.20.1-GCCcore-10.3.0.lua compiler/Clang/12.0.1-GCCcore-10.3.0.lua fpga/intel/opencl_sdk/18.1.1.lua fpga/bittware/520n/18.1.1_max lang/Python/3.9.5-GCCcore-10.3.0 numlib/ScaLAPACK/2.1.0-gompi-2021a-fb

cd build
make broadcast_broadcast_aoc_build
