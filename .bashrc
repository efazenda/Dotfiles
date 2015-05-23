# File : .bashrc 
# Author : Edouard Fazenda 
# Email : <edouard.fazenda@gmail.com>

## Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

## Setting Locales 

export LANG=fr_FR.UTF-8
export LC_CTYPE="fr_FR.UTF-8"
export LC_NUMERIC="fr_FR.UTF-8"
export LC_TIME="fr_FR.UTF-8"
export LC_COLLATE="fr_FR.UTF-8"
export LC_MONETARY="fr_FR.UTF-8"
export LC_MESSAGES="fr_FR.UTF-8"
export LC_PAPER="fr_FR.UTF-8"
export LC_NAME="fr_FR.UTF-8"
export LC_ADDRESS="fr_FR.UTF-8"
export LC_TELEPHONE="fr_FR.UTF-8"
export LC_MEASUREMENT="fr_FR.UTF-8"
export LC_IDENTIFICATION="fr_FR.UTF-8"
export LESSCHARTSET="UTF-8"

## Configure Bash Shell Options (using shopt)

shopt -s cdable_vars
shopt -s cdspell
shopt -s checkhash
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -u execfail
shopt -s expand_aliases
shopt -s extdebug
shopt -s extglob
shopt -s extquote
shopt -u failglob
shopt -s force_fignore
shopt -u gnu_errfmt
shopt -s histappend
shopt -u histreedit
shopt -u histverify
shopt -s hostcomplete
shopt -u huponexit
shopt -s interactive_comments
shopt -s lithist
shopt -s login_shell
shopt -s mailwarn
shopt -u nocaseglob
shopt -u nocasematch
shopt -u nullglob
shopt -s promptvars
shopt -u restricted_shell
shopt -u shift_verbose
shopt -s sourcepath

## Configure Bash reserved Variables 
export FIGNORE="*.swp"
export HISTFILE="/home/$USER/.bash_history"
export HISTFILESIZE="1000"
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "


## Setting umask permissions

umask 0022


## Creating Needed Directories

# Creating the git folder for the user
if [ -d /home/$USER/git/ ]; then
  /usr/bin/mkdir -p /home/$USER/git/
fi


## Bash Prompt
export PS1="(\t) - [\u@\h \W]\$ "
export PS2="--> \$ "
export PS4="$0 $LINEN0 + "

## Set Paths
export PATH="$PATH:/home/$USER/git/"

## Setting the default editor
export EDITOR="/usr/bin/vim"


rpm -q systemd > /dev/null 2>&1

## Configuration of systemd
if [ $? -eq 0 ]; then
  export SYSTEMD_PAGER=
fi

## Aliases 

# GPG aliases
alias gpgl="gpg2 --list-keys"
alias gpgls="gpg2 --list-secret-keys"
alias gpgsearch="gpg2 --search-key $1"
alias gpgdelete="gpg2 --delete-key $1"
alias gpgdb="gpg2 -update-trustdb"
alias gpgverify="gpg2 --verify $1"
alias gpgsign="gpg2 --sign -u $USER $1"
alias gpgdecrypt="gpg2 --decrypt $1"
alias gpgencrypt="gpg2 --encrypt $1"
alias gpgsendkey="gpg2 --send-keys"
alias gpgrecvkey="gpg2 --recv-keys" 

## Functions 

# Function that dump to a file e.g : "<filename>.md5" the MD5 sum
# Parameters (Hash Type):
# + sha1
# + sha224
# + sha256
# + sha284
# + sha512
# + md5  
function dumpchecksum ()  
{
  if [ $# -ne "2" ]; then
    /usr/bin/md5sum "$1" > "$1.md5"
  else
    /usr/bin/"$1sum" "$2" > "$2.$1"
  fi 
}


