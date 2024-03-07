@echo off
cd %~dp0
xargs –n 1 curl -O < allUrls.txt
exit