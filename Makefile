LATEX = pdflatex -interaction=nonstopmode -halt-on-error
BIBTEX = bibtex

MAIN_TEX = main

SECTIONS = sections/intro sections/register_info sections/simple_moves \
           sections/arithmetic_logic sections/control sections/switch_jump sections/nested_arrays \
           sections/heterogeneous_structs sections/acknowledgment

OUTPUT = $(MAIN_TEX).pdf

all: $(OUTPUT)

$(OUTPUT): $(MAIN_TEX).tex $(SECTIONS:=.tex) references.bib
	$(LATEX) $(MAIN_TEX) || true
	$(BIBTEX) $(MAIN_TEX) || true
	$(LATEX) $(MAIN_TEX) || true
	$(LATEX) $(MAIN_TEX) || true

clean:
	rm -f *.aux *.log *.bbl *.blg *.out *.toc *.lof *.lot *.nav *.snm $(OUTPUT)

rebuild: clean all

silent:
	$(LATEX) $(MAIN_TEX) > /dev/null 2>&1 || true
	$(BIBTEX) $(MAIN_TEX) > /dev/null 2>&1 || true
	$(LATEX) $(MAIN_TEX) > /dev/null 2>&1 || true
	$(LATEX) $(MAIN_TEX) > /dev/null 2>&1 || true
