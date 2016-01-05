$source = "ftp://ftp.vim.org/pub/vim/pc/gvim74.exe"
cd ~
$destination = (Get-Item -Path ".\" -Verbose).FullName + "\Downloads\"
$file = "gvim74.exe"

$webclient = New-Object System.Net.WebClient
$uri = New-Object System.Uri($source)

"Downloading Vim..."

$webclient.DownloadFile($uri, $destination + $file)

"Installing Vim..."

cd $destination
Start-Process ./$file -NoNewWindow -Wait

Set-ExecutionPolicy RemoteSigned
new-item -path $profile -itemtype file -force

$edits = 
'
set-alias vim "C:/Program Files (x86)/Vim/Vim74/./vim.exe"
Function Edit-Profile
{
    vim $profile
}
Function Edit-Vimrc
{
    vim $HOME\_vimrc
}
'

$edits | Out-File $profile
cd ~
""
"------------------------------------------------------------------------------"
"Vim has been successfully incorporated into PowerShell, to use the application"
"restart PowerShell and type one of the following :"
"vim"
"vim <filename>"
"------------------------------------------------------------------------------"
