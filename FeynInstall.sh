#! /bin/bash
# installation script for FeynArts, FormCalc, and LoopTools
# last modified 23 Jun 21 th

# if started from within a directory DIR (e.g. the user's
# home directory), the final directory structure will be:
#	DIR/$fadir
#	DIR/FeynArts (link to $fadir)
#	DIR/$fcdir
#	DIR/FormCalc (link to $fcdir)
#	DIR/$ltdir
#	DIR/LoopTools (link to $ltdir)

fadir=FeynArts-3.11
fatar=$fadir.tar.gz

fcdir=FormCalc-9.9
fctar=$fcdir.tar.gz

ltdir=LoopTools-2.16
lttar=$ltdir.tar.gz

cwd="`pwd`"

id=`id -u`

system="`uname -s`"

#unset http_proxy

dltool() {
  wget="curl --location --remote-name --user-agent FeynInstall"
  $wget --version > /dev/null 2>&1 && return
  wget="wget --user-agent FeynInstall"
  $wget --version > /dev/null 2>&1 && return
  echo "Please install either curl or wget"
  exit 1
}

dltool


askFeynArts=:
askFormCalc=:
askLoopTools=:

feyninstall() {
  eval "ask$1='ask $1'"
  make -f - > install.log-$1 &&
    echo "$1 installed successfully" ||
    echo "Installation error, please check install.log-$1"
}


echo "Install FeynArts in $cwd/FeynArts?"
read yesno
case "$yesno" in
[yY]*)
  feyninstall FeynArts << _EOF_
InstallFeynArts:
	@echo "... downloading $fatar" 1>&2
	$wget http://feynarts.de/$fatar 2>&1
	rm -fr $fadir
	@echo "... unpacking tar file" 1>&2
	gunzip -c $fatar | tar xf -
	rm -f FeynArts
	ln -s $fadir FeynArts
	rm -f $fatar
	@echo "... done" 1>&2
_EOF_
  ;;
esac
echo ""


echo "Install LoopTools in $cwd/LoopTools?"
read yesno
case "$yesno" in
[yY]*)
  feyninstall LoopTools << _EOF_
InstallLoopTools:
	@echo "... downloading $lttar" 1>&2
	$wget http://feynarts.de/looptools/$lttar 2>&1
	rm -fr $ltdir
	@echo "... unpacking tar file" 1>&2
	gunzip -c $lttar | tar xf -
	@echo "... compiling" 1>&2
	(cd $ltdir && ./configure && \$(MAKE) default install clean) 2>&1
	(cd $ltdir && ./configure --quad && \$(MAKE) default install clean) 2>&1
	rm -f LoopTools
	ln -s $ltdir LoopTools
	rm -f $lttar
	@echo "... done" 1>&2
_EOF_
  ;;
esac
echo ""


echo "Install FormCalc in $cwd/FormCalc?"
read yesno
case "$yesno" in
[yY]*)
  feyninstall FormCalc << _EOF_
InstallFormCalc:
	@echo "... downloading $fctar" 1>&2
	$wget http://feynarts.de/formcalc/$fctar 2>&1
	rm -fr $fcdir
	@echo "... unpacking tar file" 1>&2
	gunzip -c $fctar | tar xf -
	rm -f FormCalc
	ln -s $fcdir FormCalc
	@echo "... compiling" 1>&2
	cd $fcdir && ./compile 2>&1
	rm -f $fctar
	@echo "... done" 1>&2
_EOF_
  ;;
esac
echo ""


mathcmd=math
shopt -s nullglob > /dev/null 2>&1
set --
case "$system" in
Darwin)
	mathcmd=MathKernel
	set -- /Applications/Mathematica*/Contents/MacOS \
	       "$HOME"/Desktop/Mathematica*/Contents/MacOS ;;
CYG*)
	w64="`cygpath -u "${ProgramW6432:-/cygdrive/c/Program Files}"`"
	w32="`cygpath -u "${PROGRAMFILES:-/cygdrive/c/Program Files (x86)}"`"
	eval set -- `ls -tdQ {"$w64","$w32"}/"Wolfram Research"/Mathematica/*` ;;
esac
mathcmd="`IFS=:
  PATH="$PATH:$*" which $mathcmd`"

if "$mathcmd" -run "Print[7 673]; Exit" < /dev/null | grep 4711 > /dev/null ; then
  eval -- `"$mathcmd" -run '
    path[$Failed] = "";
    path[file_] := FileInformation[file][[1,2]];
    Print["pathFeynArts=\"" <> path[System\`Private\`FindFile["FeynArts\`"]] <> "\""];
    Print["pathFormCalc=\"" <> path[System\`Private\`FindFile["FormCalc\`"]] <> "\""];
    Print["pathLoopTools=\"" <> path[System\`Private\`FindFile["LoopTools"]] <> "\""];
    Exit[]
  ' < /dev/null | tail -3 | tr '\r' ' '`

  ask() {
    dir="$cwd/$5"
    test "$dir/$3" -ef "$4" && return
    echo "Do you want to add $dir to Mathematica's \$Path,"
    echo "such that $1 can be loaded with just '$2'?"
    read yesno
    case "$yesno" in
    [yY]*)
	case "$system" in
	CYG*)	printf -v dir "%q" "`cygpath -w "$dir"`" ;;
# Note: cygpath will also canonicalize the directory, i.e. point to
# the versioned directory, not the symlink.  This cannot be helped,
# however, as Mathematica is a non-Cygwin program which doesn't 
# understand Cygwin's symlinks.
	esac
	mmapath="$mmapath, \"$dir\"" ;;
    esac
    echo ""
  }

  $askFeynArts '<< FeynArts`' FeynArts.m "$pathFeynArts" FeynArts
  $askFormCalc '<< FormCalc`' FormCalc.m "$pathFormCalc" FormCalc
  $askLoopTools 'Install["LoopTools"]' LoopTools "$pathLoopTools" LoopTools/*/bin

  test -n "$mmapath" && "$mathcmd" -run "mmapath={0$mmapath}" -run '
    prefdir = ToFileName[$PreferencesDirectory, "Kernel"];
    If[ FileType[prefdir] === None, CreateDirectory[prefdir] ];
    hh = OpenAppend[ToFileName[prefdir, "init.m"]];
    WriteString[hh, "\n"];
    Block[ {home = ToFileName[$HomeDirectory], $HomeDirectory, ToFileName},
      ToFileName[s_] := s;
      SetAttributes[Write, HoldRest];
      Write[hh, $Path = Join[#, $Path]]&[ ToFileName@@@
        StringSplit[Rest[mmapath], home -> $HomeDirectory] ]
    ];
    Print["Modified ", Close[hh]];
    Exit[]
  ' < /dev/null | tail -1
else
  echo "Cannot run Mathematica (license problems?)."
  echo "Skipping modification of \$Path."
fi


cat << \_EOF_

-------------------------------------------------------------------

Thank you for using FeynArts, FormCalc, and LoopTools.

If you find any bugs, or want to make suggestions, or just write
fan mail, address it to Thomas Hahn <hahn@feynarts.de>.

Considering the manpower that has gone and still goes into the 
development of these packages, it is about fair that you cite the
following references if you use FeynArts, FormCalc, or LoopTools
to produce published results:

FeynArts 3:
  T. Hahn, Comput. Phys. Commun. 140 (2001) 418
  [hep-ph/0012260]

The MSSM model file of FeynArts:
  T. Hahn, C. Schappacher, Comput. Phys. Commun. 143 (2002) 54
  [hep-ph/0105349]
including counter-terms:
  T. Fritzsche, T. Hahn, S. Heinemeyer, H. Rzehak, C. Schappacher,
  Comput. Phys. Commun. 185 (2014) 1529 [arXiv:1309.1692]

FormCalc and LoopTools:
  T. Hahn, M. Perez-Victoria, Comput. Phys. Commun. 118 (1999) 153
  [hep-ph/9807565]

_EOF_

