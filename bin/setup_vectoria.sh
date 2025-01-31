#
# VECTORIA
#
# @authors: 
#

# Load necessary modules
module load <...>
echo "All modules loaded..."

source /path/to/installdir/vectoria_env/bin/activate
echo "Environment loaded..."

# extract path of bin directory and after cut it to obtain VECTORIA package path
BINDIR=$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd -P)
VECTORIA_PATH=${BINDIR%%bin} # %% is a subtraction operation --> $BINDIR - bin 
echo 'BINDIR='$BINDIR
echo 'VECTORIA_DIR='$VECTORIA_PATH

# set bin path to system path and package path to python path
export PATH=$BINDIR:$PATH
export PYTHONPATH=$VECTORIA_PATH:$PYTHONPATH

# define cleaning alias
alias pyccleandir="find . -name '*.pyc' -delete"
alias vectoriacleandir='cd $VECTORIA_HOME ; pyccleandir ; cd $OLDPWD'
alias sclean='rm 10*.out 10*.err; echo ""; echo "Old files (.out & .err) removed..."; echo ""'
