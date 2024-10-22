# 🚀 **Serving a Custom LLM for Multiple Users**

Whether you're serving **employees in your company** or **users of your app**, deploying a Large Language Model (LLM) requires choosing between two major options:

1. **SaaS Services** like OpenAI, Anthropic, and many others.  
   💼 *Pro*: No infrastructure needed, fast setup.  
   🛠️ *Con*: Dependency on external providers, pricing per usage.

2. **Inference Servers** capable of handling **multiple concurrent requests**.  
   🌐 *Pro*: Full control over the deployment, cost-effective at scale.  
   ⚙️ *Con*: Infrastructure setup and maintenance.


## 🔍 **This Repository**

As a community, we will collect and explore various approaches to serving LLMs in different environments, such as **on-premises** 🏢 or even **air-gapped environments** 🔒. Our goal is to collaboratively evaluate and share best practices.
- ⚙️ [Bare metal (multi-GPU) and GPU virtual machines](./bare-metal/readme.md) 
- 💻 [RunPod](./runpod/readme.md)  
- Vast AI


## 🚀 **Performance Comparison**

We will compare the **performance** of multiple inference servers, including:
- 🏅 **vLLM**  
- 🚀 **TGI**  
- 💡 **SGlang**  
- 💻 **Aphrodite**


## 🎛️ **Inference UIs**

We will also explore different UIs for serving LLMs:
- 🌐 **AnythingLLM**


## **Grafana enabled**
All that you need to monitor your AI cluster
![gpu](https://github.com/gen-mind/inference/blob/main/assets/gpu.jpg?raw=true)

![gpu](https://github.com/gen-mind/inference/blob/main/assets/tgi.jpg?raw=true)

![gpu](https://github.com/gen-mind/inference/blob/main/assets/token_s.jpg?raw=true)

![gpu](https://github.com/gen-mind/inference/blob/main/assets/traefik.jpg?raw=true)

## 🧮 **Quantization**: What, When, and Why?

**Quantization** reduces the precision of model weights (e.g., from FP32 to INT8) to make the model more lightweight and faster. But when should you use it?

✅ **When to use**:  
- 🖥️ Low-memory environments  
- ⚡ Need for speed and efficiency

❌ **When NOT to use**:  
- 🎯 If precision is critical for your application  
- 🔬 For tasks requiring fine-tuned model accuracy


## 🎉 **Join the Community!**

This repository is a community effort, and we invite contributions, discussions, and ideas from everyone interested in serving LLMs! 🤝 Together, we will explore and document different configurations and approaches to help the entire community grow.

Stay tuned as we collaborate on this journey! 😄






