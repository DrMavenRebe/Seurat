# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
#[ -z "$PS1" ] && return

#git info
function parse_git_branch {
    git rev-parse --git-dir > /dev/null 2>&1
    if [ $? -eq 0 ]; then
        git_status="$(git status 2> /dev/null)"
        branch_pattern="^# On branch ([^${IFS}]*)"
        detached_branch_pattern="# Not currently on any branch"
        remote_pattern="# Your branch is (.*) of"
        diverge_pattern="# Your branch and (.*) have diverged"
        untracked_pattern="# Untracked files:"
        new_pattern="new file:"
        not_staged_pattern="Changes not staged for commit"

        #files not staged for commit
        if [[ ${git_status}} =~ ${not_staged_pattern} ]]; then
            state="✔"
        fi
        # add an else if or two here if you want to get more specific
        # show if we're ahead or behind HEAD
        if [[ ${git_status} =~ ${remote_pattern} ]]; then
            if [[ ${BASH_REMATCH[1]} == "ahead" ]]; then
                remote="↑"
            else
                remote="↓"
            fi
        fi
        #new files
        if [[ ${git_status} =~ ${new_pattern} ]]; then
            remote="+"
        fi
        #untracked files
        if [[ ${git_status} =~ ${untracked_pattern} ]]; then
            remote="✖"
        fi
        #diverged branch
        if [[ ${git_status} =~ ${diverge_pattern} ]]; then
            remote="↕"
        fi
        #branch name
        if [[ ${git_status} =~ ${branch_pattern} ]]; then
            branch=${BASH_REMATCH[1]}
        #detached branch
        elif [[ ${git_status} =~ ${detached_branch_pattern} ]]; then
            branch="NO BRANCH"
        fi

        echo " ( ${branch} ${state}${remote})"
    fi
    return
}

function tabname {
  printf "\e]1;$1\a"
}
function winname {
  printf "\e]2;$1\a"
}

export PS1="\u@\h : \w \$(parse_git_branch) $ "

# common shell utils
if [ -d "${HOME}/.commonsh" ] ; then
	for file in "${HOME}"/.commonsh/* ; do
		. "${file}"
	done
fi

# extras
if [ -d "${HOME}/.bash" ] ; then
	for file in "${HOME}"/.bash/* ; do
		. "${file}"
	done
fi

#RAILS STUFF
alias remigrate='rake db:drop && rake db:create && rake db:migrate && rake db:schema:dump && rake db:test:prepare'
alias be='bundle exec'

#AWS
export AWS_HOME=/Users/dBremner/Development/AWS
export AWS_CREDENTIAL_FILE=$AWS_HOME/credentials.txt
export AWS_AUTO_SCALING_HOME=$HOME/Development/AWS/AutoScaling-1.0.61.1
export EC2_TOOLS_DIR=$HOME/Development/AWS/ec2
export EC2_AMITOOL_HOME=/Users/dBremner/Development/AWS/ec2-ami-tools/current
export EC2_APITOOL_HOME=/Users/dBremner/Development/AWS/ec2-api-tools/current
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home

export AWS_AUTO_SCALING_URL=https://autoscaling.us-west-1.amazonaws.com
export EC2_REGION=us-west-1

export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH=$PATH:$AWS_AUTO_SCALING_HOME/bin:$EC2_APITOOL_HOME/bin:$EC2_AMITOOL_HOME/bin

# iTerm Tab Names
export PROMPT_COMMAND=''

