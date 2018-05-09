# docker-vsftpd [![Docker Build Status](https://img.shields.io/docker/build/stellarity/vsftpd.svg)](https://hub.docker.com/r/stellarity/vsftpd)

# Introduction
This ftp server uses virtual users with a shared home directory `/var/ftp/pub`.

## Config

### Environment variables

| Variable | Description | Example |
|--|--|--|
| MODE | Set to FTP, FTPS or FTPES to specify SSL behaviour | FTP |
| PASV_ADDRESS | The server hostname or ip | demo |
| PASV_PORT | Port for passive connections | 21001

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
