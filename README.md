# Kitsune
O downloader astuto que simplifica o download de vídeos e áudios de diversas plataformas.

<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/25d631f6-9480-4415-b7d2-e7f6288b29dc" />


O **Kitsune** é um script interativo que automatiza o uso do `yt-dlp` com uma interface amigável. Ele permite escolher qualidade, extrair áudio ou baixar com dublagem de forma simples, sem precisar digitar comandos complexos.

## 🛠 Pré-requisitos
Para que o Kitsune funcione, as seguintes ferramentas devem estar instaladas no seu sistema:
* [**yt-dlp**](https://github.com/yt-dlp/yt-dlp):
*  * [**FFmpeg**](https://ffmpeg.org/download.html)
*  * [**Deno**](https://github.com/denoland/deno/)
* [**gallery-dl**](https://github.com/mikf/gallery-dl)

A maneira mais fácil de instalar todas as dependências de uma vez é usando o gerenciador de pacotes `winget`.
1. Abra o **Terminal** (PowerShell ou CMD) como administrador:
2. Execute o seguinte comando:
```
winget install -e --id yt-dlp.yt-dlp mikf.gallery-dl
```

## 📥 Instalação e uso
1. Baixe o arquivo `Kitsune.bat` mais recente na seção de [Releases](https://github.com/KindDyu/Kitsune/releases).
2. Mova o arquivo `Kitsune.bat` para a pasta onde você deseja salvar seus downloads.
3. Dê um duplo clique no arquivo. Uma janela de terminal abrirá exibindo o menu interativo.
4. Utilize as opções apresentadas na tela:
   * Digite a opção desejada para selecionar **Qualidade**, **Somente Áudio** ou **Dublagem**.
   * Pressione a tecla `D` para confirmar e iniciar o download.
   * Siga as instruções na tela para inserir a URL do vídeo.

## 🙏 Créditos
Este projeto é uma adaptação e melhoria do script original criado por [domocorn](https://github.com/domocorn/yt-dlp-interactive-batch).
