@ECHO OFF
RD /S /Q Build
MD Build

REM git submodule update --init

REM SET "WINSDK10_PREFIX=C:\Program Files (x86)\Windows Kits\10\bin"

REM SET "IASL_PREFIX=C:\Src\iasl-win-20180313\"
SET "NASM_PREFIX=C:\Program Files\NASM\"
SET "EDK_TOOLS_BIN=C:\Src\edk2-BaseTools-win32"

SET "CYGWIN_HOME=C:\cygwin64"

COPY BaseTools\Conf\tools_def.template Conf\tools_def.txt
COPY BaseTools\Conf\build_rule.template Conf\build_rule.txt

edksetup.bat

:: To HelloWorld
:: build -p ShellPkg\ShellPkg.dsc -a X64 -m ShellPkg\Application\Shell\Shell.inf -t VS2019
