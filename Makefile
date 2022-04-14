LATEX := pdflatex
LATEXFLAGS := --shell-escape --file-line-error
LATEXMK := latexmk
LATEXMKFLAGS := -quiet -recorder -use-make -pdf

# `wildcard` build-in function replaced by a space-separated list of names of existing files that match one of the given file name patterns
TEXS := $(wildcard *.tex) 
PDFS := $(TEXS:.tex=.pdf)

all: $(PDFS)

%.pdf: %.tex nk-resume.cls
	$(LATEXMK) $(LATEXMKFLAGS) -pdflatex="$(LATEX) $(LATEXFLAGS)"

clean:
	$(LATEXMK) -quiet -c

cleanall: clean; rm resume.pdf

update: clean all