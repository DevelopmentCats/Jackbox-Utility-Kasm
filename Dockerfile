FROM kasmweb/core-ubuntu-jammy:1.14.0
USER root

# Install required dependencies for Flutter apps
RUN apt-get update && apt-get install -y \
    wget \
    unzip \
    libgtk-3-0 \
    libblkid1 \
    liblzma5 \
    libgtk-3-0 \
    libglib2.0-0 \
    libnss3 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libcups2 \
    libdrm2 \
    libdbus-1-3 \
    libatspi2.0-0 \
    libx11-6 \
    libxcomposite1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxrandr2 \
    libgbm1 \
    libpango-1.0-0 \
    libcairo2 \
    libasound2 \
    libxcursor1 \
    libxinerama1 \
    && rm -rf /var/lib/apt/lists/*

# Create directory for JackboxUtility
RUN mkdir -p /opt/jackbox-utility

# Download and install JackboxUtility
RUN wget https://github.com/JackboxUtility/JackboxUtility/releases/latest/download/JackboxUtility-linux.zip -O /tmp/JackboxUtility.zip \
    && unzip /tmp/JackboxUtility.zip -d /opt/jackbox-utility \
    && chmod +x /opt/jackbox-utility/JackboxUtility \
    && rm /tmp/JackboxUtility.zip

# Create desktop shortcut
RUN mkdir -p /usr/share/applications && \
    echo '[Desktop Entry]\n\
Version=1.0\n\
Type=Application\n\
Name=Jackbox Utility\n\
Comment=Jackbox Games Utility and Launcher\n\
Exec=/opt/jackbox-utility/JackboxUtility\n\
Icon=/opt/jackbox-utility/data/flutter_assets/assets/images/icon.png\n\
Terminal=false\n\
Categories=Game;Utility;\n\
StartupNotify=true\n\
StartupWMClass=jackbox-utility\n\
Keywords=jackbox;games;launcher;utility;' > /usr/share/applications/jackbox-utility.desktop && \
    chmod 644 /usr/share/applications/jackbox-utility.desktop

# Set permissions
RUN chown -R 1000:1000 /opt/jackbox-utility

# Add OpenContainers labels
LABEL org.opencontainers.image.title="JackboxUtility Kasm Workspace" \
      org.opencontainers.image.description="JackboxUtility client as KASM workspace" \
      org.opencontainers.image.source="https://github.com/JackboxUtility/JackboxUtility"

# Environment variables for KASM
ENV KASM_STARTUP_SCRIPT="/dockerstartup/kasm_default_profile.sh" \
    STARTUP_SCRIPT="/dockerstartup/kasm_default_profile.sh" \
    VNC_PORT=6901 \
    VNC_RESOLUTION=1920x1080 \
    MAX_FRAME_RATE=30

USER 1000 