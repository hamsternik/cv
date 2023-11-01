.SHELLFLAGS = -e -o pipefail -c

VERSION := 1.2.1

LATEXMK := latexmk # man (https://mirrors.up.pt/pub/CTAN/support/latexmk/latexmk.pdf)
LATEXMK_FLAGS := -quiet -output-directory="build" -f
LATEXMK_FLAGS_BUILD := -recorder -use-make -pdf # -pdf argument use `pdflatex` by default, so do not need to use -pdflatex arg. explicitly
LATEXMK_FLAGS_CLEAN := -C # to clean all without pdf output use `-c` instead

# `wildcard` build-in function replaced by a space-separated list of names of existing files that match one of the given file name patterns
TEXS := $(wildcard *.tex)
PDFS := $(TEXS:.tex=.pdf)

## Project Rules

.PHONY : FORCE_MAKE
# build: $(PDFS) FORCE_MAKE
build: FORCE_MAKE
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_FLAGS_BUILD) hamsternik.compact.tex

%.pdf: %.tex hamsternik.cv.cls
	@echo Compiling $* file right now...
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_FLAGS_BUILD)

update: clean build version

install:
	sudo tlmgr install `head -1 requirements.txt`

clean:
	$(LATEXMK) $(LATEXMK_FLAGS) $(LATEXMK_FLAGS_CLEAN)

## Package Rules

lacheck:
	@lacheck *.tex

version:
	@echo "resume version $(VERSION)"

help:
	@cat Makefile
