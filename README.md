# Kitsune
O downloader astuto que simplifica o download de vídeos e áudios de diversas plataformas.

<img width="1115" height="628" alt="image" src="https://github.com/user-attachments/assets/25d631f6-9480-4415-b7d2-e7f6288b29dc" />

O **Kitsune** é um script interativo amigável para o `yt-dlp` que elimina a necessidade de comandos complexos na linha de comando. Interface em terminal com menu interativo em português.

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

## 📥 Instalação
### Passo 1: Instale as dependências
### Passo 2: Baixe o Kitsune
1. Acesse a [seção de Releases](https://github.com/KindDyu/Kitsune/releases)
2. Baixe o arquivo `Kitsune.bat` mais recente
3. Salve em uma pasta dedicada
### Passo 3: Execute
Dê duplo-clique no `Kitsune.bat`. O menu interativo abrirá automaticamente.

## 🚀 Uso Rápido
1. Escolha o **tipo** (vídeo, áudio ou imagem)
2. Ajuste a **qualidade** com `Q`
3. Altere a **dublagem** com `D`
4. Pressione `B` para começar

> ⚠️ **Nota**: O download será salvo na mesma pasta onde o `.bat` está localizado.

## 🙏 Créditos
Este projeto é uma adaptação e melhoria do script original criado por [domocorn](https://github.com/domocorn/yt-dlp-interactive-batch).
