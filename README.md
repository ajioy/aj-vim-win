# a vim config for windows (gvim 8.1)
> **last modified** : 2021-02-20

> **author**: ajioy scotte(ajioy@hotmail.com)

## screenshot
![aj-vim-win-screenshoot](https://raw.githubusercontent.com/ajioy/storage/master/screenshot.png)

## dependencies:
> * python
> * ctags
> * ag / rg
> * youcompleteme
> * nerdfonts

## screenshootinstall
### normal
```
打开powelshell
md ~\vimfiles\autoload
$uri = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
(New-Object Net.WebClient).DownloadFile(
  $uri,
  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath(
    "~\vimfiles\autoload\plug.vim"
  )
)
进入gvim安装插件
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


### nerdfonts
```
" 为了vim-devicons正常显示目录及文件图标，需要下载nerdfont
" 也可以为你喜欢的字体添加图标，教程参考
" https://github.com/ryanoasis/nerd-fonts#option-8-patch-your-own-font
" https://zhuanlan.zhihu.com/p/150097941
```
## explain something more
```
todo
```
