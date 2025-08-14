#! /bin/bash
conda run -n cenv pip install --no-cache-dir datasets==2.18.0 peft==0.5.0 transformers==4.36.0 bitsandbytes==0.41.1
conda run -n cenv pip install --no-cache-dir notebook ipywidgets matplotlib pandas sympy scipy tqdm
conda run -n cenv pip install --no-cache-dir accelerate triton
