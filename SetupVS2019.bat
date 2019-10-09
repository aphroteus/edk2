@echo off
rd /s /q Build
md Build

git submodule sync
git submodule update --init

REM set "WINSDK10_PREFIX=C:\Program Files (x86)\Windows Kits\10\bin"

set "IASL_PREFIX=C:\iasl-win-20251212\"
set "NASM_PREFIX=C:\NASM\"

copy BaseTools\Conf\tools_def.template Conf\tools_def.txt
copy BaseTools\Conf\build_rule.template Conf\build_rule.txt

call edksetup.bat

:: To HelloWorld
build -p ShellPkg\ShellPkg.dsc -a X64 -m ShellPkg\Application\Shell\Shell.inf -t VS2019
