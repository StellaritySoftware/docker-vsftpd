# docker-vsftpd

[![Docker](https://github.com/StellaritySoftware/docker-vsftpd/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/StellaritySoftware/docker-vsftpd/actions/workflows/docker-publish.yml)

# Introduction
This ftp server uses virtual users with a shared home directory `/var/ftp/pub`.

## Config

### Environment variables

| Variable | Description | Example |
|--|--|--|
| MODE | Set to FTP, FTPS or FTPES to specify SSL behavior | FTP |
| PASV_ADDRESS | The server hostname or ip | demo |
| PASV_MIN_PORT | Min port for passive connections | 21000 |
| PASV_MAX_PORT | Max port for passive connections | 21100 |

*Note: All variables are mandatory.*

### Prepopulated users
| username | password |
|--|--|
| user1 | pass1 |
| user2 | pass2 |
| user 2 | <none> |
| anonymous | <none> |

## Run

```bash
MODE=FTP PASV_ADDRESS=<your IP adress> docker-compose up
```

## Debug run

```bash
docker-compose run --service-ports --rm -e PASV_ADDRESS=<your IP adress> -e MODE=FTP vsftpd
```
