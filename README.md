<div align="center">
  <h1 align="center">Orn OS 🚀</h1>
  <p align="center"><b>A Gaming Linux Distribution built on Fedora Atomic & KDE Plasma</b></p>
  <p align="center">
    <img src="https://img.shields.io/badge/Status-Beta%201.0-blueviolet?style=for-the-badge" alt="Status Beta 1.0">
    <img src="https://img.shields.io/badge/Base-Fedora%20Kinoite-blue?style=for-the-badge&logo=fedora" alt="Fedora Kinoite">
    <img src="https://img.shields.io/badge/Desktop-KDE%20Plasma%206-informational?style=for-the-badge&logo=kde" alt="KDE Plasma">
    <img src="https://img.shields.io/badge/GPU-NVIDIA%20Optimized-green?style=for-the-badge&logo=nvidia" alt="NVIDIA">
  </p>
</div>

---

## 🎮 Sobre o Orn OS

O **Orn OS** é uma distribuição Linux imutável focada em alta performance para jogos, projetada para entregar uma experiência imersiva e pronta para uso (*out-of-the-box*), combinando a estabilidade industrial do **Fedora Atomic (Kinoite)** com uma identidade visual moderna em **Roxo Neon** e ferramentas integradas de otimização para jogadores e criadores.

---

## ✨ Destaques da Versão Beta 1.0

* **Identidade Visual Exclusiva:** Tema escuro integrado com detalhes em roxo neon, papéis de parede oficiais e a aplicação de boas-vindas **Orn OS Welcome** desenvolvida em PyQt6.
* **Pronto para Jogar (Gaming Ready):**
  * Drivers NVIDIA integrados de fábrica.
  * Suporte nativo ao `gamemode`, `gamescope` e telemetria via `mangohud`.
  * Perfis de controlo e hardware habilitados através de `steam-devices`.
* **Otimizações Avançadas de Sistema:** 
  * Parâmetros de kernel tunados (`vm.max_map_count = 1048576`) para compatibilidade perfeita com Wine, Proton e jogos modernos com requisitos exigentes de memória virtual e anticheats.
* **Arquitetura Imutável:** Atualizações atômicas e seguras baseadas em imagens OCI geradas diretamente pelo GitHub Container Registry (`GHCR`).

---

## 🛠️ Arquitetura e Estrutura do Projeto

O projeto utiliza uma estrutura modular centralizada em `/system_files/` que é copiada diretamente para a raiz do sistema operacional durante o build automatizado:

```text
orn-os/
├── .github/
│   └── workflows/
│       ├── build.yml        # CI/CD para compilação da imagem OCI no GHCR
│       └── build-iso.yml    # Gerador automático do instalador ISO e Releases
├── system_files/
│   ├── etc/
│   │   ├── xdg/autostart/   # Configuração de inicialização do painel de boas-vindas
│   │   └── sysctl.d/        # Otimizações de kernel (vm.max_map_count)
│   └── usr/
│       ├── bin/             # Executável do assistente gráfico (ornos-welcome)
│       └── share/
│           └── backgrounds/ # Identidade visual e wallpapers oficiais
└── Containerfile            # Receita principal de montagem dos pacotes rpm-ostree
