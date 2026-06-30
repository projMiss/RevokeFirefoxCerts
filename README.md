# RevokeFirefoxCerts

## 安装

下载安装[msys2](https://www.msys2.org/)

运行ucrt64.exe

```bash
pacman -Syu
pacman -S mingw-w64-ucrt-x86_64-nss mingw-w64-ucrt-x86_64-openssl
```

## 使用

1、下载解压脚本。

2、从Firefox导出需要吊销的证书，存放到certs目录。

```bash
cd /path/to/RevokeFirefoxCerts
export PATH="$PWD:$PATH"
cd /path/to/FirefoxProfileDir	#cert9.db, key4.db, pkcs11.txt所在目录。
revoke.sh
```

## 引用

[CA/Included Certificates](https://wiki.mozilla.org/CA/Included_Certificates)
