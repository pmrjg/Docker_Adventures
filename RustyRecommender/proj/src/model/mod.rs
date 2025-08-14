use candle_core::{DType, Device, Result, Tensor};
use candle_nn::{Embedding, Module, VarBuilder};
use serde::Deserialize;

const DEVICE: Device = Device::Gpu;

