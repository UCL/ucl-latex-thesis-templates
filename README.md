# UCL LaTeX Thesis Templates

[![Build Status](https://travis-ci.org/UCL/ucl-latex-thesis-templates.svg?branch=master)](https://travis-ci.org/UCL/ucl-latex-thesis-templates)

This is a skeletal thesis template with a class and .sty file that you can use separately if you'd prefer.

To change the thesis type from PhD to MRes or MPhil, look for the setting in `Main.tex`.

The class needs some updating and could use a lot of commenting, and these are being worked on, but the files are perfectly usable right now with pdfLaTeX or lualatex. The repo is tested after each push with lualatex on Travis.

If you have suggestions for improvements, please do submit an issue, drop me a line ([i.kirker+GH@ucl.ac.uk](mailto:i.kirker+GH@ucl.ac.uk)), or throw me a pull request.

*@ikirker*

## Licensing

This work was previously available to be distributed and/or modified under the conditions of the LaTeX Project Public License (>=1.3), however, I realised that that doesn't make a lot of sense for a template.

Therefore, all files *except* `ucl_thesis.cls` are released into the public domain under CC-0-1.0, as described in the `COPYING` file.

The classfile `ucl_thesis.cls` may be distributed and/or modified under the conditions of the LaTeX Project Public License, either version 1.3 of this license or (at your option) any later version. The latest version of this license is in <http://www.latex-project.org/lppl.txt> and version 1.3 or later is part of all distributions of LaTeX version 2005/12/01 or later.

This work has the LPPL maintenance status `maintained'.

The Current Maintainer of this work is I. Kirker.

This work consists of all files listed in `MANIFEST.md`.


## Known Issues

#### Citation Links
If you see this error while compiling:

```
pdfTeX warning (dest): name{cite.whatever} has been referenced but does not exist, replaced by a fixed one
```

and then get links that don't work in the PDF, try un-commenting the line below in `MainPackages.tex` even if you don't use that style of citation.

```latex
\usepackage{natbib}
```

## FAQ

#### What should I use for editing .tex files?

If you're already comfortable with programming on the command-line, you can use whatever plain text editor you'd like.

If you're new to LaTeX, though, or want something to help you keep your files together, you may want TeXMaker or LyX (both available for Windows, Linux, or OS X), or TeXShop (for OS X).

TeXShop and TeXMaker are both oriented around helping you write plaintext .tex files, while LyX is more aimed at presenting a structured document with some of the formatting rendered, to make it a little less abstract to work with.

If you want something quick that runs entirely through a browser, so you don't even have to set up your own LaTeX installation, UCL also has a subscription for [Overleaf](https://overleaf.com), a service that does that. You'll have to register using your UCL email address to use the subscription. It's also good for working with someone else on a document, with live shared editing.

#### What is the Makefile for?

If you're using this from the Linux command-line, the Makefile defines a few things to make it easier to build the LaTeX document. If not, you can happily ignore it.

#### What graphics formats are good to include with this?

PNG and JPEG images work perfectly well, as do PDF files (including vector graphics). Vector graphics in PDFs will remain as vectors. Remember to produce higher-resolution images than you'd use online -- 300 or 600 dpi are typical print qualities, rather than the 72 dpi standard for websites. If you don't have control over this setting directly from whatever you're using to produce your images, a good rule of thumb is that you should aim to generate them 3 and a bit times larger on screen than you want them to be on paper.

#### Can I just make it produce one section in the PDF?

In the `Main.tex` file there are a list of `\include` statements. If you add an `\includeonly` statement to match those with one or more of the same labels, it'll just produce the content for those sections. (Labels, references, figures, and table numbers will be consistent as if you'd generated the whole document.)

#### Didn't there used to be different files for PhD, MRes, and MPhil dissertations?

Yes, but they only differed by 4 characters each, so it seemed silly to maintain them each separately. Change the setting in the `Main.tex` file to get the one you need.
