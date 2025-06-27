#!/bin/bash
VIDEO_PATH="/home/domino/video/zen.mp4"
LOG="/home/domino/logs/debug.log"

# Зупинити попередні процеси
killall -9 xwinwrap mpv 2>/dev/null

# Новий коректний спосіб запуску
xwinwrap -g 1920x1080+0+0 -ni -un -ov -d -- \
  mpv --loop=inf --no-audio --wid=%WID% --hwdec=auto --vo=gpu "$VIDEO_PATH" &> "$LOG" &

# Перевірка через 3 секунди
sleep 3
if pgrep mpv >/dev/null; then
  echo "Відео-шпалери успішно запущені!"
else
  echo "Помилка! Перевірте логи:"
  cat "$LOG"
  exit 1
fi