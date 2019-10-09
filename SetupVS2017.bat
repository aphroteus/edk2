@echo off
rd /s /q Build
md Build

git submodule sync
git submodule update --init

set "COMMONTOOLSx64=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\x86_amd64"
set "VS140COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools"
set "VS2015_PREFIX=C:\Program Files (x86)\Microsoft Visual Studio 14.0\"
set "WINSDK81_PREFIX=c:\Program Files (x86)\Windows Kits\8.1\bin\"

set "VS2017_PREFIX=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.13.26128\"
set "WINSDK10_PREFIX=C:\Program Files (x86)\Windows Kits\10\bin"

set "IASL_PREFIX=C:\iasl-win-20251212\"
set "NASM_PREFIX=C:\NASM\"

copy BaseTools\Conf\tools_def.template Conf\tools_def.txt
copy BaseTools\Conf\build_rule.template Conf\build_rule.txt

call edksetup.bat

:: To HelloWorld
build -p ShellPkg\ShellPkg.dsc -a X64 -m ShellPkg\Application\Shell\Shell.inf -t VS2017
