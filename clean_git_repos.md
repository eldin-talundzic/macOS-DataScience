## To clean up big git repos ##

See [git-filter repo](https://www.redhat.com/sysadmin/clean-git-repository)
`brew install git-filter-repo`

See [man git-filter repo](https://manpages.debian.org/testing/git-filter-repo/git-filter-repo.1.en.html) examples below the Discussion. 

To check repo size, clone and run `git count-objects-v`

### HOW TO REMOVE SPECIFIC FILES ###  

***Importantly, let collaborators know they'll need to re-clone repo after this is done*** 

> Go to specific repo and run analysis

```bash
# Delete any local repo clones 
rm -rf MaRS/

# Get a fresh clone of repo
git clone --bare --mirror git@github.com:CDCgov/MaRS.git 

# Check repo disk size 
du -hs MaRS.git

# Run analysis and remove specific files 
cd MaRS.git                   # change dir into MaRS.git 
git filter-repo --analyze     # get size of files in repo 
cd .git      		      # a new dir is created in .git; change to it 
cd filter-repo/analysis       
cat path-all-sizes.txt        # view files along with sizes 

# To delete file .DS_Store

git filter-repo --invert-paths --path '.DS_Store' --use-base-name

#OR

git filter-repo --invert-paths --path-glob '*/.DS_Store' --path '.DS_Store'

# To delete entire directory; example here is dir, example_data

git filter-repo --invert-paths --path /example_data --force

# Force push changes to remote 
git push -f 

```
Clone the new repo now and let collaborators know as well.  

# See for additional examples: [man git-filter repo](https://manpages.debian.org/testing/git-filter-repo/git-filter-repo.1.en.html)


> Depricated. See, but don't use: See [git filter-branch](https://junyonglee.me/github/How-to-clean-up-git-repository/

