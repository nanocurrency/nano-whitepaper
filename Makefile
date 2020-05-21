# Build script for generating Nano Whitepaper

# sanity check for pdfLaTeX
PDFLATEX = pdflatex
PDFLATEX := $(shell which $(PDFLATEX))
ifndef PDFLATEX
$(error "No pdflatex found.")
endif

# sanity check for BibTex
BIBTEX = bibtex
BIBTEX := $(shell which $(BIBTEX))
ifndef BIBTEX
$(error "No bibtex found.")
endif

PAPER = main

all: $(PAPER).pdf

$(PAPER).pdf: $(PAPER).tex
	$(PDFLATEX) -interaction=batchmode $<
	$(BIBTEX) $(PAPER)
	$(PDFLATEX) $< 2>/dev/null >/dev/null

clean:
	$(RM) *.aux *.log $(PAPER).bib $(PAPER).pdf $(PAPER).bbl $(PAPER).blg 
