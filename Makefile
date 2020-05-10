# LaTeX Makefile v0.33 -- LaTeX only

PAPER_NAME:=main
PAPER:=src/$(PAPER_NAME).tex  # set the path to your TeX file here
SHELL:=/bin/bash # for the while loop below
OUTDIR:=build
TARGET:=$(OUTDIR)/$(PAPER_NAME).pdf

$(TARGET):  $(PAPER) ## Compile paper
	pdflatex -interaction nonstopmode -halt-on-error -file-line-error -output-directory build --pdf $(PAPER)

watch:  ## Recompile on updates to the source file
	@while true; do; inotifywait $(PAPER); make all; done

clean:
	@rm -f build/*

.PHONY: clean
