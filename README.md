# Jackbox Utility - Kasm Workspace Image

This repository contains a Kasm workspace image for running [JackboxUtility](https://github.com/JackboxUtility/JackboxUtility) in a containerized environment.

> **Note:** This project packages the excellent [JackboxUtility](https://github.com/JackboxUtility/JackboxUtility) application created by [Alexis](https://github.com/AlexisL61) and contributors. All credit for the JackboxUtility application goes to the original developers. This repository only provides Docker containerization for use with Kasm Workspaces.

[![🐳 Build & Publish](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/actions/workflows/docker-publish.yml)
[![Latest Package](https://ghcr-badge.egpl.dev/developmentcats/jackbox-utility-kasm/latest_tag?trim=major&label=latest%20package&color=blue)](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/pkgs/container/jackbox-utility-kasm)

## Features

- Based on Kasm Ubuntu Jammy image
- Pre-installed JackboxUtility with all required dependencies
- Desktop integration for easy access
- Containerized environment for running Jackbox games
- Automatic updates tracking stable JackboxUtility releases
- Version tags match JackboxUtility releases exactly

## Using the Image

### From GHCR (Recommended)

The image is available on GitHub Container Registry. You can pull it using:

```bash
docker pull ghcr.io/developmentcats/jackbox-utility-kasm:latest
```

Or a specific JackboxUtility version:

```bash
docker pull ghcr.io/developmentcats/jackbox-utility-kasm:1.4.2-2
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

## Versioning

- Image versions match [JackboxUtility releases](https://github.com/JackboxUtility/JackboxUtility/releases) exactly
- Only stable releases are used (no beta versions)
- Docker tag format: JackboxUtility version with `+` replaced by `-` (e.g., `1.4.2+2` becomes `1.4.2-2`)
- Automatic nightly checks for new stable releases

## Notes

- This image is intended to be used with Kasm Workspaces
- Game launching functionality requires additional setup and testing
- Make sure to configure proper permissions and access to Steam/game directories when needed

## Releases

Images are automatically built and published to GHCR:
- Every night at 3 AM CST - checks for new stable JackboxUtility releases
- On new JackboxUtility stable releases - automatically creates matching image versions
- Manual builds via GitHub Actions

You can find all available versions on our [GitHub Container Registry](https://github.com/DevelopmentCats/Jackbox-Utility-Kasm/pkgs/container/jackbox-utility-kasm).

## Credits

- **JackboxUtility Application:** [JackboxUtility](https://github.com/JackboxUtility/JackboxUtility) by [Alexis](https://github.com/AlexisL61) and contributors
- **Kasm Workspaces:** Base container technology by [Kasm Technologies](https://kasmweb.com/)

## License

This project is licensed under the same terms as JackboxUtility (GPL-3.0). See the [original project](https://github.com/JackboxUtility/JackboxUtility) for details. 