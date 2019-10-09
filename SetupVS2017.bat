@ECHO OFF
RD /S /Q Build
MD Build

SET "VS2015_PREFIX=C:\Program Files (x86)\Microsoft Visual Studio 14.0\"
SET "VS140COMNTOOLS=C:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools"
SET "COMMONTOOLSx64=C:\Program Files (x86)\Microsoft Visual Studio 14.0\VC\bin\x86_amd64"
SET "WINSDK81_PREFIX=c:\Program Files (x86)\Windows Kits\8.1\bin\"

SET "VS2017_PREFIX=C:\Program Files (x86)\Microsoft Visual Studio\2017\Community\VC\Tools\MSVC\14.13.26128\"
SET "WINSDK10_PREFIX=C:\Program Files (x86)\Windows Kits\10\bin"

SET "IASL_PREFIX=C:\Src\iasl-win-20180313\"
SET "NASM_PREFIX=C:\Program Files\NASM\"
SET "EDK_TOOLS_BIN=C:\Src\edk2-BaseTools-win32"

SET "CYGWIN_HOME=C:\cygwin64"

COPY BaseTools\Conf\tools_def.template Conf\tools_def.txt
COPY BaseTools\Conf\build_rule.template Conf\build_rule.txt

edksetup.bat

:: To HelloWorld
:: build -p ShellPkg\ShellPkg.dsc -a X64 -m ShellPkg\Application\Shell\Shell.inf -t VS2017
