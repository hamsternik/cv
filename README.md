# @hamsternik resume

Resume is built with LaTeX, software system for document preparation, to have an eye candy .pdf document as output.

![](img/1.2.0.png)

## Deploy

First, install all third-party packages used in the project.

```bash
make install
```

When `make` completes to install packages, run the command to build up resume in `.pdf` format.

```bash
make all
```

### Packages

- latexmk
- xcolor
- pgf
- textpos
- fancyhdr
- ulem
- hyperref
- geometry
- setspace
- hyperref

> pgf – Create PostScript and PDF graphics in TEX. It comes with a user-friendly syntax layer called TikZ.

## References

- [Using Latexmk. How to build up simple .tex document](https://mg.readthedocs.io/latexmk.html)
- [LaTeX help 1.1. Documentation](http://www.emerson.emory.edu/services/latex/latex_toc.html)
- [Yegor Bugaenko resume](https://github.com/yegor256/blog/blob/master/_latex/resume-boring.tex)
- [Firing up LaTex on macOS 🔥](https://gist.github.com/LucaCappelletti94/920186303d71c85e66e76ff989ea6b62)
