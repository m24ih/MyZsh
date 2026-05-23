fastfetch
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Proton Pass
export SSH_AUTH_SOCK="$HOME/.ssh/proton-pass-agent.sock"
export PROTON_PASS_LINUX_KEYRING=dbus

plugins=(
  git
  docker
  docker-compose
  archlinux
  conda
  zsh-autosuggestions
  zsh-history-substring-search
  zsh-completions
  zsh-autopair
  zsh-syntax-highlighting
)

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
source $ZSH/oh-my-zsh.sh
#source /usr/share/cachyos-zsh-config/cachyos-config.zsh

# ---------------------------------------------------------------------------
# ZSH -> KULLANICIYA ÖZEL AYARLAMALAR (OMZ'den SONRA)
# ---------------------------------------------------------------------------

# ZSH -> BU AYARI ETKİNLEŞTİRMEK İÇİN TERMİNALDE BİR KEZ 'conda init zsh' YAZIN.
# ZSH -> Bu komut, aşağıya otomatik olarak doğru Zsh kodunu ekleyecektir.
# <<< conda initialize (ZSH tarafından yönetilecek) >>>


ENABLE_CORRECTION="true"
setopt correct_all

# --- Değişken Tanımlamaları ---
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"
export LINUXTOOLBOXDIR="$HOME/linuxtoolbox"
export EDITOR="nvim"
export VISUAL="nvim"

# --- Android SDK Ayarları ---
export ANDROID_HOME="/opt/android-sdk"
export ANDROID_AVD_HOME="$HOME/.android/avd"

# --- Java Ayarı ---
export JAVA_HOME='/usr/lib/jvm/java-25-openjdk'

# --- Flutter ve Dart ---
export FLUTTER_HOME="/opt/flutter"
export PUB_CACHE="$HOME/.pub-cache"

# --- PATH Yönetimi ---
path=(
  $path                                # Mevcut PATH
  "$HOME/.local/bin"                   # Sona eklendi
  "$HOME/.cargo/bin"
  "/var/lib/flatpak/exports/bin"
  "$HOME/.local/share/flatpak/exports/bin"
  "$HOME/anaconda3/bin"
  "$FLUTTER_HOME/bin"
  "$PUB_CACHE/bin"
  "$ANDROID_HOME/platform-tools"
  "$ANDROID_HOME/cmdline-tools/latest/bin"
  "$ANDROID_HOME/emulator"
  "$ANDROID_HOME/tools/bin"
)
export PATH

# --- Alias (Kısayol) Tanımlamaları ---
alias spico='sudo pico'
alias snano='sudo nano'
alias vim='nvim'
alias vi='nvim'
alias svi='sudo nvim'
alias vis='nvim "+set si"'
alias grep='rg'
alias ezshc='nvim ~/.zshrc'
alias ebashc='nvim ~/.bashrc' # Eskisini de isterseniz tutabilirsiniz

alias btop="sudo -E btop"

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
alias ls='eza -l --icons --git --header'
alias l='eza --icons --git'
alias ll='eza -la --icons --git --header'
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

alias cat='bat'

# Paru alias
# Temel Komut
alias p="paru"
# Güncelleme
alias pup="paru -Syu"
# Kurulum
alias pin="paru -S"
# Silme (En temiz silme yöntemi)
alias prm="paru -Rns"
# Arama
alias pse="paru -Ss"
# Interaktif arama
alias paruf="paru -Slq | fzf --multi --preview 'paru -Sii {1} --color always' --preview-window=down:75% --ansi | xargs -ro paru -S"

# Yay alias
# Temel Komut
alias y="yay"
# Güncelleme
alias yup="yay -Syu"
# Kurulum
alias yin="yay -S"
# Silme (En temiz silme yöntemi)
alias yrm="yay -Rns"
# Arama
alias yse="yay -Ss"
# Interaktif arama
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"


# Envycontrol
alias integrated="sudo envycontrol -s integrated --verbose"
alias hybrid="sudo envycontrol -s hybrid --verbose"


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

function chpwd() {
  ls
}

# ZSH -> Bash 'bind' komutu Zsh'te 'bindkey' olarak kullanılır.
# Ctrl+f için 'zi' ataması
bindkey '^f' 'zi\n'

# zsh-history-substring-search tuş atamaları
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Veya bazı terminaller için alternatif kodlar (Garanti olsun diye ikisini de ekleyebilirsin)
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


# Zoxide'ı başlat
# ZSH -> Bash versiyonu yerine Zsh versiyonunu kullanıyoruz.
eval "$(zoxide init zsh)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

