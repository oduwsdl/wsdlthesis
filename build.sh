#!/usr/bin/env bash

texCommand="pdflatex"
bibCommand="bibtex"
src="main"
dateTime=$(date +%Y%m%d-%H%M)
revDir="./revisions/"

clean () {
  rm -f ${src}.{pdf,ps,log,lot,lof,toc,out,dvi,bbl,blg,bcf} *.aux
  rm -f ${src}.synctex.gz
  echo Cleared all temporary files and ${src}.pdf
}

clear_ () {
  rm -f ${src}.{ps,log,lot,lof,toc,out,dvi,bbl,blg,bcf} *.aux
  rm -f ${src}.synctex.gz
  echo Cleared all temporary files
}

build () {
  ${texCommand} -shell-escape -synctex=1 -interaction=nonstopmode ${src}.tex
  ${bibCommand} ${src}.aux
  ${texCommand} -shell-escape -synctex=1 -interaction=nonstopmode ${src}.tex
  ${texCommand} -shell-escape -synctex=1 -interaction=nonstopmode ${src}.tex
  echo Built ${src}.tex
}

save () {
  if [[ ! -d "$revDir"  ]]; then
    mkdir -p ${revDir}
  fi
  if [[ ! -f "$src".pdf ]]; then
    build
  fi
  cp  ${src}.pdf ${revDir}${src}-revision-${dateTime}.pdf
  echo Saved ${src}.pdf as ${revDir}${src}-revision-${dateTime}.pdf
}

if [ $# -eq 0 ]; then
   clean
   build
   clear_
elif [ "$1" = "build" ]; then
   build
elif [ "$1" = "clean" ]; then
   clean
elif [ "$1" = "clear" ]; then
   clear_
elif [[ "$1" = "save" ]]; then
  save
fi
