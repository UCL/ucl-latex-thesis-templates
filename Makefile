all: *.tex *.bib
	lualatex --halt-on-error Main.tex
	bibtex Main
	lualatex --halt-on-error Main.tex
	lualatex --halt-on-error Main.tex

clean: 
	-@rm -v *.aux *.lof *.log *.lot *.fls *.out *.toc *.dvi *.bbl *.bcf *.blg *-blx.aux *-blx.bib *.run.xml *.fdb_latexmk *.synctex.gz *.pdfsync *.alg *.loa *.thm *.nav *.snm *.vrb *.acn *.acr *.glg *.glo *.gls *.brf *.lol *.idx *.ilg *.ind *.ist *.maf *.mtc *.mtc0 *.pyg *.nlo *.sagetex.sage *.sagetex.py *.sagetex.scmd *.sout *.sympy *.tdo *.xdy 

