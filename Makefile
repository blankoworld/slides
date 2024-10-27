#!/usr/bin/env make -f
#
# Makefile
#

# DEBUG mode: `Q= make`
Q ?= @

all: deps

deps:
	$Qgit submodule update --init --recursive


