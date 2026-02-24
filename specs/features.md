# Features

## Feature 1: Test Opencode Docker build

As a developer, I want to verify that opencode works in Docker on Apple Silicon, so that I can use ralph-wiggum with opencode.

### Scenario: Build and verify opencode Docker image
- Given a working Dockerfile.opencode
- When I build the Docker image
- Then opencode should be available in the container
