#!/bin/bash

# Create necessary directories with correct permissions
mkdir -p /home/ollama/.ollama
chown -R 10014:10014 /home/ollama/.ollama

# Start Ollama in the background
ollama serve &

# Wait for Ollama to start
sleep 5

# Pull the DeepSeek Coder model
ollama pull deepseek-coder:latest

# Kill the background Ollama process
pkill ollama 