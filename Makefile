# Makefile for Sphinx documentation build
# You can set these variables from the command line, and also from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SPHINXPREVIEW ?= sphinx-autobuild
SOURCEDIR     = docs
BUILDDIR      = _build

preview:
	@$(SPHINXPREVIEW) -b html --pre-build "$(SPHINXBUILD) -b spelling -W --keep-going "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)" "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

build:
	@$(SPHINXBUILD) -b spelling -W --keep-going "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
	@$(SPHINXBUILD) -b html -W --keep-going "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@rm -rf "$(BUILDDIR)"

.PHONY: preview build clean
