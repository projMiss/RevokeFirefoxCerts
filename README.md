# RevokeFirefoxCerts

## Install

下载安装[msys2](https://www.msys2.org/)

### 普通版本

运行ucrt64.exe

```bash
pacman -Syu
pacman -S mingw-w64-ucrt-x86_64-nss mingw-w64-ucrt-x86_64-openssl
```

### ESR版本

在[Release Notes](https://firefox-source-docs.mozilla.org/security/nss/releases/index.html)查看NSS包的ESR版本号，当前Firefox ESR 140对应NSS 3.112.2 (ESR)。

从[这里](https://repo.msys2.org/mingw/clang64/)下载NSS包，当前是[包](https://repo.msys2.org/mingw/clang64/mingw-w64-clang-x86_64-nss-3.112-1-any.pkg.tar.zst)和[签名](https://repo.msys2.org/mingw/clang64/mingw-w64-clang-x86_64-nss-3.112-1-any.pkg.tar.zst.sig)。

运行clang64.exe

```bash
pacman -Syu
pacman -S mingw-w64-clang-x86_64-openssl
cd /path/to/mingw-w64-clang-x86_64-nss-3.112-1-any.pkg.tar.zst
pacman -U mingw-w64-clang-x86_64-nss-3.112-1-any.pkg.tar.zst
```

可以修改/etc/pacman.conf - [options]部分 - IgnorePkg行，防止NSS包升级：

IgnorePkg   = mingw-w64-clang-x86_64-nss

## Usage

1、下载解压脚本。

2、把需要吊销的证书从Firefox里导出来，存放到certs目录。

```bash
cd /path/to/RevokeFirefoxCerts
export PATH="$PATH:$PWD"
cd /path/to/FirefoxProfileDir	#cert9.db, key4.db, pkcs11.txt所在目录。
revoke.sh
```

## Tor Browser

[【屏蔽 tor 浏览器证书】](https://t.me/s/tg_InternetSecurity/711?q=%23Tor)（谨慎操作！）

为避免 tor 浏览器的一些安全隐患，可以用下面的方法永久屏蔽证书：

1、打开 tor 浏览器，输入 about:config，点“接受风险并继续”；

2、在搜索中输入 security.nocertdb 原来为 true 双击改成 false；

3、重启tor浏览器之后，就可以屏蔽证书了（即：证书取消信任）。

4、鼠标左键点击Tor浏览器的右上角的“三条杠”图标---> 选项--->隐私与安全--->证书--->查看证书--->点击需要屏蔽的证书--->点界面下方的”编辑信任(E)"--->出现编辑CA证书信任设置窗口，将“编辑信任设置”下面方框内的对勾去掉（去掉勾选）--->确定--->确定，即可。

## Issues

1、Firefox设置了主密码的要先取消主密码。

## Resources

[CA/Included Certificates](https://wiki.mozilla.org/CA/Included_Certificates)

[Base Package: mingw-w64-nss](https://packages.msys2.org/base/mingw-w64-nss)

[Package: mingw-w64-clang-x86_64-nss](https://packages.msys2.org/packages/mingw-w64-clang-x86_64-nss)
