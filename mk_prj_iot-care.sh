#!/bin/bash
## Выполняется в корневой папке проекта:
## Следующие команды создают файлы с минимальными заголовками; код в файлах не будет полноценным — это scaffold.
mkdir -p src/{adapters,transformer,queue,publisher,metrics,manager} tests config/tls docker && \
cat > README.md <<'EOF'
# IoT-Care STK
Стартовый комплект для безопасного сбора телеметрии (edge gateway + cloud).
EOF
cat > src/__init__.py <<'PY'
# Пакет src для IoT-Care STK
PY
for f in adapters/modbus.py adapters/opcua.py transformer/schema.py queue/sqlite_queue.py publisher/mqtt_client.py metrics/exporter.py manager/provision.py main.py; do
  mkdir -p "src/$(dirname "$f")"
  cat > "src/$f" <<'PY'
# -*- coding: utf-8 -*-
# Заглушка модуля — реализовать при необходимости
# Комментарии в коде писать на русском языке.
PY
done
cat > tests/__init__.py <<'EOF'
# Тесты для IoT-Care STK
EOF
cat > tests/conftest.py <<'PY'
# -*- coding: utf-8 -*-
# Пустой conftest — добавьте фикстуры по необходимости
PY
cat > config/devices.yaml <<'EOF'
# Пример конфигурации устройств
devices: []
EOF
cat > docker/Dockerfile <<'EOF'
# Dockerfile: добавьте инструкции для сборки edge-gateway
FROM python:3.11-slim
WORKDIR /app
COPY src/ /app/src
CMD ["python", "src/main.py"]
EOF
echo "Создана структура проекта. Добавьте реализацию модулей в src/ и тесты в tests/."
