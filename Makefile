SHELL=/bin/bash
MAIN=main
LATEX=pdflatex
BIBTEX=bibtex
DTM=$(shell date +%Y%m%d-%H%M)
RVDIR=./revisions/

all: clean build clear

build:
	$(LATEX) -shell-escape -draftmode $(MAIN).tex
	$(BIBTEX) $(MAIN)
	$(LATEX) -shell-escape -draftmode $(MAIN).tex
	$(LATEX) -shell-escape $(MAIN).tex

clean:
	@rm -f $(MAIN).{pdf,ps,log,lot,lof,toc,out,dvi,bbl,blg} *.aux
	@echo Cleared all temporary files and $(MAIN).pdf

clear:
	@rm -f $(MAIN).{ps,log,lot,lof,toc,out,dvi,bbl,blg} *.aux
	@echo Cleared all temporary files

save:
	@mkdir -p $(RVDIR)
	@cp $(MAIN).pdf $(RVDIR)$(MAIN)-revision-$(DTM).pdf
	@echo Saved the revision as: $(RVDIR)$(MAIN)-revision-$(DTM).pdf
