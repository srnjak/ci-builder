# Use a minimal base image
FROM debian:buster

# Install SSH client, GnuPG (GPG), and Git
RUN apt-get update && \
    apt-get install -y openssh-client gnupg git

# Set a generic working directory that makes sense regardless of the CI tool
WORKDIR /workspace

# Create a symbolic link to harmonize GitHub Actions default directory
RUN mkdir -p /github/workspace && \
    ln -s /workspace /github/workspace

# Command to run when starting the container
CMD ["bash"]
