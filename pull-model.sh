#!/bin/bash

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start
sleep 5

# Pull the DeepSeek Coder model
ollama pull deepseek-coder:latest

# Kill the background Ollama process
pkill ollama 