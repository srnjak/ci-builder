# CI Builder
(ci-builder)

This Dockerfile creates a Docker image which includes the various tools required for Continuous Integration (CI) pipelines.

The image contains the following tools:

- **Git**: Version control system that enables tracking changes in source code during the development process.
- **SSH**: Ensures secure communication for CI tasks such as accessing private repositories or remote servers, critical for operations that require authenticated connections.
- **GnuPG (gnupg2)**: Enables the signing of artifacts, which is vital for verifying the integrity and ensuring the security of distributed builds in various environments.
