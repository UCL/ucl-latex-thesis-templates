# This Makefile is designed to be used with GNU Make to run the LaTeX commands to generate a thesis.
#
# If you're not using the Linux or OS X command line, you probably won't need this.


# The target definitions are a bit of a lazy shortcut (we *could generate each of the intermediate files with specific rules only when we need to) but it works and it's short.

LaTeXSources= $(wildcard *.tex *.bib) ucl_thesis.cls

.PHONY: all clean superclean test
all: Main.pdf


Main.pdf: $(LaTeXSources)
	lualatex --halt-on-error $(basename $@).tex
	bibtex $(basename $@)
	lualatex --halt-on-error $(basename $@).tex
	lualatex --halt-on-error $(basename $@).tex

TestCases=phd,a4paper,oneside.pdf phd,a4paper,twoside.pdf mres,a4paper,oneside.pdf mres,a4paper,twoside.pdf mphil,a4paper,oneside.pdf mphil,a4paper,twoside.pdf

test: $(TestCases)

$(TestCases): $(LaTeXSources)
	export OPTIONS=$(subst .pdf,,$@); sed -e s/phd,a4paper,oneside/$$OPTIONS/ Main.tex >$(basename $@).tex
	lualatex --halt-on-error $(basename $@).tex
	bibtex $(basename $@)
	lualatex --halt-on-error $(basename $@).tex
	lualatex --halt-on-error $(basename $@).tex


clean: 
	-@rm -v *.aux *.lof *.log *.lot *.fls *.out *.toc *.dvi *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml *.fdb_latexmk *.synctex.gz *.pdfsync *.alg *.loa *.thm *.nav *.snm *.vrb *.acn *.acr *.glg *.glo *.gls *.brf *.lol *.idx *.ilg *.ind *.ist *.maf *.mtc *.mtc0 *.pyg *.nlo *.sagetex.sage *.sagetex.py *.sagetex.scmd *.sout *.sympy *.tdo *.xdy 

superclean: clean
	-@rm *.pdf

testclean: clean superclean
	-@rm $(TestCases) $(TestCases:.pdf=.tex)

