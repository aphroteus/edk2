REM https://www.tianocore.org/tianocore-wiki.github.io/build-tooling/environment-setup/clang9_tools_chain.html
@echo off
rd /s /q Build
md Build

git submodule sync
git submodule update --init

set "BASETOOLS_MINGW_PATH=D:\SC\BuildTools\CLANGPDB_f4718cd\"
set "CLANG_BIN=D:\SC\BuildTools\CLANGPDB_f4718cd\bin\"
set "IASL_PREFIX=C:\iasl-win-20251212\"
set "NASM_PREFIX=C:\NASM\"

if exist "%EDK_TOOLS_BIN%" goto skip_rebuild
call edksetup.bat Rebuild Mingw-w64
if %errorlevel% NEQ 0 PAUSE
:skip_rebuild

call edksetup.bat Mingw-w64

build -a X64 -p OvmfPkg/OvmfPkgX64.dsc -t CLANGPDB

REM qemu-system-x86_64 -drive if=pflash,format=raw,readonly=on,file=OVMF_CODE.fd -drive if=pflash,format=raw,file=OVMF_VARS.fd -drive file=fat:rw:qemu_share,format=raw,media=disk -net none
