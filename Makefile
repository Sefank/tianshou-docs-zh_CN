# Makefile for Sphinx documentation build
# You can set these variables from the command line, and also from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SPHINXPREVIEW ?= sphinx-autobuild
SOURCEDIR     = docs
BUILDDIR      = _build

preview:
	@$(SPHINXPREVIEW) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

build:
	@$(SPHINXBUILD) -b html "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

clean:
	@rm -rf "$(BUILDDIR)"

.PHONY: preview build clean
