TEXS=$(wildcard *.tex)
PDFS=$(TEXS:.tex=.pdf)

all: $(PDFS)

%.pdf: %.tex
	latexmk -pdf $<

clean:
	rm -rf .DS_Store *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml *.out *.gz *.dvi
	rm -rf $(PDFS)