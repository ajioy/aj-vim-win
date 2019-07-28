# a vim config for windows (gvim 8.1)
> **last modified** : 2019-07-28

> **author**: ajioy scotte

## dependencies:
> * ctags
> * ag / rg
> * youcompleteme

## install
### noraml
```
:PlugInstall
```

### ctags
```
下载并解压至gvim安装目录，添加环境变量
C:\vim\ctags58\
```
[download](http://prdownloads.sourceforge.net/ctags/ctags58.zip) check it

### ag / rg
```
启用脚本
set-executionpolicy remotesigned

安装包管理工具chocolatey，注意：需要搭梯子
iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

choco install ag
```

### youcompleteme(YCM)
```
下载并解压至$VIM\vimfiles\plugged\YouCompleteMe ($VIM，gvim的安装目录)
```
[download](https://www.zhihu.com/question/25437050/answer/95662340) check it


## explain something more
```
todo
```
