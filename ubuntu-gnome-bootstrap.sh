# enable tap-to-click for trackpads

synclient TapButton1=1 TapButton2=3 TapButton3=2

# add some repositories

sudo add-apt-repository ppa:numix/ppa -y

# initial upgrades

sudo apt update
sudo apt upgrade -y

# install some basics

sudo apt install zsh git curl nodejs npm python-pip chromium-browser virtualbox vlc variety -y

# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# global dark theme

touch ~/.config/gtk-3.0/settings.ini
echo gtk-application-prefer-dark-theme=1 >> ~/.config/gtk-3.0/settings.ini

# numix theme

sudo apt install numix-gtk-theme numix-icon-theme-circle -y

gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.interface icon-theme "Numix-Circle"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"

# wallpaper

# disable alert sounds
# https://askubuntu.com/a/178480

gsettings set org.gnome.desktop.sound event-sounds false

# open firefox add-on install pages
# kill it first to make sure we're running the updated version (to support newest add-ons)

pkill -f firefox

sleep 1

firefox & echo 'Opening Add-on pages in in 3s...'

sleep 3

# webextensions only - for firefox 57+ support
firefox -new-tab 'https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/'\
        -new-tab 'https://addons.mozilla.org/en-US/firefox/addon/leechblock-ng/'\
        -new-tab 'https://addons.mozilla.org/en-US/firefox/addon/cookie-autodelete/'\
        -new-tab 'https://addons.mozilla.org/en-US/firefox/addon/greasemonkey/'

# install atom from deb
# https://askubuntu.com/a/51859

TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" 'https://atom.io/download/deb' &&
sudo dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

# install atom packages

apm install Delete-Whitelines advanced-open-file atom-beautify atom-idiomatic-comments-css-snippets atom-material-numix-syntax atom-terminal auto-detect-indentation autoclose-html base-darker-high-contrast-syntax- busy-signal color-picker css-specificity cssfmt docblockr es-javascript expose file-icons highlight-selected intentions jumpy language-babel language-mustache linter linter-csslint linter-htmlhint linter-jshint linter-ui-default lorem minimap minimap-highlight-selected numix-ui open-recent package-sync pigments remote-atom sort-lines

# open variety
variety &;

echo Done!

# change shell to zsh
chsh -s $(which zsh)
zsh
