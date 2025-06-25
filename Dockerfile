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

# Create a non-root user
RUN groupadd -r ollama && useradd -r -g ollama -s /bin/bash -d /home/ollama ollama \
    && mkdir -p /home/ollama \
    && chown -R ollama:ollama /home/ollama

# Set working directory and permissions
WORKDIR /app
COPY --from=builder /app/pull-model.sh /app/
RUN chown -R ollama:ollama /app

# Switch to non-root user
USER ollama

# Expose Ollama port
EXPOSE 11434

# Set entrypoint
ENTRYPOINT ["/bin/bash", "-c", "/app/pull-model.sh && ollama serve"] 