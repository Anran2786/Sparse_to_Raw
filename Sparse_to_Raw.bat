@echo off
chcp 65001
cls
set "tool=%~dp0bin\simg2img.exe"
set "sparse="
for /r %%i in (*.img) do (
    if not defined sparse (
        set "sparse=%%i"
        set "filename=%%~nxi"
        goto :break
    )
)
:break
if defined sparse (
    echo 尝试转换 "%filename%"
    %tool% "%sparse%" "%sparse:~0,-4%_Raw.bin" >nul 2>&1
    echo.
    echo 转换完成，输出文件："%filename:~0,-4%_Raw.bin"
rem echo %filename:~0,-4%_Raw.bin
rem forfiles /s /m %filename:~0,-4%_Raw.bin /c "cmd /c echo @fsize"
rem 为啥啊这段会给上面simg2img给重新执行一遍，想不通，先不管了
rem （铸币bat，::还不是注释会留空行，排查半天才明白得用rem）
) else (
    echo 未找到需要进行转换的文件
)
echo.
echo 窗口将在8秒后关闭
timeout /t 8 >nul