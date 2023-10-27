VERSION := 1.2.1

.SHELLFLAGS = -e -o pipefail -c

LATEX := pdflatex
LATEX_FLAGS := --shell-escape --file-line-error

LATEXMK := latexmk
LATEXMK_FLAGS := -quiet -output-directory="build"
LATEXMK_FLAGS_BUILD := -recorder -use-make -pdf
LATEXMK_FLAGS_CLEAN := -C # to clean all without pdf output use `-c` instead

# `wildcard` build-in function replaced by a space-separated list of names of existing files that match one of the given file name patterns
TEXS := $(wildcard *.tex)
PDFS := $(TEXS:.tex=.pdf)

help:
	@cat Makefile

version:
	@echo "resume version $(VERSION)"

install:
	sudo tlmgr install latexmk xcolor pgf textpos fancyhdr ulem hyperref geometry setspace hyperref

build: $(PDFS)

%.pdf: %.tex nk-resume.cls
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_FLAGS_BUILD) -pdflatex="$(LATEX) $(LATEX_FLAGS)"

clean:
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_FLAGS_CLEAN)

update: clean build version
