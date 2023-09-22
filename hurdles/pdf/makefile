# make build

# Filenames
INPUT=../index.md
OUTPUT=hurdles.pdf

# Config options
PDF_ENGINE=--pdf-engine=xelatex
URL_PROPERTIES=-V colorlinks=true -V linkcolor=blue -V urlcolor=blue 
VERBOSE=--verbose

build:
	pandoc $(INPUT) --output $(OUTPUT) $(PDF_ENGINE) $(URL_PROPERTIES) $(VERBOSE)

simul:
	Rscript tournament-simulation.R
