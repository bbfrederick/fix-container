# Settings file for FIX
# Modify these settings based on your system setup
FIXVERSION=1.06

# Get the OS and CPU type
FSL_FIX_OS=`uname -s`
FSL_FIX_ARCH=`uname -m`
FSL_FIXDIR=/opt/FSL_FIX
if [ -z "${FSL_FIXDIR}" ]; then
	FSL_FIXDIR=$( cd $(dirname $0) ; pwd)
	export FSL_FIXDIR
fi

# edit the following variables according to your local setup

# Part I MATLAB settings
# =======================
# Point this variable at your MATLAB install folder
if [ -z "${FSL_FIX_MATLAB_ROOT}" ]; then
       FSL_FIX_MATLAB_ROOT=/usr/local/matlab-2012b
       # On OS X this will most likely be something like /Applications/MATLAB_R20XX.app
fi
# On OS X this will most likely be something like /Applications/MATLAB_R20XX.app

# Point this variable at your MATLAB command - this is usually in
# $FSL_FIX_MATLAB_ROOT/bin/matlab
FSL_FIX_MATLAB=${FSL_FIX_MATLAB_ROOT}/bin/matlab

# Point this variable at your MATLAB compiler command - this is
# usually $FSL_FIX_MATLAB_ROOT/bin/mcc
FSL_FIX_MCC=${FSL_FIX_MATLAB_ROOT}/bin/mcc

# Point this variable at an installed MATLAB compiler runtime. This
# MUST be the same as the version given in the file MCR.version
# (which is populated when the software is compiled).
FSL_FIX_MCRROOT=/usr/local/MATLAB/MATLAB_Compiler_Runtime

if [ -f ${FSL_FIXDIR}/MCR.version ]; then
	FSL_FIX_MCRV=`cat ${FSL_FIXDIR}/MCR.version`
fi

if [ ! -z "${FSL_FIX_MCRV}" ]; then
	FSL_FIX_MCR=${FSL_FIX_MCRROOT}/${FSL_FIX_MCRV}
fi

# This is name of the folder containing the compiled MATLAB functions
FSL_FIX_MLCDIR=${FSL_FIXDIR}/compiled/${FSL_FIX_OS}/${FSL_FIX_ARCH}

# See README for instructions on compilation of the MATLAB portions

# Set this to the MATLAB start-up options. Typically you will
# want to disable Java, display output, the desktop environment
# and the splash screen
FSL_FIX_MLOPTS="-nojvm -nodisplay -nodesktop -nosplash"

# Set this to the MATLAB 'evaluate string' option
FSL_FIX_MLEVAL="-r"
# Set this to the pass in file option
FSL_FIX_MLFILE="\<"

# Part II Octave settings
# =======================
# Point this variable at your Octave command (or leave it blank to
# disable Octave mode
# Linux:
FSL_FIX_OCTAVE=/usr/bin/octave
# Mac OS X installed via MacPorts
#FSL_FIX_OCTAVE=/opt/local/bin/octave
# Disable Octave mode
#FSL_FIX_OCTAVE=

# Set this to the Octave start-up options. Typically you will need to
# enable 'MATLAB' mode (--traditional) and disable display output
FSL_FIX_OCOPTS="--traditional -q --no-window-system"

# Set this to the Octave 'evaluate string' option
FSL_FIX_OCEVAL="--eval"
# Set this to the pass in file option
FSL_FIX_OCFILE=""

# Part III General settings
# =========================
# This variable selects how we run the MATLAB portions of FIX.
# It takes the values 0-2:
#   0 - Try running the compiled version of the function
#   1 - Use the MATLAB script version
#   2 - Use Octave script version
FSL_FIX_MATLAB_MODE=2

# Set this to CIFTI Matlab Reader/Writer for use within HCP pipelines
FSL_FIX_CIFTIRW='/vols/Data/HCP/workbench/CIFTIMatlabReaderWriter';
# Set this to the location of the HCP Workbench command for your platform
FSL_FIX_WBC='/vols/Data/HCP/workbench/bin_linux64/wb_command';
export FSL_FIX_CIFTIRW FSL_FIX_WBC

# Set this to the location of the FSL MATLAB scripts
if [ -z "${FSLDIR}" ]; then
	echo "FSLDIR is not set!"
	exit 1
fi
FSL_FIX_FSLMATLAB=${FSLDIR}/etc/matlab

#############################################################
