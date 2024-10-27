#!/usr/bin/env make -f
#
# Makefile
#
# This file is part of https://github.com/blankoworld/slides.git (`slides`).
#
# `slides` is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
#
# `slides` is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with Foobar. If not, see <https://www.gnu.org/licenses/>.

# DEBUG mode: `Q= make`
Q ?= @

# VARIABLES
NAME ?= result
SOURCE ?= slides.md
HIGHLIGHT ?= breezedark
# Available highlight (for code) by Pandoc
# `pandoc --list-highlight-styles`
# tango
# pygments
# kate
# monochrome
# espresso
# zenburn
# haddock
# breezedark
THEME ?= blood
# Available themes
# `ls reveal.js/css/theme/source -1|cut -d '.' -f 1`
#
# beige
# black-contrast
# black
# blood
# dracula
# league
# moon
# night
# serif
# simple
# sky
# solarized
# white-contrast
# white
#
# You can see them here: https://revealjs.com/themes/
# But can be empowered by: https://slides.com/explore (revealJS online editor)

# BEGIN
all: reveal.js

reveal.js:
	$Qgit submodule update --init --recursive

html: reveal.js ${SOURCE}
	$Qpandoc -t revealjs -s --embed-resources --standalone -o "${NAME}.html" "${SOURCE}" -V revealjs-url=./reveal.js -V theme="${THEME}" -V transition=slide -V slideNumber=true --slide-level=2 --highlight-style="${HIGHLIGHT}"

pdf: reveal.js ${SOURCE}
	$Qpandoc -V theme:Boadilla -V fontfamily="utopia" -V fontsize=11pt -V toc-title:'Table of content' --from=markdown --to=beamer -o "${NAME}.pdf" "${SOURCE}"

build: html pdf

# END
clean:
	$Qrm -f "${NAME}.html" "${NAME}.pdf"
