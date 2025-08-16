#! /bin/bash
conda run -n pt pip install --no-cache-dir datasets peft transformers bitsandbytes
conda run -n pt pip install --no-cache-dir jupyterlab notebook ipywidgets matplotlib pandas sympy scipy tqdm
conda run -n pt pip install --no-cache-dir accelerate triton
conda run -n pt pip install --no-cache-dir torch torchvision --index-url https://download.pytorch.org/whl/cu129
conda run -n jax pip install --no-cache-dir datasets peft transformers bitsandbytes
conda run -n jax pip install --no-cache-dir jupyterlab notebook ipywidgets matplotlib pandas sympy scipy tqdm
conda run -n jax pip install --no-cache-dir accelerate triton
conda run -n jax pip install --no-cache-dir "jax[cuda12]" "flax[all]"
