# Ollama DeepSeek Coder Deployment

This repository contains the configuration for deploying Ollama with the DeepSeek Coder model on WSO2 Choreo.

## Prerequisites

- Docker installed on your local machine
- Access to WSO2 Choreo platform
- GPU support (recommended)

## Local Development

1. Build and run using Docker Compose:
```bash
docker-compose up --build
```

2. The Ollama API will be available at `http://localhost:11434`

## WSO2 Choreo Deployment

1. Push this repository to your Git provider (GitHub, GitLab, etc.)
2. Create a new Container component in WSO2 Choreo
3. Connect your repository and select the main branch
4. Configure the deployment settings:
   - Set resource requirements as specified in choreo.yaml
   - Ensure GPU support is enabled
5. Deploy the container

## Testing the Deployment

Once deployed, you can test the Ollama API using curl:

```bash
curl http://your-choreo-url:11434/api/generate -d '{
  "model": "deepseek-coder",
  "prompt": "Write a hello world program in Python"
}'
```

## Resource Requirements

- Memory: 8GB minimum
- CPU: 4 cores minimum
- GPU: Required for optimal performance

## Notes

- The DeepSeek Coder model will be automatically pulled during container startup
- Initial startup may take several minutes while the model is being pulled
- Make sure your Choreo environment has sufficient resources allocated 