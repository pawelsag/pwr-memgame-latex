# LaTeX Makefile v0.33 -- LaTeX only

PAPER=src/main.tex  # set the path to your TeX file here
SHELL=/bin/bash # for the while loop below

all:  ## Compile paper
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error --pdf $(PAPER)

watch:  ## Recompile on updates to the source file
	@while true; do; inotifywait $(PAPER); make all; done
