\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Thesis} [2019/07/26 Thesis document class]

% ------------------------------------------------------------------------------
% Document class and page geometry
% ------------------------------------------------------------------------------
\LoadClass[twoside, a4paper, 12pt]{book}
\RequirePackage{geometry}
\geometry{a4paper,
          verbose,
          marginparwidth = 0.5cm,
          tmargin        = 2.5cm,
          bmargin        = 2.5cm,
          lmargin        = 3cm,
          rmargin        = 2cm,
          headheight     = 1cm,
          headsep        = 0.5cm,
          footskip       = 1cm}


% ------------------------------------------------------------------------------
% Text options
% ------------------------------------------------------------------------------
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xspace}


% ------------------------------------------------------------------------------
% Math packages
% ------------------------------------------------------------------------------
\RequirePackage{amsfonts}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{mathtools}
\RequirePackage{nicefrac}
\RequirePackage{bm}
\RequirePackage{dsfont}


% ------------------------------------------------------------------------------
% Proper spacing \left \right
% ------------------------------------------------------------------------------
\let\originalleft\left
\let\originalright\right
\renewcommand{\left}{\mathopen{}\mathclose\bgroup\originalleft}
\renewcommand{\right}{\aftergroup\egroup\originalright}

% ------------------------------------------------------------------------------
% Figures and tables
% ------------------------------------------------------------------------------
\RequirePackage[figureposition = bottom, tableposition = top]{caption}
\RequirePackage{subcaption}
\RequirePackage{booktabs}
\RequirePackage{threeparttable}
\RequirePackage{colortbl}
\RequirePackage{pifont}


% ------------------------------------------------------------------------------
% Algorithms
% ------------------------------------------------------------------------------
\RequirePackage[chapter]{algorithm}
\RequirePackage{algorithmicx}
\RequirePackage{algpseudocode}


% ------------------------------------------------------------------------------
% Graphics and colors
% ------------------------------------------------------------------------------
\RequirePackage{graphicx,import}
\RequirePackage{graphics}
\RequirePackage{xcolor}

\definecolor{mred}{RGB}{150,0,0}  
\definecolor{mgreen}{RGB}{0,150,0}
\definecolor{mblue}{RGB}{0, 101, 189}
\definecolor{myellow}{RGB}{220, 206, 0}

\newcommand{\doccol}{\color{mblue}}


% ------------------------------------------------------------------------------
% Czech labels (package babel-czech not work with mdframes)
% ------------------------------------------------------------------------------
% \renewcommand{\contentsname}{Obsah}
% \renewcommand{\listfigurename}{Seznam obrázků}
% \renewcommand{\listtablename}{Seznam tabulek}
% \renewcommand{\bibname}{Literatura}
% \renewcommand{\indexname}{Index}
% \renewcommand{\figurename}{Obrázek}
% \renewcommand{\tablename}{Tabulka}
% \renewcommand{\partname}{Část}
% \renewcommand{\chaptername}{Kapitola}
% \renewcommand{\appendixname}{Apendix}
% \renewcommand{\qedsymbol}{{\doccol $\blacksquare$}}
% \renewcommand{\proofname}{\noindent \bfseries{Důkaz:}}


% ------------------------------------------------------------------------------
% Optional arguments
% ------------------------------------------------------------------------------
\newcommand{\thesistype}[1]{\newcommand\@thesistype{#1}}
\newcommand{\branch}[1]{\newcommand\@branch{#1}}
\newcommand{\academicyear}[1]{\newcommand\@academicyear{#1}}
\newcommand{\acknowledgment}[1]{\newcommand\@acknowledgment{#1}}


\newcommand{\supervisor}[1]{\newcommand\@supervisor{#1}}
\newcommand{\supervisorspec}[1]{\newcommand\@supervisorspec{#1}}

\newcommand{\titleCZE}[1]{\newcommand\@titleCZE{#1}}
\newcommand{\abstractCZE}[1]{\newcommand\@abstractCZE{#1}}
\newcommand{\keywordsCZE}[1]{\newcommand\@keywordsCZE{#1}}

\newcommand{\titleENG}[1]{\newcommand\@titleENG{#1}}
\newcommand{\abstractENG}[1]{\newcommand\@abstractENG{#1}}
\newcommand{\keywordsENG}[1]{\newcommand\@keywordsENG{#1}}

% ------------------------------------------------------------------------------
% Hyperrefs
% ------------------------------------------------------------------------------
\RequirePackage[
  unicode = true,
  pdfusetitle,
  bookmarks         = true,
  bookmarksnumbered = false,
  bookmarksopen     = true,
  breaklinks        = false,
  pdfborderstyle    = {},
  backref           = false,
  colorlinks        = true,
]{hyperref}
\hypersetup{
  linkcolor = mblue,
  urlcolor = mred,
  citecolor = mgreen,
}


% ------------------------------------------------------------------------------
% Title page
% ------------------------------------------------------------------------------
\newcommand{\subtitle}[1]{\renewcommand\@subtitle{#1}}
\newcommand\@subtitle{}
\renewcommand\@date{}

\renewcommand*{\maketitle}{
  \pagenumbering{Roman}
  \hypersetup{pageanchor=false}
  \begin{titlepage}
    \raggedleft
    \begin{minipage}[b][\textheight]{0.15\textwidth}
      \includegraphics[width=\textwidth]{images/logocvut.pdf} \par
      \vfill
      \includegraphics[width=\textwidth]{images/logofjfi.pdf} \par
    \end{minipage}
    \hspace{0.05\textwidth}
    \doccol \rule{2pt}{\textheight}
    \hspace{0.05\textwidth}
    \begin{minipage}[b][\textheight]{0.7\textwidth}
      \begin{minipage}[b]{\textwidth}
        \centering \doccol \Large
        \textbf{Czech Technical University in Prague} \par
        \textbf{Faculty of Nuclear Sciences and} \par
        \textbf{Physical Engineering}
      \end{minipage} \par
      \vfill
      \begin{minipage}[b]{\textwidth}
        \centering  \doccol \Huge \textbf{\@title}
      \end{minipage} \par
      \vspace{1cm}
      \begin{minipage}[b]{\textwidth}
        \centering \doccol \Large \textit{\@subtitle}
      \end{minipage} \par
      \vfill
      \begin{minipage}[b]{0.3\textwidth}
        \doccol
        \textbf{Author:} \par
        \textbf{Academic year:}
      \end{minipage}
      \hspace{0.05\textwidth}
      \begin{minipage}[b]{0.65\textwidth}
        \doccol
        \@author \par
        \@academicyear
      \end{minipage}
    \end{minipage}
  \end{titlepage}
  \cleardoublepage
  % Thanks ...
  \thispagestyle{plain}
  \noindent
  \begin{minipage}[t]{\textwidth}\vspace{0pt}%
    \doccol \Large \textbf{Poděkování:}
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{\textwidth}\vspace{0pt}%
    \@acknowledgment
  \end{minipage} \par
  \vfill
  \noindent
  \begin{minipage}[t]{\textwidth}\vspace{0pt}%
    \doccol \Large \textbf{Čestné prohlášení:}
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{\textwidth}\vspace{0pt}%
    Prohlašuji na tomto místě, že jsem předloženou práci vypracoval samostatně, a že jsem uvedl veškerou použitou literaturu.
  \end{minipage} \par
  \vspace{1.5cm}
  \noindent
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    V Praze dne \@date
  \end{minipage}
  \begin{minipage}[t]{0.3\textwidth}\vspace{0pt}%
    \centering ~ \par \textbf{\dotfill} \par \@author
  \end{minipage}
  \cleardoublepage
  % Czech abstract
  \thispagestyle{plain}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Název:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \textbf{\@titleCZE}
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Autor:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@author
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Obor:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@branch
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Druh práce:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@thesistype
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Školitel:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@supervisor
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Školitel specialista:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@supervisorspec
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Abstrakt:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@abstractCZE
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Klíčová slova:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@keywordsCZE
  \end{minipage} \par
  \vfill
  \cleardoublepage
  % English abstract
  \thispagestyle{plain}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Title:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \textbf{\@titleENG}
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Abstract:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@abstractENG
  \end{minipage} \par
  \vspace{0.5cm}
  \noindent
  \begin{minipage}[t]{0.25\textwidth}\vspace{0pt}%
    \doccol \textbf{Keywords:}
  \end{minipage}
  \hspace{0.05\textwidth}
  \begin{minipage}[t]{0.7\textwidth}\vspace{0pt}%
    \@keywordsENG
  \end{minipage} \par
  \vfill
  \cleardoublepage
  \hypersetup{pageanchor=true}
  \tableofcontents
  \cleardoublepage
  \mainmatter
  
}


% ------------------------------------------------------------------------------
% Title formats
% ------------------------------------------------------------------------------
\RequirePackage[explicit]{titlesec}
\RequirePackage{sectsty}

\allsectionsfont{\doccol}

\newcommand{\titlebox}[1]{\parbox[b][][b]{\textwidth}{#1}}

\titleformat{\chapter}[display]
  {\doccol \bfseries \huge}
  {\filleft {\fontsize{1.5cm}{1cm}\selectfont\thechapter}}
  {0ex}
  {\titlebox{#1}}
  [{\titlerule[2pt]}]

\titleformat{\part}[display]
   {\doccol \Huge \bfseries \filcenter}
   {\partname{} \thepart}
   {0em}
   {{\titlerule[4pt]} #1}

\assignpagestyle{\part}{plain}


% ------------------------------------------------------------------------------
% Headers and footers
% ------------------------------------------------------------------------------
\RequirePackage{fancyhdr}

\newskip\linepagesep\linepagesep10pt\relax
\def\vfootline{\begingroup \doccol \rule[-990pt]{2pt}{1000pt} \endgroup}

% fancy page style
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter \ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection \ #1}}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headrulewidth}{2pt}
\renewcommand{\headrule}{\hbox to\headwidth{\doccol\leaders\hrule height \headrulewidth \hfill}}

\fancyhf{}
\fancyhead[RO]{\doccol \textbf{\nouppercase{\leftmark}}}
\fancyhead[LE]{\doccol \textbf{\nouppercase{\rightmark}}}
\fancyfoot[RO]{\doccol \vfootline \hskip \linepagesep \textbf{\thepage}}
\fancyfoot[LE]{\doccol \textbf{\thepage} \hskip \linepagesep \vfootline}

% plain page style
\fancypagestyle{plain}{
  \renewcommand{\headrulewidth}{0pt}
  \fancyhf{}
  \fancyfoot[RO]{\doccol \vfootline \hskip \linepagesep \textbf{\thepage}}
  \fancyfoot[LE]{\doccol \textbf{\thepage} \hskip \linepagesep \vfootline}
}

% empty page style
\def\cleardoublepage{
  \clearpage
    \if@twoside
      \ifodd\c@page\else
      \hbox{}
      \thispagestyle{plain}
      \newpage
    \fi
  \fi
}


% ------------------------------------------------------------------------------
% Theorems
% ------------------------------------------------------------------------------
\RequirePackage[framemethod=TikZ]{mdframed}
\RequirePackage{xifthen}

% theorem style
\mdfdefinestyle{theoremstyle}{
  outerlinewidth            = 2,
  roundcorner               = 1pt,
  linecolor                 = mblue!50,
  linewidth                 = 1pt,
  frametitlerule            = true,
  frametitlebackgroundcolor = mblue!50,
  skipabove                 = 5pt,
  skipbelow                 = 5pt,
}
\newmdtheoremenv[style = theoremstyle]{thm}{Theorem}[chapter]
\mdtheorem[style = theoremstyle]{theorem}[thm]{Theorem}
\mdtheorem[style = theoremstyle]{lemma}[thm]{Lemma}
\mdtheorem[style = theoremstyle]{corollary}[thm]{Corollary}
\mdtheorem[style = theoremstyle]{proposition}[thm]{Proposition}

\renewcommand{\qedsymbol}{{\doccol $\blacksquare$}}
\renewenvironment{proof}[1][\proofname]{%
  \noindent{\doccol\textit{\textbf{#1:}}}\par\nobreak\noindent\ignorespaces%
}{\qed}

% definition style
\mdfdefinestyle{definitionstyle}{
  outerlinewidth            = 2,
  roundcorner               = 1pt,
  linecolor                 = mgreen!50,
  linewidth                 = 1pt,
  frametitlerule            = true,
  frametitlebackgroundcolor = mgreen!50,
  skipabove                 = 5pt,
  skipbelow                 = 5pt,
}
\mdtheorem[style = definitionstyle]{definition}[thm]{Definition}

% example style
\mdfdefinestyle{examplestyle}{
  outerlinewidth            = 2,
  roundcorner               = 1pt,
  linecolor                 = myellow!50,
  linewidth                 = 1pt,
  frametitlerule            = true,
  frametitlebackgroundcolor = myellow!50,
  skipabove                 = 5pt,
  skipbelow                 = 5pt,
}
\mdtheorem[style = examplestyle]{example}[thm]{Example}

% remark and solution style
\theoremstyle{definition}
\newtheorem{remark}[thm]{Remark}
\newtheorem*{remark*}{Remark}