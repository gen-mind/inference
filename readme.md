How can I serve a custom LLM for multiple users?
Whatever those users are the employyee of your company, or the user's of the app you are developing, 
if you want to serve an LLM there are two options:
- Use a SaaS service, like OpenAI, Anthropic and many others
- Deploy an inference server able to serve multiple concurrent requests

describe differences

In these repo I'll collect all the possible approaches to serve the LLM inside the 
boundary that fits my needs which will include, cloud, on-premises or even air-gaped 

I want also to compare performances of different inference servers
https://www.reddit.com/r/LocalLLaMA/comments/1f0txwc/what_is_the_best_inference_engine_for_a/

what is quantization
when to use it and when not

vLLM benchmark https://github.com/LambdaLabsML/vllm-benchmark
vLLM disable usage stats
about https://docs.vllm.ai/en/latest/serving/distributed_serving.html

- runpod
- lambda labs (multi-gpu) https://github.com/LambdaLabsML/llama/tree/main/deployment
- bare metal
- ray serve https://docs.ray.io/en/latest/serve/index.html

https://www.reddit.com/r/LocalLLaMA/comments/1fw5ffm/kvcompress_kv_cache_compression_for/

Inference server
- VLLM
- TGI
- SGlang
- Aphrodite

Inference UI
- AnythingLLM