# System paths
# /usr/local/bin = will use brew dependencies which are installed under local, then check for system bins
PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Python 

export PATH="/Users/macalpha/Library/Python/3.8/bin:$PATH"

#UID for terminal
export PS1="peace:"

# Java 
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home:$PATH"	

# set java env variable path 
PATH="$JAVA_HOME/bin:$PATH"

# Bioinfomratics tools in armory (if added/cloned) 
#PATH="/Users/eldintalundzic/_BIOF_venv/biof_armory/bbmap:$PATH"
#PATH="/Users/eldintalundzic/_BIOF_venv/biof_armory/bwa:$PATH"
#PATH="/Users/eldintalundzic/_BIOF_venv/biof_armory/samtools-1.7:$PATH"
#PATH="/Users/eldintalundzic/_BIOF_venv/biof_armory/bcftools-1.6:$PATH"
#export PATH

# Adding zenburn color scheme
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Adding color output in terminal 
alias ls='ls -G'
alias ll='ls -lG'

# Make some alias here to make it easier to open some files:

alias vbp='vim /Users/eldintalundzic/.bash_profile' 

alias vim_cs='vim /Users/eldintalundzic/MyGit/MiRefCards/vim_cs.sh'

alias git_cs='vim /Users/eldintalundzic/MyGit/MiRefCards/git_cs.sh'

alias bash_cs='vim /Users/eldintalundzic/MyGit/MiRefCards/bash_cs.sh'

alias md_cs='vim /Users/eldintalundzic/MyGit/MiRefCards/markdown_cs.md'



