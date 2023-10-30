\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hamsternik.cv}[2022/04/14 0.1.0 Resume Template Class]
\LoadClass[12pt]{article}

% Driver-independent color extensions for LATEX and pdfLATEX
\RequirePackage{xcolor}
  \definecolor{dark-green1}{RGB}{32,75,65}

% user-friendly syntax layer for `pgf`, PDF graphics in TEX
\RequirePackage{tikz}

% Place boxes at arbitrary positions on the LATEX page
\RequirePackage[absolute]{textpos}
  \TPGrid{16}{16}

% Flexible and complete interface to document dimensions
% Purpose: to set margins for page(s) of the PDF, in cm
\RequirePackage[
  top=1.5\TPVertModule, 
  bottom=2\TPVertModule, 
  left=3\TPHorizModule, 
  right=2\TPHorizModule
]{geometry}

% Extensive control of page headers and footers in LATEX2ε
% Purpose: to draw a verical left-side line filled with the custom `nk-blue' color
% Dependency: `geometry` and `textpos` customisations
\RequirePackage{fancyhdr}
  \pagestyle{fancy}
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \fancyfoot[C]{{
    \ifnum\value{page}=1\else
      \color{gray} page \thepage{} of \pageref{LastPage}
    \fi
  }}
  \fancyfoot[C]{
    \begin{textblock}{2}(0,0){
      \tikz[x=\TPHorizModule,y=\TPVertModule] \filldraw[fill=dark-green1, draw=none] (0,0) rectangle (2,16);
    }\end{textblock}
  }

% Package for underlining
% Purpose: to underline links covered by \href
\RequirePackage[normalem]{ulem}

% Extensive support for hypertext in LATEX
% Purpose: to remove colored boxes around \href and add underline
\RequirePackage[hidelinks]{hyperref}
  \makeatletter\begingroup
    \catcode`\$=6 %
    \catcode`\#=12 %
    \gdef\href@split$1#$2#$3\\$4{%
      \hyper@@link{$1}{$2}{\uline{$4}}%
      \endgroup
    }%
  \endgroup\makeatother

% Save code and execute it when \begin{document} is executed, at the very end of the preamble
% Purpose: settle font size, remove paragraph's indentation (no need to use \noindent in the beginning of each *subsection)
\AtBeginDocument{%
  \setlength{\topskip}{0mm}
  \setlength{\parindent}{0pt}
  \setlength{\parskip}{5pt}
  \tolerance=2000
  \raggedbottom
  \large
}

\endinput