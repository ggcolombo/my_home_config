# my_home_config
Configuration files for my $HOME

It adds local configurations for

**BASH**
 * display local directory only
 * display virtualenv if active - it expects [virtualenv](https://virtualenv.pypa.io/en/stable/) to be installed.
 * add [virtualenv wrapper](https://virtualenvwrapper.readthedocs.io/en/latest/) requirements
 * use [git-aware-prompt](https://github.com/jimeh/git-aware-prompt)
 * display git dirty state
 

**VIM**
 * dark theme

**NVIM**
 * tab, columns, clipboard, etc etc

**[R](https://www.r-project.org/)**
 * Fixed repos (imperial)
 * No strings as factors by default
 * console out width of 200 to display large data.frames in shell

### Branches
 * master is meant to contain configs to be used globally, ie on all machines I am using
 * yoga is meant to contain configs specific to the yoga laptop (Ubuntu)
 * other branches for other machines


*NOTES*:

Some features are commented out because not relevant outside of my machine, but they might be in the future.
Similarly some other features assume that certain locations exist on the system. 
These should be either satisfied, or commented out.
