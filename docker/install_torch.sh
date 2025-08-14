#! /bin/bash
# Install pytorch and compile for latest version
git clone --recursive https://github.com/pytorch/pytorch
cd pytorch
git checkout v2.0.1
git submodule sync
git submodule update --init --recursive
conda install -n cenv nvidia/label/cuda-12.9.1::cuda-toolkit nvidia/label/cudnn-9.11.0::cudnn -y
conda install -n cenv -c nvidia nccl -y
conda install -n cenv cmake ninja mkl mkl-include -y
conda install -n cenv -c conda-forge magma -y
conda run -n cenv pip install -r requirements.txt
conda run -n cenv pip install six
CMAKE_PREFIX_PATH=${CONDA_PREFIX:-"$(dirname $(which conda))/../"} conda run -n cenv python setup.py develop
cd ../
rm -rf pytorch