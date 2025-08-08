#! /bin/bash
conda run -n cenv pip install --no-cache-dir datasets==2.18.0 peft==0.5.0 transformers==4.36.0 bitsandbytes==0.41.1
conda run -n cenv pip install --no-cache-dir notebook ipywidgets matplotlib pandas sympy scipy tqdm
conda run -n cenv pip install --no-cache-dir accelerate triton
conda install -n cenv pytorch==2.0.1 torchvision==0.15.2 torchaudio==2.0.2 pytorch-cuda=11.7 -c pytorch -c nvidia