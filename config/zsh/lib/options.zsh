# navigation options
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
setopt COMPLETEALIASES
#setopt auto_cd              # Auto changes to a directory without typing cd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt AUTO_NAME_DIRS       # Auto add variable-stored paths to ~ list.
setopt MULTIOS              # Write to multiple descriptors.
#setopt CLOBBER              # turn off warning "file exists" with > and >>
setopt LOCAL_OPTIONS # allow functions to have local options
setopt LOCAL_TRAPS # allow functions to have local traps

# history options
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
#setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks from history items.

# Options related with completions
# setopt GLOB_COMPLETE      # Show autocompletion menu with globs
setopt EXTENDED_GLOB         # Enabled extended globbing / needed for file modification glob modifiers with compinit
setopt MENU_COMPLETE        # Automatically highlight first element of completion menu
unsetopt FLOW_CONTROL     # disable start/stop characters in shell editor
unsetopt CASE_GLOB        # makes globbing (filename generation) case-sensitive
#setopt AUTO_MENU            # show completion menu on a successive tab press
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # move cursor to the end of a completed word
setopt AUTO_PARAM_SLASH     # if completed parameter is a directory, add a trailing slash
setopt PATH_DIRS            # perform path search even on command names with slashes
setopt GLOBDOTS             # files beginning with a . be matched without explicitly specifying the dot

