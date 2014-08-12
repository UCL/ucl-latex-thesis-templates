%%
%%  A LaTeX2e class defining a UCL MRes, MPhil or PhD thesis.
%%
%%  This class was originally created (and is copyright) in 1996 by Russel Winder.
%%  It is maintained and distributed with permission, by Ian Kirker in
%%   the Research Computing team at ISD.
%%  (rc-support@ucl.ac.uk, or i.kirker@ucl.ac.uk)
%%
%%  This version differs from the commonly available version of ucl_thesis.cls, in
%%   being rebased on Russel's un-docstripped version from KCL, and thus includes,
%%   among other changes, significantly more documentation.
%%
%%  The definitive formatting reference is here:
%%   http://www.ucl.ac.uk/current-students/research_degrees/thesis_formatting 
%%
%%  Several quotes from that page are included at relevant points.
%%
%%  Many stylistic choices that used to be mandatory are now not specified, so
%%   there are many choices made here that no longer have to be set this way.
%%  Regardless, they are (in every case I've noticed) sound stylistic choices.
%%  It's a good idea to check the page above before changing something.
%%   
%%
\def \fileversion{v1.6}
\def \filedate{2014/08/12}
\def \docdate{\filedate}
%
%  \changes{v1.3}{1996/10/18}{}
%
%  \changes{v1.4}{1998/04/02}{Discovered that there were changes needed to openbib processing
%    consequent on the upgrade to \LaTeXe\ (1997/12/01).}
%  
%  \MakeShortVerb{\|}
%
%  \title{A \LaTeXe\ Class to Typeset UCL MRes, MPhil and PhD Theses}
%  \author{Russel Winder (modifications by Ian Kirker)}
%  \maketitle
%  \begin{abstract}
%    This class is for theses (MRes, MPhil or PhD) to submit to UCL.
%    It is a variant of the standard book class.
%  \end{abstract}
%
%  \section{Introduction}
%
%  \setcounter{page}{1}
%
%  This class is an extension of the book class.  The twoside option is on by default, oneside
%  can be set by the user if necessary.  The title page is a special page with the information
%  specified in the instructions set out by the University of London.
%
%  A basic document is structured like:
%
%  \begin{verbatim}
%  \documentclass{kcl_thesis}
%  \title{<The Thesis Title>}
%  \author{<The Author>}
%  \date{<The Year>}
%  \begin{document}
%  \bibliographystyle{...}
%  \maketitle
%  \begin{abstract}
%  <Words comprising the abstract.>
%  \end{abstract}
%  \begin{acknowledgements}
%  <Words comprising the acknowledgements.>
%  \end{acknowledgements}
%  \tableofcontents
%  \listoffigures
%  \listoftables
%  <... The thesis, most likely as separate files \input d ...>
%  \bibliography{...}
%  \end{document}
%  \end{verbatim}
%
%  As this is a book, use can be made of |\frontmatter|, |\mainmatter| and |\backmatter| if that
%  is desired but this would be a variation of the standard since |\frontmatter| causes roman
%  page numbering and the standard states that numbering is arabic throughout starting with the
%  title page as page 1.
%
%  The standard conforms to all College and University regulations on
%  margins, spacing etc., which are:
%  \begin{itemize}
%  \item
%  Margin at binding edge = 1.5'', 38mm, 108pt.
%  \item
%  Margin at all other edges = 1'', 25mm, 72pt.
%  \item
%  Inter-line spacing = 1.5.
%  \item
%  Pages must be numbered in one continuous sequence from title page
%  to the last page of type in arabic numerals.
%  \end{itemize}
%
%  Other components of the style are:
%
%  Contents.  No deeper than subsections.
%
%  Equations, figures, tables and other numbered objects.  These are numbered by chapter and
%  item number within chapter.  For example, the first equation in chapter 1 will be equation
%  1.1.
%
%  Section headings.  There is no italic type in chapter, section, subsection and subsubsection
%  headings.  Bold font at different font sizes is used.  Subsubsections are not numbered.
%
%  Paragraph style.  The default should be indented paragraphs with a supported option for
%  blocked paragraphs.
%
%  Fonts.  Times Roman is a font that has been consistently used over a long period of time, and
%  for that reason is preferable to a more modern font.  An 11pt font is prefered and is the
%  default but both 10pt and 12pt options are supported.
%
%  References.  References should be all at the end of the thesis and in alphabetical order.
%  There is no default on the style of references, this is left to the author.
%
%  It is expected that acknowledgements appear between the abstract and the table of contents.
%
%  \section{Implementation}
%
%  \subsection{Preamble}
%
%  The only difference between an MPhil and a PhD thesis is on the front cover, being the string
%  in the submission statement.  Make PhD the default.
%    \begin{macrocode}
\newcommand \@doctor{Doctor of Philosophy}
\newcommand \@master{Master of Philosophy}
\newcommand \@mres{Master of Research}
\newcommand \@degree@string{\@doctor}
%    \end{macrocode}
%  The usual structure of class preamble follows.
%
%  Assume A4 paper.  Ensure single column.  Assume double-sided as default.  Ensure A4 margins
%  and Times typeface (sans serif is Helvetica).  Assume 10pt as default.
%
%  Make the possibility of special activity in draft mode.  To do this create a boolean as a
%  flag and ensure that the appropriate options are passed onto the superclass.
%    \begin{macrocode}
\NeedsTeXFormat{LaTeX2e}[1997/12/01]
\ProvidesClass{ucl_thesis}[\filedate\space\fileversion\space UCL MRes/MPhil/PhD Thesis class]
\DeclareOption{mres}{\renewcommand\@degree@string{\@mres}}
\DeclareOption{MRes}{\renewcommand\@degree@string{\@mres}}
\DeclareOption{mphil}{\renewcommand\@degree@string{\@master}}
\DeclareOption{MPhil}{\renewcommand\@degree@string{\@master}}
\DeclareOption{phd}{\renewcommand\@degree@string{\@doctor}}
\DeclareOption{PhD}{\renewcommand\@degree@string{\@doctor}}
\DeclareOption{twocolumn}{\ClassError{ucl_thesis}{Option `twocolumn' not supported for UCL theses}{}}
\newif \if@draftmode
\@draftmodefalse
\DeclareOption{draft}{\@draftmodetrue\PassOptionsToClass{draft}{book}}
\DeclareOption{final}{\@draftmodefalse\PassOptionsToClass{final}{book}}
\PassOptionsToClass{a4paper}{book}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions
\LoadClass{book}
\RequirePackage{ucl_a4}
\RequirePackage{times}
\RequirePackage{mathptmx}
%    \end{macrocode}
%
%  \subsection{Page Layout}
%
%  Define the standard layout of a thesis page.
%
%  First define the page area and it's location on the page. These used to be very exactly controlled
%   in thesis submissions, but standards are a bit more lax these days. 
%
%    "A4 size paper (210 x 297 mm) should be used. Plain white paper must be used, 
%      of good quality and of sufficient opacity for normal reading. 
%    "Both sides of the paper may be used. 
%    "Margins at the binding edge must be not less than 40 mm (1.5 inches) and other margins 
%      not less than 20 mm (.75 inches)." 
%
%    \begin{macrocode}
\setlength \textwidth {415\p@}
\setlength \textheight {692\p@}
\setlength \topmargin {36\p@}
\setlength \oddsidemargin {96\p@}
\if@twoside
    \setlength \evensidemargin {60\p@}
\else
    \setlength \evensidemargin {96\p@}
\fi
%    \end{macrocode}
%  \begin{macro}{\ps@headings}
%  Define a new style so that all the standard styles are available.
%    \begin{macrocode}
\def \ps@headings{%
    \def \@oddhead{\normalfont \rmfamily \slshape \hfill \rightmark \hfill \thepage}%
    \def \@evenhead{\normalfont \rmfamily \slshape \thepage \hfill \leftmark \hfill}%
    \let \@oddfoot = \@empty%
    \let \@evenfoot = \@empty%
    \let \@mkboth = \markboth%
    \def \chaptermark##1{%
        \markboth{%
            \ifnum \c@secnumdepth >\m@ne%
                \if@mainmatter%
                    \@chapapp\ \thechapter. \ %
                \fi%
            \fi%
            ##1%
        }{}%
    }%
    \def \sectionmark##1{%
        \markright {%
            \ifnum \c@secnumdepth >\z@%
                \thesection. \ %
            \fi%
            ##1%
        }%
    }%
}
\pagestyle{headings}
%    \end{macrocode}
%  \end{macro}
%  \begin{macro}{\footnoterule}
%  Make the footnote rule go all the way across the page.
%    \begin{macrocode}
\renewcommand \footnoterule {%
    \kern -3\p@%
    \hrule%
    \kern 2.6\p@%
}
%    \end{macrocode}
%  \end{macro}
%  Standard style has no inter-paragraph gap but a paragraph indentation.  Also need to alter
%  the space between the text area and the running head and foot.  Also, stop too much space
%  appearing before and after lists.
%    \begin{macrocode}
\setlength \parindent{2em}
\setlength \parskip  {\z@ \@plus 1\p@}
\setlength \headsep  {16\p@}
\ifcase \@ptsize
    \setlength \footskip{26\p@}
\or
    \setlength \footskip{27\p@}
\or
    \setlength \footskip{28\p@}
\fi
\setlength \partopsep {\z@}
%    \end{macrocode}
%  Do feathering but don't be too worried about exactness.
%    \begin{macrocode}
\tolerance = \@m
\emergencystretch = 10\p@
\vfuzz = 2\p@
\hfuzz = 2\p@
\flushbottom
%    \end{macrocode}
%  "Double or one-and-a-half spacing should be used in typescripts, except for indented 
%   quotations or footnotes where single spacing may be used."
%
%  One and a half is a sensible choice for theses, especially with a wide margin.
%    \begin{macrocode}
\renewcommand \baselinestretch{1.5}
%    \end{macrocode}
%
%  \subsection{Running Heads}
%
%  Note that LaTeX2e is still dicatatorial about using |\uppercase| in various chapter starts.
%  This means making copies of the macros simply to remove the |\uppercase| usage.
%    \begin{macrocode}
\renewcommand \tableofcontents{%
    \if@twocolumn%
        \@restonecoltrue \onecolumn%
    \else%
        \@restonecolfalse%
    \fi%
    \chapter*{%
        \contentsname%
        \@mkboth{\contentsname}{\contentsname}%
    }%
    \@starttoc{toc}%
    \if@restonecol%
        \twocolumn%
    \fi%
}
\renewcommand \listoffigures{%
    \if@twocolumn%
        \@restonecoltrue \onecolumn%
    \else%
        \@restonecolfalse%
    \fi%
    \chapter*{%
        \listfigurename%
        \@mkboth{\listfigurename}{\listfigurename}%
    }%
    \@starttoc{lof}%
    \if@restonecol%
        \twocolumn%
    \fi%
}
\renewcommand \listoftables{%
    \if@twocolumn%
        \@restonecoltrue \onecolumn%
    \else%
        \@restonecolfalse%
    \fi%
    \chapter*{%
        \listtablename%
        \@mkboth{\listtablename}{\listtablename}%
    }%
    \@starttoc{lot}%
    \if@restonecol%
        \twocolumn%
    \fi%
}
\renewenvironment{thebibliography}[1]{%
    \chapter*{%
        \bibname%
        \@mkboth{\bibname}{\bibname}%
    }%
%%%
%%%  Julia Schnabel wanted the following line added since the
%%%  \chapter* call does not put the bibliography into the table of
%%%  contents.
%%%
%%%    \addcontentsline{toc}{chapter}{\bibname}%
%%%
    \list{\@biblabel{\arabic{enumiv}}}%
         {\settowidth \labelwidth{\@biblabel{#1}}%
          \leftmargin \labelwidth%
          \advance \leftmargin \labelsep%
          \@openbib@code%
          \usecounter{enumiv}%
          \let \p@enumiv = \@empty%
          \renewcommand \theenumiv{\arabic{enumiv}}%
    }%
    \sloppy%
    \clubpenalty 4000%
    \@clubpenalty \clubpenalty%
    \widowpenalty 4000%
    \sfcode`\.=\@m%
}{%
    \def \@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
    \endlist%
}
\renewenvironment{theindex}{%
    \if@twocolumn%
        \@restonecolfalse%
    \else%
        \@restonecoltrue%
    \fi%
    \columnseprule \z@%
    \columnsep 35\p@%
    \twocolumn[\@makeschapterhead{\indexname}]%
    \@mkboth{\indexname}{\indexname}%
%%%
%%% Julia Schnabel had an earlier version of the theindex environment and this used:
%%%
%%%     \twocolumn%
%%%     \chapter*{\indexname}{%
%%%         \@mkboth{\indexname}{\indexname}%
%%%     }%
%%%     \addcontentsline{toc}{chapter}{\indexname}%
%%%
%%%     the last line being an addition overwhat was there so as to ensure that the index
%%%     appeared in the contents.
%%%
    \thispagestyle{plain}%
    \small%
    \parindent \z@%
    \parskip \z@ \@plus .3\p@%
    \relax%
%%%
%%% It appears that there is an error in the definition of \@idxitem which causes horrid
%%% looking indexes.  Redefine the miscreant so as to insert the missing \par.  NB.  Cannot
%%% use |\renewcommand| since this does not to work on outer block, even if |\global| is
%%% used.
%%%
%%%  As noticed on 1998.03.15, this appears to have been fixed.
%%%
%%%    \gdef \@idxitem{\par \hangindent 40\p@}
%%%
    \let \item = \@idxitem%
}{%
    \if@restonecol%
        \onecolumn%
    \else%
        \clearpage%
    \fi%
}
%    \end{macrocode}
%
%  \subsection{The Title Page}
%
%  \begin{macro}{\maketitle}
%    Making a title page is non-trivial, especially for a display title page; things are
%    carefully synchronised here so don't change randomly.
%
%    (said Russel, before Ian changed something randomly)
%    We want the author variable for the "I have not plagiarised everything" declaration.
%    We also need a new department variable.
%    \begin{macrocode}
\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\renewcommand \maketitle{%
    \setcounter{page}{1}%
    \thispagestyle{empty}%
    \@maketitle%
    \setcounter{footnote}{0}%
    \let \thanks = \relax%
    \gdef \@address{}%
    \gdef \@thanks{}%
    %\gdef \@author{}%
    \gdef \@department{}%
    \gdef \@title{}%
    \let \maketitle = \relax%
}
%    \end{macrocode}
%  \end{macro}
%  \begin{macro}{\@maketitle}
%  Create a separate title page with the usual material on it.
%    \begin{macrocode}
\newcommand \@maketitle{%
    \newpage%
    \null%
    \vspace*{5em}%
%%%
%%%  Julia Schnabel wanted the following added.
%%%
%%%    \renewcommand{\baselinestretch}{2.5}
%%%    \small
%%%    \normalsize
%%%
    \begin{center}%
        {\huge \bfseries \@title}\\[5em]%
        {\Large \itshape \@author}\\%
    \end{center}%
    \vfill%
    \begin{center}%
    A dissertation submitted in partial fulfillment \\
    of the requirements for the degree of \\
    \textbf{\@degree@string} \\
    of \\
    \textbf{University College London}.
    \end{center}%
    \vspace{2em}%
    \begin{center}%
    \@department \\
    University College London\\
    \end{center}%
    \vspace{2em}%
    \begin{center}%
    \@date%
    \end{center}%
    \if@twoside %
      \newpage%
      ~\\
      \newpage%
    \fi
}
%    \end{macrocode}
%  \end{macro}
%
%  \begin{macro}{\makedeclaration}
%    \begin{macrocode}
       \newcommand \makedeclaration {%
         \clearpage%
         I, \@author , confirm that the work presented in this thesis is my own.
         Where information has been derived from other sources, I confirm that this has been indicated in the work.
         \gdef \@author{}%
         \clearpage%
       }%
%    \end{macrocode}
%  \end{macro}
%
%  \subsection{Headings}
%
%  Redefine the chapter and section commands in order to change the font of the section heads.
%  Only include in contents and number down to subsections.
%    \begin{macrocode}
\renewcommand \chapter{%
    \if@openright%
        \cleardoublepage%
    \else%
        \clearpage%
    \fi
    \thispagestyle{empty}%
    \global \@topnum \z@%
    \@afterindentfalse%
    \secdef \@chapter \@schapter%
}
\def \@makechapterhead#1{%
    \vspace*{40\p@}%
    {\parindent \z@%
     \raggedright%
     \reset@font%
     \ifnum \c@secnumdepth >\m@ne%
         \if@mainmatter%
             \Large \bfseries \@chapapp{} \thechapter%
             \par%
             \vskip 20\p@%
         \fi%
     \fi%
     \huge \bfseries #1%
     \par%
     \nobreak%
     \vskip 40\p@%
    }%
}
\def \@makeschapterhead#1{%
    \vspace*{50\p@}%
    {\parindent \z@%
     \raggedright%
     \reset@font%
     \huge \bfseries #1%
     \par%
     \nobreak%
     \vskip 40\p@%
    }%
}
\renewcommand \section{\@startsection {section}{1}{\z@}%
                                      {-1ex \@plus -.4ex \@minus -.2ex}%
                                      {.6ex \@plus .1ex}%
                                      {\reset@font \Large \bfseries}}
\renewcommand \subsection{\@startsection{subsection}{2}{\z@}%
                                        {-.7ex\@plus -.3ex \@minus -.2ex}%
                                        {.4ex \@plus .1ex}%
                                        {\reset@font \large \bfseries}}
\renewcommand \subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                        {-.5ex\@plus -.2ex \@minus -.2ex}%
                                        {.3ex \@plus .1ex}%
                                        {\reset@font \large}}
\renewcommand \paragraph{\@startsection{paragraph}{4}{\z@}%
                                       {.5ex \@plus .1ex \@minus .2ex}%
                                       {-.2em}%
                                       {\reset@font \normalsize \bfseries}}
\renewcommand \subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                          {-.3ex \@plus .1ex \@minus .2ex}%
                                          {-.2em}%
                                          {\reset@font \normalsize \bfseries}}
\setcounter{secnumdepth}{2}
%    \end{macrocode}
%
%  \subsection{Obscure Environments}
%
%  \begin{environment}{abstract}
%  Need to have an abstract environment.
%    \begin{macrocode}
\newcommand \@abstract{Abstract}
\newenvironment{abstract}{%
    \chapter*{\@abstract}%
    \@mkboth{\@abstract}{\@abstract}%
}{%
}
%    \end{macrocode}
%  \end{environment}
%  \begin{environment}{acknowledgement}
%  Also need an environment for doing the acknowlegements.
%    \begin{macrocode}
\newcommand \@acknowledgements{Acknowledgements}
\newenvironment{acknowledgements}{%
    \chapter*{\@acknowledgements}%
    \@mkboth{\@acknowledgements}{\@acknowledgements}%
}{%
}
%    \end{macrocode}
%  \end{environment}
%  \Finale
\endinput
%%
%% End of file
