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
    echo 尝试转换%sparse%
    %tool% "%sparse%" "%sparse:~0,-4%_Raw.bin" >nul 2>&1
::    echo %filename:~0,-4%_Raw.bin
::    forfiles /s /m %filename:~0,-4%_Raw.bin /c "cmd /c echo @fsize"
::为啥啊这段会给上面simg2img给重新执行一遍，想不通，先不管了
) else (
    echo 未找到需要进行转换的文件
)

pause