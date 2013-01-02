# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

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

#CANARYWARE
export CANARYWARE_WRENCH=/Users/dBremner/Development/canaryware/wrench

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

