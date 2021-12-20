# Some commands to work with page generation.
# Building the page requires https://github.com/hut/inlineswap

.PHONY: build

ref ?= HEAD

build:
	inlineswap index.html contact.html
	@echo file://$(shell pwd)/index.html
