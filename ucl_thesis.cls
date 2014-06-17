%%
%% This is file `ucl_thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ucl_thesis.dcl 
%%
%% The original file was lost a while ago. A new version is being 
%%  created, but in the meanwhile, you are free to use and edit this file.
%% 
%%  A LaTeX2e class defining a UCL MRes, MPhil or PhD thesis.
%%
%%  This class was originally created (and is copyright) in 1996 by Russel Winder.
%%  It is maintained and distributed with permission, by Ian Kirker in
%%   the Research Computing team at ISD.
%%  (i.kirker@ucl.ac.uk)
%%
\def \fileversion{v1.5}
\def \filedate{2014/06/17}
\def \docdate{\filedate}
\newcommand \@doctor{Doctor of Philosophy}
\newcommand \@master{Master of Philosophy}
\newcommand \@mres{Master of Research}
\newcommand \@degree@string{\@doctor}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ucl_thesis}[\filedate\space\fileversion\space UCL MRes/MPhil/PhD Thesis class]
\DeclareOption{mres}{\renewcommand\@degree@string{\@mres}}
\DeclareOption{MRes}{\renewcommand\@degree@string{\@mres}}
\DeclareOption{mphil}{\renewcommand\@degree@string{\@master}}
\DeclareOption{MPhil}{\renewcommand\@degree@string{\@master}}
\DeclareOption{phd}{\renewcommand\@degree@string{\@doctor}}
\DeclareOption{PhD}{\renewcommand\@degree@string{\@doctor}}
\DeclareOption{twocolumn}{%
    \ClassError{ucl_document}{Option `twocolumn' not supported for UCL theses.}{}}
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
\setlength \textwidth {415\p@}
\setlength \textheight {692\p@}
\setlength \topmargin {36\p@}
\setlength \oddsidemargin {96\p@}
\if@twoside
    \setlength \evensidemargin {60\p@}
\else
    \setlength \evensidemargin {96\p@}
\fi
\def \ps@headings{%
    \def \@oddhead{\normalfont \rmfamily \slshape \hfill \rightmark \hfill \thepage}%
    \def \@evenhead{\normalfont \rmfamily \slshape \thepage \hfill \leftmark \hfill}%
    \let \@oddfoot \@empty%
    \let \@evenfoot \@empty%
    \let \@mkboth \markboth%
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
\renewcommand \footnoterule {%
    \kern -3\p@%
    \hrule%
    \kern 2.6\p@%
}
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
\tolerance = \@m
\emergencystretch = 10\p@
\vfuzz = 2\p@
\hfuzz = 2\p@
\flushbottom
\renewcommand \baselinestretch{1.5}
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
    \list{\@biblabel{\arabic{enumiv}}}%
         {\settowidth \labelwidth{\@biblabel{#1}}%
          \leftmargin \labelwidth%
          \advance \leftmargin \labelsep%
          \@openbib@code%
          \usecounter{enumiv}%
          \let \p@enumiv \@empty%
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
    \thispagestyle{plain}%
    \small%
    \parindent \z@%
    \parskip \z@ \@plus .3\p@%
    \relax%
%%%
%%%  It appears that there is an error in the definition of \@idxitem
%%%  which causes horrid looking indexes.  Redefine the miscreant
%%%  so as to insert the missing \par.  NB.  Cannot use
%%%  |\renewcommand| since this appears not to work on outer block,
%%%  even if |\global| is used.
%%%
%%%  As noticed on 1998.03.15, this appears to have been fixed.
%%%
%%%    \gdef \@idxitem{\par \hangindent 40\p@}
%%%
    \let \item \@idxitem%
}{%
    \if@restonecol%
        \onecolumn%
    \else%
        \clearpage%
    \fi%
}
\def\department#1{\gdef\@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\thesissubject#1{\gdef\@thesissubject{#1}}
\def\@thesissubject{\@latex@warning@no@line{No \noexpand\thesissubject given}}
\def\thesiskeywords#1{\gdef\@thesiskeywords{#1}}
\def\@thesiskeywords{\@latex@warning@no@line{No \noexpand\thesiskeywords given}}
\renewcommand \maketitle{%
    \setcounter{page}{1}%
    \thispagestyle{empty}%
    \@maketitle%
    \setcounter{footnote}{0}%
    \let \thanks = \relax%
    % I don't really get why the class wipes these variables after use, and I want them, so commenting out wiping.
    %\gdef \@address{}%
    %\gdef \@thanks{}%
    %\gdef \@author{}%
    %\gdef \@department{}%
    %\gdef \@title{}%
    \let \maketitle = \relax%
}
\newcommand \@maketitle{%
    \newpage%
    \null%
    \vspace*{5em}%
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
      \@date%
    \end{center}%
    \clearpage%
}
\newcommand \makedeclaration {%
    \newpage
        I, \@author , confirm that the work presented in this thesis is my own. 
        Where information has been derived from other sources, I confirm that this has been indicated in the work.
    \clearpage%
}    


\renewcommand \chapter{%
    \if@openright%
%        \cleardoublepage%
        \clearpage%
    \else%
        \clearpage%
    \fi
    \thispagestyle{empty}%
    \global \@topnum \z@%
    \@afterindentfalse%
    \secdef \@chapter \@schapter%
}
\def \@makechapterhead#1{%
    \vspace*{35\p@}% \vspace*{40\p@}% 
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
    \vspace*{15\p@}%\vspace*{50\p@}%
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
\setcounter{secnumdepth}{3}
\newcommand \@abstract{Abstract}
\newenvironment{abstract}{%
    \chapter*{\@abstract}%
    \@mkboth{\@abstract}{\@abstract}%
}{%
}

\newcommand \@acknowledgements{Acknowledgements}
\newenvironment{acknowledgements}{%
    \chapter*{\@acknowledgements}%
    \@mkboth{\@acknowledgements}{\@acknowledgements}%
}{%
}

\RequirePackage[pdftex,
 hidelinks]{hyperref}
\makeatletter
\AtBeginDocument{
    \hypersetup{
        pdfsubject={\@thesissubject},
        pdfkeywords={\@thesiskeywords},
        pdfauthor={\@author},
        pdftitle={\@title},
    }
}
\makeatother
    

\endinput
%%
%% End of file `ucl_thesis.cls'.
