# Jackbox Utility - Kasm Workspace Image

This repository contains a Kasm workspace image for running [Jackbox Utility](https://github.com/JackboxUtility/JackboxUtility) in a containerized environment.

[![🐳 Docker Build & Publish](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/actions/workflows/docker-publish.yml)
[![Latest Release](https://img.shields.io/github/v/release/DevelopmentCats/Jackbox-Utility-Kasm?logo=github)](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/releases)

## Features

- Based on Kasm Ubuntu Jammy image
- Pre-installed Jackbox Utility with all required dependencies
- Desktop integration for easy access
- Containerized environment for running Jackbox games
- Automatic updates via GHCR releases

## Using the Image

### From GHCR (Recommended)

The image is available on GitHub Container Registry. You can pull it using:

```bash
docker pull ghcr.io/developmentcats/jackbox-utility-kasm:latest
```

Or a specific version:

```bash
docker pull ghcr.io/developmentcats/jackbox-utility-kasm:v1.0.0
```

### Building Locally

To build the image locally:

```bash
docker build -t jackbox-utility-kasm .
```

## Running the Container

The container should be run through Kasm Workspaces. However, for testing purposes, you can run it directly with Docker:

```bash
docker run --rm -it \
  -p 6901:6901 \
  -e KASM_PORT=6901 \
  ghcr.io/developmentcats/jackbox-utility-kasm:latest
```

Then access the workspace at: https://localhost:6901 (Password: `kasm_user`)

## Notes

- This image is intended to be used with Kasm Workspaces
- Game launching functionality requires additional setup and testing
- Make sure to configure proper permissions and access to Steam/game directories when needed

## Releases

Images are automatically built and published to GHCR on:
- Every push to the main branch (tagged as `latest`)
- Every tag push (tagged as version number)

You can find all available versions on our [GitHub Container Registry](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/pkgs/container/jackbox-utility-kasm).

## License

This project is licensed under the same terms as Jackbox Utility (GPL-3.0). 