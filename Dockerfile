FROM python:3.13-slim

# Install pipx and git
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    pipx \
    && rm -rf /var/lib/apt/lists/*

# Ensure pipx installs to PATH
ENV PATH="/root/.local/bin:$PATH"

# Install AD-Miner via pipx from GitHub
RUN pipx install 'git+https://github.com/Mazars-Tech/AD_Miner.git'

# Set working directory (optional, for mounting cache or running commands)
WORKDIR /workspace

# Default command (replace with actual params or override when running)
CMD ["AD-miner", "--help"]
