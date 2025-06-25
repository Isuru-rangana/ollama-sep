FROM ollama/ollama:latest as builder

# Install necessary dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy the model pulling script
COPY pull-model.sh /app/
RUN chmod +x /app/pull-model.sh

FROM builder as final

# Set working directory
WORKDIR /app

# Copy files from builder
COPY --from=builder /app/pull-model.sh /app/

# Expose Ollama port
EXPOSE 11434

# Set entrypoint
ENTRYPOINT ["/bin/bash", "-c", "/app/pull-model.sh && ollama serve"] 