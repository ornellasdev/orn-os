FROM ghcr.io/ublue-os/kinoite-nvidia:latest

LABEL org.opencontainers.image.title="Orn OS"
LABEL org.opencontainers.image.description="Gaming Linux baseado no Fedora Atomic e KDE Plasma."

# 1. Ativar repositórios RPM Fusion para drivers e codecs
RUN rpm-ostree apr-repo-enable rpmfusion-free-release && \
    rpm-ostree apr-repo-enable rpmfusion-nonfree-release

# 2. Instalar utilitários e drivers essenciais de jogos
RUN rpm-ostree install \
    gamemode \
    gamescope \
    mangohud \
    steam-devices \
    flatpak \
    pipewire-codec-aptx

# 3. Otimização de memória para compatibilidade com Wine/Proton e anticheats
RUN echo "vm.max_map_count=1048576" >> /etc/sysctl.d/99-orn-os.conf && \
    echo "fs.file-max=524288" >> /etc/sysctl.d/99-orn-os.conf

# 4. Limpeza
RUN rpm-ostree cleanup -a