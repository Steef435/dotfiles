Dotfiles
========
Some of my configuration files. Feel free to be inspired in the same way I was before.

Package overview
----------------
### colors ###
Contains color definitions for .Xresources and shells. May be depended on by other packages. Including is recommended.

### git ###
Contains git configuration files.

### gtk2 ###
GTK+2 configuration files. Nothing more than a standard gtkrc really.

### gtk3 ###
Contains GTK+3 configuration files (settings.ini).

### vim ###
Contains vim configuration files and colors (may depend on colors)

### xinit ###
Contains .xinitrc and possible related files.

### Xresources ###
Contains a .Xresources file, mainly for terminals only (xterm, rxvt-unicode).
Depends on colors.

### zsh ###
Contains zsh configuration files (.zshrc). May depend on colors.

Import using stow
-----------------
The following will create symbolic links to all files in a package directory from within $HOME:

	cd dotfiles
	stow [package]

Subsequently, to "import" all dotfiles:

	cd dotfiles
	stow *
