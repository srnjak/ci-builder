# Use a minimal base image
FROM ubuntu:24.04

# Install SSH client, GnuPG (GPG), and Git
RUN apt-get update && \
    apt-get install -y openssh-client gnupg git

# Set a generic working directory that makes sense regardless of the CI tool
WORKDIR /workspace

# Create a symbolic link to harmonize GitHub Actions default directory
RUN mkdir -p /github/workspace && \
    ln -s /workspace /github/workspace

# Prepare gpg environment
# Ensure the .gnupg directory exists and set appropriate permissions
RUN mkdir -p /root/.gnupg && \
    chmod 700 /root/.gnupg

# Set GPG to use loopback mode for passphrase input
RUN echo "use-agent" >> /root/.gnupg/gpg.conf && \
    echo "pinentry-mode loopback" >> /root/.gnupg/gpg.conf && \
    echo "allow-loopback-pinentry" >> /root/.gnupg/gpg-agent.conf

# Restart GPG-Agent to apply configuration changes
RUN echo RELOADAGENT | gpg-connect-agent

# Command to run when starting the container
CMD ["bash"]
