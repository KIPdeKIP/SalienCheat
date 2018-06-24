[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri https://windows.php.net/downloads/releases/php-7.2.7-nts-Win32-VC15-x64.zip -OutFile php.zip
Expand-Archive -LiteralPath php.zip -DestinationPath .
Copy-Item -Path php.ini-production -Destination php.ini
((Get-Content php.ini)) -Replace ";extension=curl", ("extension=" + (Get-Item -Path ".\") + "\ext\php_curl.dll") | Set-Content php.ini