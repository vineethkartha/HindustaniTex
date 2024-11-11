% Define the Hindustani Music LaTeX Class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hindustani}[2024/01/01 v1.5 Class for Hindustani Music Notes]

% Base class and required packages
\LoadClass{article}
\RequirePackage{geometry}
\RequirePackage{amsmath, amssymb}
\RequirePackage{titlesec}
\RequirePackage{xcolor}
\RequirePackage{multicol}
\usepackage{tikz}
\usetikzlibrary{tikzmark}
\usepackage{xparse} % For defining commands with arguments
\usepackage{expl3}  % For LaTeX3 programming

% Set up fonts and layout
%\setmainfont{Noto Serif}

% Margins
\geometry{a4paper, margin=0.5in}

% Define Colors
\definecolor{ragacolor}{rgb}{0.13, 0.54, 0.13}  % Dark Green for Raaga Color
\definecolor{taalcolor}{rgb}{0.27, 0.51, 0.71}  % Steel Blue for Taal Color

% Section Formatting
\titleformat{\section}{\large\bfseries\color{ragacolor}}{}{0em}{}[\vspace{0.5em}\titlerule]
\titleformat{\subsection}{\bfseries\color{taalcolor}}{}{0em}{}

% Commands for specific Hindustani music elements
\newcommand{\raag}[1]{\section*{Raag: #1}}
%\newcommand{\alankar}{\subsection*{Alankaars}}
\newcommand{\aaroha}[1]{\textbf{Aaroha:  }    {#1}}
\newcommand{\avaroha}[1]{\textbf{Avaroha: }{#1}}
\newcommand{\alankar}[2]{\aaroha{#1} \\ \avaroha{#2}}
% Macros for Notes with Optional Flat (komal) or Sharp (tivra) versions
% Notes for Mandra Saptak (Lower octave)
\newcommand{\lsa}{\d{S}} 
\newcommand{\lri}{\d{\b{R}}} 
\newcommand{\lRi}{\d{R}}
\newcommand{\lga}{\d{\b{G}}}
\newcommand{\lGa}{\d{G}}
\newcommand{\lma}{\d{M}}
\newcommand{\lMa}{\d{\'{M}}}
\newcommand{\lpa}{\d{P}}
\newcommand{\ldha}{\d{\b{D}}}
\newcommand{\lDha}{\d{D}}
\newcommand{\lnii}{\d{\b{N}}}
\newcommand{\lNii}{\d{N}}

% Notes for Madhya Saptak (Middle octave)
\newcommand{\sa}{S} 
\newcommand{\ri}{\b{R}} 
\newcommand{\Ri}{R}
\newcommand{\ga}{\b{G}}
\newcommand{\Ga}{G}
\newcommand{\ma}{M}
\newcommand{\Ma}{\'{M}}
\newcommand{\pa}{P}
\newcommand{\dha}{\b{D}}
\newcommand{\Dha}{D}
\newcommand{\nii}{\b{N}}
\newcommand{\Nii}{N}

% Notes for Tara Saptak (Higher octave)
\newcommand{\hsa}{\.{S}} 
\newcommand{\hri}{\.{\b{R}}} 
\newcommand{\hRi}{\.{R}}
\newcommand{\hga}{\.{\b{G}}}
\newcommand{\hGa}{\.{G}}
\newcommand{\hma}{\.{M}}
\newcommand{\hMa}{\.{\'{M}}}
\newcommand{\hpa}{\.{P}}
\newcommand{\hdha}{\.{\b{D}}}
\newcommand{\hDha}{\.{D}}
\newcommand{\hnii}{\.{\b{N}}}
\newcommand{\hNii}{\.{N}}


% Define a new command that maps letters to notes
\ExplSyntaxOn
\NewDocumentCommand{\cn}{m}
 {
   \bhavik_convert_notes:n { #1 }
 }

% Define the mapping function
\cs_new_protected:Nn \bhavik_convert_notes:n
 {
   % Map each character to a command
   \tl_map_inline:nn { #1 }
    {
      \str_case:nn { ##1 }
       {
         {s1}{\lsa}
         {r1}{\lri}
         {R1}{\lRi}
         {g1}{\lga}
         {G1}{\lGa}
         {m1}{\lma}
         {M1}{\lMa}
         {P1}{\lpa}
         {d1}{\ldha}
         {D1}{\lDha}
         {n1}{\lnii}
         {N1}{\lNii}
         {s}{\sa}
         {r}{\ri}
         {R}{\Ri}
         {g}{\ga}
         {G}{\Ga}
         {m}{\ma}
         {M}{\Ma}
         {P}{\pa}
         {d}{\dha}
         {D}{\Dha}
         {n}{\nii}
         {N}{\Nii}
         {s2}{\hsa}
         {r2}{\hri}
         {R2}{\hRi}
         {g2}{\hga}
         {G2}{\hGa}
         {m2}{\hma}
         {M2}{\hMa}
         {P2}{\hpa}
         {d2}{\hdha}
         {D2}{\hDha}
         {n2}{\hnii}
         {N2}{\hNii}
         % Add more mappings if needed
       }
       \space % Add space between notes
    }
 }
\ExplSyntaxOff

% Representing notes per beat
\newcommand{\matra}[1]{%
  \tikz[baseline=(X.base)]{
    \node[inner sep=0pt] (X) {\raisebox{-0.2em}{#1}};
    \draw[thick] ([xshift=-0.1em]X.south west) to[bend right=45] ([xshift=0.1em]X.south east);
  }%
}


% Representation of Meend
\newcommand{\meend}[1]{
  \begin{tikzpicture}[baseline=(X.base)]
    \node[inner sep=0pt] (X) {#1};
    \draw[thick] ([xshift=-0.1em]X.north west) to[bend left=45] ([xshift=0.1em]X.north east);
  \end{tikzpicture}
}

\newcommand{\kan}[2]{$^{#1}#2$}

% Environment for Composition (Bandish)
\newenvironment{composition}
    {\begin{quote}\small}
    {\end{quote}}


% Document Title Setup
\newcommand{\musictitle}[2]{
    \begin{center}
        {\huge \textbf{#1}} \\
        \vspace{0.5em}
        \emph{#2}
    \end{center}
    \vspace{1em}
}

% End of class definition
\endinput
