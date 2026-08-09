MAIN := latex/main.tex
BUILD_DIR := build
RELEASE_PDF := releases/computational-cognitive-science-booklet-fa.pdf

.PHONY: all pdf release clean

all: release

pdf:
	mkdir -p $(BUILD_DIR)/chapters
	latexmk -cd -xelatex -interaction=nonstopmode -halt-on-error \
		-outdir=../$(BUILD_DIR) $(MAIN)

release: pdf
	cp $(BUILD_DIR)/main.pdf $(RELEASE_PDF)

clean:
	latexmk -cd -C -outdir=../$(BUILD_DIR) $(MAIN)
