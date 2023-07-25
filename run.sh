#!/bin/bash 
verbose=false
ignore=false
pdf=false
biber=false
bibtex=false
latexCmd="pdflatex --output-directory=build/"
for parameter in $1 $2 $3; do
  if [ $parameter == "-verbose" ]; then
    verbose=true
  fi
  if [ $parameter == "-pdf" ]; then
    pdf=true
  fi
  if [ $parameter == "-ignore" ]; then
    ignore=true
  fi
  if [ $parameter == "-biber" ]; then
    biber=true
  elif [ $parameter == "-bibtex" ]; then
    bibtex=true
  fi
done
if [ $ignore == true ]; then
  latexCmd=$latexCmd' -interaction=nonstopmode'
fi
latexCmd=$latexCmd' main.tex'
if [ $verbose == false ]; then
  latexCmd=$latexCmd' > /dev/null 2>&1'
fi
eval $latexCmd
if [ $biber == true ]; then
  eval 'biber build/main.bcf'
  eval $latexCmd
fi
if [ $bibtex == true ]; then
  eval 'bibtex build/main.aux'
  eval $latexCmd
fi
if [ $pdf == true ]; then
  nohup evince build/main.pdf > build/evince.log &
fi
