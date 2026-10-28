
FROM ghcr.io/ublue-os/kinoite-nvidia:latest

LABEL org.opencontainers.image.title="Orn OS"
LABEL org.opencontainers.image.description="Gaming Linux baseado no Fedora Atomic e KDE Plasma."

# 1. Copiar a identidade visual e personalizações
COPY system_files/ /

# 2. Instalar utilitários e dependências
RUN rpm-ostree install \
    gamemode \
    gamescope \
    mangohud \
    steam-devices \
    python3-pyqt6 \
    python3-qt5

# 3. Otimização de memória para Wine/Proton e anticheats
RUN echo "vm.max_map_count=1048576" >> /etc/sysctl.d/99-orn-os.conf && \
    echo "fs.file-max=524288" >> /etc/sysctl.d/99-orn-os.conf

# 4. Limpeza de metadados
RUN rpm-ostree cleanup -m
