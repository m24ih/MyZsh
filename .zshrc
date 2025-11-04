# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""
# Powerlevel10k "instant prompt" uyarısını (fastfetch nedeniyle) gizle
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  docker
  docker-compose
  archlinux
  conda
)

source $ZSH/oh-my-zsh.sh
source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


# ---------------------------------------------------------------------------
# ZSH -> KULLANICIYA ÖZEL AYARLAMALAR (OMZ'den SONRA)
# ---------------------------------------------------------------------------

# ZSH -> Conda [cite: 1] için eski bloğunuzu silin.
# ZSH -> BU AYARI ETKİNLEŞTİRMEK İÇİN TERMİNALDE BİR KEZ 'conda init zsh' YAZIN.
# ZSH -> Bu komut, aşağıya otomatik olarak doğru Zsh kodunu ekleyecektir.
# <<< conda initialize (ZSH tarafından yönetilecek) >>>

# --- Değişken Tanımlamaları ---
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export LINUXTOOLBOXDIR="$HOME/linuxtoolbox"
export EDITOR="nvim"
export VISUAL="nvim"

# Akış kontrolünü (Ctrl+S/Ctrl+Q) devre dışı bırakır
if [[ $- == *i* ]]; then stty -ixon; fi

# --- PATH Yönetimi ---
# ZSH -> 'add_to_path' fonksiyonları yerine Zsh'in
# ZSH -> $path dizisini kullanıyoruz. Bu, yinelenen kayıtları otomatik engeller.
path=(
  "/home/melih/FlutterEnv/flutter/bin" # Başa eklendi
  $path                                # Mevcut PATH
  "$HOME/.local/bin"                   # Sona eklendi
  "$HOME/.cargo/bin"
  "/var/lib/flatpak/exports/bin"
  "$HOME/.local/share/flatpak/exports/bin"
)
export PATH

# --- Alias (Kısayol) Tanımlamaları ---
alias spico='sudo pico'
alias snano='sudo nano'
alias vim='nvim'
alias vi='nvim'
alias svi='sudo nvim'
alias vis='nvim "+set si"'

# grep için ripgrep (rg) kontrolü
if command -v rg &>/dev/null; then
  alias grep='rg'
else
  alias grep='/usr/bin/grep --color=auto'
fi

# ZSH -> 'ebashc' alias'ını yeni dosyamız için 'ezshc' olarak güncelledim.
alias ezshc='nvim ~/.zshrc'
alias ebashc='nvim ~/.bashrc' # Eskisini de isterseniz tutabilirsiniz

# Tarih alias'ı
alias da='date "+%Y-%m-%d %A %T %Z"'

# Değiştirilmiş komutlar
alias cp='cp -i'
alias mv='mv -i'
alias rm='trash -v' # Çöp kutusuna taşı
alias mkdir='mkdir -p'
alias ps='ps auxf'
alias ping='ping -c 10'
alias less='less -R'
alias cls='clear'
alias apt-get='sudo apt-get'
alias multitail='multitail --no-repeat -c'
alias freshclam='sudo freshclam'
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"

# Dizin değiştirme alias'ları
alias home='cd ~'
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias bd='cd "$OLDPWD"' # Fish'teki '$dirprev' yerine Bash'te '$OLDPWD' kullanılır

# Dizin ve içeriğini sil (rm alias'ını bypass eder)
alias rmd='/bin/rm --recursive --force --verbose'

# eza (ls alternatifi) için alias'lar
alias ls='eza -la --icons --git --header'
alias l='eza --icons --git'
alias ll='eza -l --icons --git --header'
alias la='eza -la --icons --git --header'
alias l.='eza -laD --icons --git --header'
alias lt='eza -la --sort=modified --reverse --icons --git --header'
alias lS='eza -la --sort=size --reverse --icons --git --header'
alias lx='eza -la --sort=ext --icons --git --header'
alias T='eza --tree --level=3 --icons --git'
alias Ta='eza --tree --level=3 -a --icons --git'
alias lf='eza -l --icons --git --no-dir'
alias ldir='eza -lD --icons --git'

# chmod alias'ları
alias mx='chmod a+x'
alias 000='chmod -R 000'
alias 644='chmod -R 644'
alias 666='chmod -R 666'
alias 755='chmod -R 755'
alias 777='chmod -R 777'

# Arama alias'ları
alias h='history | grep'
alias p="ps aux | grep"
alias topcpu="/bin/ps -eo pcpu,pid,user,args | sort -k 1 -r | head -10"
alias f="find . | grep"

# Diğer alias'lar
alias checkcommand="type -t"
alias openports='netstat -nape --inet'
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'
alias diskspace="du -S | sort -n -r | more"
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'
alias mktar='tar -cvf'
alias mkbz2='tar -cvjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'
alias sha1='openssl sha1'
#alias logs="sudo find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]\$' | xargs tail -f"
alias clickpaste='sleep 3; xdotool type "$(xclip -o -selection clipboard)"'
alias kssh="kitty +kitten ssh"
alias docker-clean='docker container prune -f; docker image prune -f; docker network prune -f; docker volume prune -f'
alias hug="systemctl --user restart hugo"
alias lanm="systemctl --user restart lan-mouse"

# cat'i bat olarak kullanmak için (eğer yüklüyse)
if command -v bat &>/dev/null; then
  alias cat='bat'
fi

#######################################################
# FONKSİYONLAR
#######################################################

# Arşiv çıkarma fonksiyonu
function extract {
  for archive in "$@"; do
    if [ -f "$archive" ]; then
      case "$archive" in
      *.tar.bz2 | *.tbz2) tar xvjf "$archive" ;;
      *.tar.gz | *.tgz) tar xvzf "$archive" ;;
      *.bz2) bunzip2 "$archive" ;;
      *.rar) unrar x "$archive" ;;
      *.gz) gunzip "$archive" ;;
      *.tar) tar xvf "$archive" ;;
      *.zip) unzip "$archive" ;;
      *.Z) uncompress "$archive" ;;
      *.7z) 7z x "$archive" ;;
      *) echo "Bilinmeyen arşiv türü: '$archive'" ;;
      esac
    else
      echo "'$archive' geçerli bir dosya değil!"
    fi
  done
}

# Dosya içinde metin arama
function ftext {
  grep -iIHrn --color=always "$1" . | less -r
}

# İlerleme çubuğu ile dosya kopyalama
function cpp {
  local total_size
  total_size=$(stat -c '%s' "$1")
  strace -q -ewrite cp -- "$1" "$2" 2>&1 |
  awk -v total_size="$total_size" '{
            count += $NF
            if (count % 10 == 0) {
                percent = count / total_size * 100
                printf "%3d%% [", percent
                for (i=0;i<=percent;i++) printf "="
     
                printf ">"
                for (i=percent;i<100;i++) printf " "
                printf "]\r"
            }
        }
        END { print "" }'
}

# Kopyala ve o dizine git
function cpg {
  if [ -d "$2" ]; then
    cp "$1" "$2" && cd "$2"
  else
    cp "$1" "$2"
  fi
}

# Taşı ve o dizine git
function mvg {
  if [ -d "$2" ]; then
    mv "$1" "$2" && cd "$2"
  else
    mv "$1" "$2"
  fi
}

# Dizin oluştur ve içine gir
function mkdirg {
  mkdir -p "$1" && cd "$1"
}

# Belirtilen sayıda yukarı dizine çık
function up {
  # ${1:-1} -> $1 varsa onu, yoksa 1'i kullanır
  local limit=${1:-1}
  local path=""
  for i in $(seq 1 "$limit"); do
    path="../$path"
  done
  cd "$path"
}

# Çalışılan dizinin son iki bölümünü göster
function pwdtail {
  pwd | awk -F/ '{nlast = NF -1;print $nlast"/"$NF}'
}

# Linux dağıtımını bul
function distribution {
  local dtype="unknown"
  if [ -r /etc/os-release ]; then
    . /etc/os-release
    case "$ID" in
    fedora | rhel | centos) dtype="redhat" ;;
    sles | "opensuse"*) dtype="suse" ;;
    ubuntu | debian) dtype="debian" ;;
    gentoo) dtype="gentoo" ;;
    arch | manjaro) dtype="arch" ;;
    slackware) dtype="slackware" ;;
    *)
      if [ -n "$ID_LIKE" ]; then
        case "$ID_LIKE" in
        *fedora* | *rhel* | *centos*) dtype="redhat" ;;
        *sles* | *opensuse*) dtype="suse" ;;
        *ubuntu* | *debian*) dtype="debian" ;;
        *gentoo*) dtype="gentoo" ;;
        *arch*) dtype="arch" ;;
        *slackware*) dtype="slackware" ;;
        esac
      fi
      ;;
    esac
  fi
  echo "$dtype"
}

# İşletim sistemi versiyonunu göster
function ver {
  local dtype
  dtype=$(distribution)
  case "$dtype" in
  redhat)
    if [ -s /etc/redhat-release ]; then
      cat /etc/redhat-release
    else
      cat /etc/issue
    fi
    uname -a
    ;;
  suse) cat /etc/SuSE-release ;;
  debian) lsb_release -a ;;
  gentoo) cat /GENTOO-RELEASE ;;
  arch) cat /etc/os-release ;;
  slackware) cat /etc/slackware-version ;;
  *)
    if [ -s /etc/issue ]; then
      cat /etc/issue
    else
      echo "Hata: Bilinmeyen dağıtım"
      return 1
    fi
    ;;
  esac
}

# Gerekli destek dosyalarını kur
function install_bashrc_support {
  local dtype
  dtype=$(distribution)
  local FASTFETCH_URL
  case "$dtype" in
  redhat) sudo yum install multitail tree zoxide trash-cli fzf fastfetch ;;
  suse) sudo zypper install multitail tree zoxide trash-cli fzf fastfetch ;;
  debian)
    sudo apt-get install multitail tree zoxide trash-cli fzf
    FASTFETCH_URL=$(curl -s https://api.github.com/repos/fastfetch-cli/fastfetch/releases/latest | grep "browser_download_url.*linux-amd64.deb" | cut -d '"' -f 4)
    curl -sL "$FASTFETCH_URL" -o /tmp/fastfetch_latest_amd64.deb
    sudo apt-get install /tmp/fastfetch_latest_amd64.deb
    ;;
  arch) sudo paru -S multitail tree zoxide trash-cli fzf fastfetch ;;
  slackware) echo "Slackware için kurulum desteği yok" ;;
  *) echo "Bilinmeyen dağıtım" ;;
  esac
}

# IP adresi bulma
alias whatismyip='whatsmyip'
function whatsmyip {
  echo -n "Dahili IP: "
  if command -v ip &>/dev/null; then
    ip addr show wlan0 | grep "inet " | awk '{print $2}' | cut -d/ -f1
  else
    ifconfig wlan0 | grep "inet " | awk '{print $2}'
  fi

  echo -n "Harici IP: "
  curl -4 ifconfig.me
}

# GitHub Fonksiyonları
function gcom {
  git add .
  git commit -m "$1"
}

function lazyg {
  git add .
  git commit -m "$1"
  git push
}

#######################################################
# SON AYARLAMALAR VE ENTEGRASYONLAR
#######################################################

# ZSH -> 'cd', 'z' ve 'zi' fonksiyonlarınızın yerine
# ZSH -> Zsh'in 'chpwd' kancasını kullanıyoruz.
# ZSH -> Bu tek fonksiyon, herhangi bir şekilde (cd, z, zi, ...) dizin
# ZSH -> değiştirdiğinizde tetiklenir ve 'ls' (yani 'eza' alias'ı) çalıştırır.
function chpwd() {
  ls
}

# ZSH -> Bash 'bind' komutu Zsh'te 'bindkey' olarak kullanılır.
# Ctrl+f için 'zi' ataması
bindkey '^f' 'zi\n'

# Zoxide'ı başlat
# ZSH -> Bash versiyonu yerine Zsh versiyonunu kullanıyoruz.
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fastfetch
