# This makefile is a bit of a lazy shortcut (we *could generate each of the intermediate files with specific rules only when we need to) but it works and it's short.


LaTeXSources= $(wildcard *.tex *.bib) ucl_thesis.cls

.PHONY: all clean superclean
all: phd-thesis.pdf mres-thesis.pdf mphil-thesis.pdf phd-thesis-twoside.pdf


phd-thesis.pdf mres-thesis.pdf mphil-thesis.pdf phd-thesis-twoside.pdf: $(LaTeXSources)
	lualatex --halt-on-error $(basename $@).tex
	bibtex $(basename $@)
	lualatex --halt-on-error $(basename $@).tex
	lualatex --halt-on-error $(basename $@).tex



clean: 
	-@rm -v *.aux *.lof *.log *.lot *.fls *.out *.toc *.dvi *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml *.fdb_latexmk *.synctex.gz *.pdfsync *.alg *.loa *.thm *.nav *.snm *.vrb *.acn *.acr *.glg *.glo *.gls *.brf *.lol *.idx *.ilg *.ind *.ist *.maf *.mtc *.mtc0 *.pyg *.nlo *.sagetex.sage *.sagetex.py *.sagetex.scmd *.sout *.sympy *.tdo *.xdy 

superclean: clean
	-@rm *.pdf

