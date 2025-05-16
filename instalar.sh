#!/data/data/com.termux/files/usr/bin/bash

echo "=== Instalando dependencias (Node.js, Git) ==="
pkg update -y && pkg upgrade -y
pkg install -y git nodejs

echo "=== Clonando repositorio Baxto Chatbot ==="
rm -rf Baxto-chatbot-ink
git clone https://github.com/Pedrobaxcto/Baxto-chatbot-ink.git
cd Baxto-chatbot-ink

echo "=== Instalando dependencias de Node.js ==="
npm install

echo "=== Configuración inicial del bot ==="
read -p "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 " OPENAI_KEY

cat > config.json <<EOF
{
  "openai_api_key": "$OPENAI_KEY",
  "prefix": "/",
  "default_response": "¡Qué onda! Soy Baxto Chatbot 🤖. Mándame tu idea de tatuaje y te digo cómo podemos armarlo."
}
EOF

echo "=== Bot instalado. Iniciando... ==="
node index.js
