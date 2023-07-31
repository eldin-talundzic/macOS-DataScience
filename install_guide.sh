####updated 4/5/22 @ET 
#####OSX Monterey 
 
##Take a look at:http://www.benjack.io/2016/01/02/el-capitan-biocomputing.html
##http://sourabhbajaj.com/mac-setup/Python/numpy.html

##1 Install osx dev kit [xcode] and homebrew, run following command in terminal  

###Install xcode command line dev tools if not done already
xcode-select --install 	

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

## SEE: https://www.mediaglasses.blog/2021/10/30/managing-python-on-macos-monterey/ as of 4/4/22 
## SEE: https://opensource.com/article/19/5/python-3-default-mac
	
##Visit https://brew.sh if above is outdated
### Use homebrew to install: 

brew install gcc 
	
brew install pyenv 
pyenv install 3.10.1 	# change to latest version at time of set up 
pyenv global 3.10.1 
pyenv version 		# check version 

### The power of pyenv comes from its control over our shell's path. For it to work correctly, we need to add following to config .zshrc: 
echo -e $'if command -v pyenv 1>/dev/null 2>&1; then\n export PYENV_ROOT="$HOME/.pyenv"\n export PATH="$PYENV_ROOT/bin:$PATH"\n eval "$(pyenv init --path)"\n eval "$(pyenv init -)"\nfi' >> ~/.zshrc

brew install vim

##Install needed dependencies for vim; otherwise, won't work with .vimrc
##Gets Vundle = package manager for vim
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

##See: https://clay-atlas.com/us/blog/2021/09/04/mac-os-en-install-vim-support-python3/ 
##To isntall vim with python + support

brew install scipy
brew install numpy

##2 Jupyter notebook:http://jupyter.org/install.html

## Jupyter uses python 3, so make sure to install appropriate dependencies with pip3 (i.e. pip3 install numpy,..)

python3	-m pip install --upgrade pip
python3 -m pip install jupyter

## Start notbook via

jupyter-lab 

## If you run into errors in jupyter, its likely because numpy, scipy and pd are not installed under py3
## Run following to see if it will resolve issue:

python3 -m pip3  install numpy
python3 -m pip3  install scipy
python3 -m pip3  install pandas
python3 -m pip3  install scikit-bio	# http://scikit-bio.org, might need to update was beta 

##3 Set up bitbucket:https://www.atlassian.com/git/tutorials/install-git#install-the-git-credential-osx 

brew install git 

##SET UP SSH as it is more secure 
  
cd ./ssh 

##READ BEFOREHAND: https://pawelgrzybek.com/multiple-ssh-keys-for-multiple-bitbucket-github-accounts/
	
##BITBUCKET  
    
##Create a public and private keys; type ed25519 email "eldin.talundzic@icloud.com" 
ssh-keygen -t ed25519 -C "eldin.talundzic@icloud.com" 

##Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
##$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

##Type mypit when prompted for file in which to save the key
mybit 

###Add passphrase that you can remember

##GITHUB  
    
##Create a public and private keys; type ed25519 email "eldin.talundzic@icloud.com" 
ssh-keygen -t ed25519 -C "etalundzic@cdc.gov" 

##Note: If you are using a legacy system that doesn't support the Ed25519 algorithm, use:
##$ ssh-keygen -t rsa -b 4096 -C "your_email@example.com"

##Type mypit when prompted for file in which to save the key
cdc	

##To add passphrase to keychain and automatically load keys 


##Update config file to allow ssh to both acounts; restart terminals after updating and ssh-add *
vim config

##Add to config 
'''
Host bitbucket.org
  HostName bitbucket.org
  IdentityFile ~/.ssh/mybit
  AddKeysToAgent yes 
  UseKeychain yes 

Host personal
  HostName bitbucket.org
  IdentityFile ~/.ssh/companyName

Host github.com
  HostName github.com
  IdentityFile ~/.ssh/cdc
  AddKeysToAgent yes 
  UseKeychain yes 

Host cdc 
  HostName github.com
  IdentityFile ~/.ssh/companyName
'''

##Add mybit key to ssh AO agent 
ssh-add --apple-use-keychain --apple-load-keychain cdc	

ssh-add --apple-use-keychain --apple-load-keychain mybit 	
	
##Copy public key to bitbucket 
pbcopy < mybit.pub	# copy public key to bitbucket 

pbcopy < cdc.pub	# copy public key to github 

##MAKE SURE TO DOWNLOAD git clone the 'SSH' version and not "HTPPS"

##Download project repos along with dependencies for completing osx setup 
cd ~
mkdir MyGit/	      	# To use same .bash_profile file from previous set up
cd MyGit/

git clone git@bitbucket.org:eldotal/myosx_setup.git && \
git clone git@bitbucket.org:eldotal/mirefcards.git && \
git clone git@bitbucket.org:eldotal/_biof_venv.git && \
git clone git@bitbucket.org:eldotal/djwebapp.git && \
git clone git@bitbucket.org:eldotal/mypy.git && \
git clone git@bitbucket.org:eldotal/mybypy.git && \	

cd myosx_setup/

##4 Complete vim set up 
cd ~/.vim
mkdir colors
cd -				# go back to previous dir = /MyGit/myosx_setup
cp zenburn.vim ~/.vim/colors
##In ../myosx_setup/vim/ dir contains two vimrc (config files); zenburn (has python inden.) 
##called vimrc_my and a python vim IDE called vimrc_py. Copy them over to ~/ [root]
##to use cp either over as the .vimrc

##Install the zenburn profile from the myosx_setup/Terminal
	##Terminal Prefs > settings cog (buttom) > import > zenburn.terminal


##5 Copy over .bash_profile to ~/.zsh [root dir] 

cd ~/MyGit/myosx_setup/
cp bash_profile ~/
cd ~/.zsh

##The following is needed in the .bash_profile for vim to work, just check its in there

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

	# Depending on set up, you will need to modify $PATHS, alias and still install jdk 	
	# Restart terminal


##6 Set up VIM plugins (Vundle)

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  
	
	# See git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim for more directions 

##7 Install atom 
		#Download and install from: https://atom.io  #run atom, settings > install shell commands 
	

##TODO: write a bash and/or python script to automate the above process



