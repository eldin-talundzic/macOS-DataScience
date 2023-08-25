
<details>
  <summary><strong>TODO</strong></summary>

> Author: @Eldo  
>> Edited: @Eldo 8/25/23 
----
>#### Active Activity ####

- [ ] Update doc to reflect latest osx set up 
- [ ] Make a install file to set up a new mac  

>#### Completed Activity ✓ ####

------
</details>


# Setting Up Your Development Environment on macOS

This guide will walk you through setting up a development environment on macOS, optimized for biocomputing and data analysis.

## 1. Install Xcode Command Line Tools

The Xcode Command Line Tools are essential for compiling code and installing software. Install them using the Terminal:

```bash
xcode-select --install
```

Follow the prompts and accept the license agreement.

## 2. Install Homebrew for Package Management

Homebrew is a package manager for macOS. Install it with the following command:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

## 3. Install Git for Version Control

Install an updated version of Git via Homebrew:

```bash
brew install git
```

## 4. Install Python

Install Python 3:

```bash
brew install python3
```

Install useful Python libraries:

```bash
pip install numpy scipy pandas biopython jupyter
```

## 5. Install R

Install R using Homebrew:

```bash
brew tap brewsci/science
brew tap brewsci/bio
brew cask install R
```

Install popular R packages:

```R
install.packages("tidyverse")
```

### 5a. Install RStudio for R Development

Download and install RStudio from their website: [RStudio Download](https://www.rstudio.com/products/rstudio/download/)

### 5b. Install MacTeX (Optional for Exporting PDFs)

For exporting Rmarkdown documents as PDFs, install MacTeX:

```bash
brew cask install mactex
```

## 6. Install [Neovim](https://neovim.io)  

Install Neovim, a versatile text editor:

```bash
brew install neovim 
```
### Recommended dependencies for neovim

### 6a. Install pynvim and virtualenv 

```bash
python3 -m pip install pynvim virtualenv
```

### 6b. Install node.js and npm  

```bash
brew install node 
```

<details>
  <summary><strong>Plugins For Neovim</strong></summary>

### Installing [Plugins](https://dotfyle.com/neovim/plugins/trending) for neovim 

To enhance your Neovim experience, you can install plugins using a plugin manager. One of the most popular and user-friendly plugin managers is **vim-plug**. Here's how to set it up:

1. **Install [vim-plug](https://github.com/junegunn/vim-plug):**

   Open your terminal and run the following command to download vim-plug:

   ```bash
   curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   ```

   This command installs the `plug.vim` script in the appropriate directory.

2. **Configure Plugins:**

   In your Neovim configuration file (`~/.config/nvim/init.vim` for Vimscript or `~/.config/nvim/init.lua` for Lua), add the following lines to define the plugins you want to install:

   ```vim
   " ~/.config/nvim/init.vim (Vimscript)
   " or
   " ~/.config/nvim/init.lua (Lua)

   call plug#begin('~/.config/nvim/plugged')

   " Example plugin installation
   Plug 'vim-airline/vim-airline'

   " Add more plugins here

   call plug#end()
   ```

   Replace `'vim-airline/vim-airline'` with the GitHub repository URLs of the plugins you want to install.

3. **Install Plugins:**

   Open Neovim and run the following command within the editor:

   ```vim
   :PlugInstall
   ```

   This will download and install the plugins specified in your configuration.

4. **Update and Manage Plugins:**

   To update your installed plugins, use the following command in Neovim:

   ```vim
   :PlugUpdate
   ```

   To remove a plugin, delete or comment out the corresponding `Plug` line in your configuration and run `:PlugClean` to remove the unused plugin files.

5. **Reopen Neovim:**

   After installing or updating plugins, restart Neovim for the changes to take effect.

That's it! You've set up vim-plug and installed plugins to enhance your Neovim environment. You can find various plugins on GitHub that cater to your specific development needs.

### Here is a vanilla version to get you started. Copy the below to your `~/.config/nvim/init.vim`: 

```vim
" Specify path to Python 3 interpretor
let g:python3_host_prog = '/usr/local/bin/python3'

" Diable provider and warnings for ruby 
let g:loaded_ruby_provider = 0

" Diable provider and warnings for pearl (cpan) 
let g:loaded_pearl_provider = 0

" VimPlugin manager https://github.com/junegunn/vim-plug

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" markdown preview https://dotfyle.com/plugins/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting:

```
------
</details>


## 7. Setting Up Github Using [SSH (Secure Shell Protocol)](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) 


<details>
  <summary><strong>Setting Up SSH for GitHub</strong></summary>

Using SSH keys for GitHub allows you to securely authenticate and communicate with your GitHub repositories without needing to enter your username and password each time. Here's how to set it up:

1. **Check for Existing SSH Key:**

   First, check if you already have an SSH key pair. Open your terminal and run:

   ```bash
   ls -al ~/.ssh
   ```

   Look for files named `id_rsa` and `id_rsa.pub`. If you have them, you already have an SSH key pair and can skip to step 4. If not, proceed to the next step.

2. **Generate a New SSH Key:**

   To generate a new SSH key, run the following command:

   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

   Replace `"your_email@example.com"` with your GitHub-associated email address. You can press Enter to accept the default file location (`~/.ssh/id_rsa`) and passphrase (or set a passphrase if you prefer added security).

3. **Add Your SSH Key to the ssh-agent:**

   Start the ssh-agent in the background:

   ```bash
   eval "$(ssh-agent -s)"
   ```

   Add your private key to the ssh-agent:

   ```bash
   ssh-add ~/.ssh/id_rsa
   ```

4. **Add SSH Key to Your GitHub Account:**

   Copy your public SSH key to your clipboard:

   ```bash
   pbcopy < ~/.ssh/id_rsa.pub
   ```

   - Visit GitHub and log in to your account.
   - Go to your profile settings.
   - Click "SSH and GPG keys" in the left sidebar.
   - Click "New SSH key" or "Add SSH key."
   - Give your key a meaningful title, like "MacBook SSH Key."
   - Paste the key into the "Key" field.

5. **Test the Connection:**

   To test that everything is set up correctly, run:

   ```bash
   ssh -T git@github.com
   ```

   You might see a message like `Hi username! You've successfully authenticated...`, which means your SSH key is properly configured.

6. **Configure Git to Use SSH:**

   Now, configure Git to use SSH URLs for your repositories. In your terminal, run:

   ```bash
   git config --global url."git@github.com:".insteadOf "https://github.com/"
   ```

   This ensures that when you clone or work with repositories, Git uses the SSH protocol.

That's it! You've successfully set up SSH for GitHub. From now on, you can use Git and interact with your GitHub repositories without needing to enter your username and password each time.

------
</details>


## 8. Update Configuration File `.zshrc` and Managing `$PATH` 

<details>
  <summary><strong>Setting Up Config File</strong></summary>

Here's a step-by-step guide on how to create a `.zshrc` file and ensure that correct paths are included in your `$PATH` to ensure that dependencies can be called:

### Creating `.zshrc` and Managing `$PATH`

Your `.zshrc` file is a configuration file for the Zsh shell. It allows you to customize your shell environment, including setting up paths for executable files (like binaries and scripts) to ensure your dependencies can be called. Here's how to create and manage it:

1. **Check if `.zshrc` Exists:**

   First, check if you already have a `.zshrc` file in your home directory. Open your terminal and run:

   ```bash
   ls -al ~/.zshrc
   ```

   If you see the file listed, you already have one and can proceed to step 4. If not, continue to the next step.

2. **Create `.zshrc` File:**

   To create a new `.zshrc` file, run:

   ```bash
   touch ~/.zshrc
   ```

   This command creates an empty `.zshrc` file in your home directory.

3. **Edit `.zshrc` File:**

   Open the `.zshrc` file using a text editor of your choice. You can use the `nvim` editor in your terminal:

   ```bash
   nvim ~/.zshrc
   ```
4. **Add Paths to `$PATH`:**

   Inside the `.zshrc` file, you'll set up your `$PATH` variable to include the correct paths for your installed software and dependencies. For example, if you installed Python, Node.js, and other tools, you'll need to include their executable paths.

   Here's an example of how you might update your `$PATH`:

   ```bash
   export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
   ```

   You should include paths where your dependencies' executables are located. Separate paths with colons (`:`).

5. **Save and Apply Changes:**

   After editing the `.zshrc` file, save your changes and close the text editor.

   In your terminal, apply the changes by running:

   ```bash
   source ~/.zshrc
   ```

   This command reloads the configuration, making the updated `$PATH` immediately effective.

6. **Test Your Changes:**

   To verify that your `$PATH` is correctly configured, you can run commands for the installed software. For instance, you should be able to run `python3`, `node`, and other commands without specifying their full paths.

That's it! You've created and configured your `.zshrc` file to ensure that the correct paths are included in your `$PATH`, allowing you to call dependencies without issues. Remember to adapt the paths in the example to match your actual installed software locations.

### Below is an Example Config File

```bash
### Example Config File 
# System Paths
# Set system paths including brew dependencies, system bins, and more
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

# Custom Prompt
# Configure a custom terminal prompt
export PS1="peace:"

# Java Configuration
# Set JAVA_HOME and add Java's bin directory to the PATH
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin:$PATH"

# Color Configuration
# Configure color output and color scheme
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Colorized ls Aliases
# Add aliases for colorized listing
alias ls='ls -G'
alias ll='ls -lG'

```


------
</details>


## Conclusion

With these steps, you'll have a powerful development environment for biocomputing, data analysis, and more on macOS.

Feel free to adapt this setup to your specific needs and preferences.

---

**Note:** Make sure to carefully read and understand the installation commands before executing them. Also, keep in mind that software and package versions may have changed since the time of writing. DO NOT USE `sudo` _super user_ commands to install anything. i

Tread cautiously with `Ruby`. It is troublesome with MacOS as it can cause unexpected issues. Apple provides an older version baked into the OS that is protected (for good reason). Hopefully in future versions Apple will remove it altogether allowing for easier managment of `Ruby`. 

