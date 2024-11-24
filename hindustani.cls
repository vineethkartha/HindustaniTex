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

% Notes for Tara Saptak (Higher octave) - Adjusted for proper math rendering
\newcommand{\hsa}{\ensuremath{\dot{\mathord{S}}}} 
\newcommand{\hri}{\ensuremath{\dot{\mathord{\b{R}}}}} 
\newcommand{\hRi}{\ensuremath{\dot{\mathord{R}}}}
\newcommand{\hga}{\ensuremath{\dot{\mathord{\b{G}}}}}
\newcommand{\hGa}{\ensuremath{\dot{\mathord{G}}}}
\newcommand{\hma}{\ensuremath{\dot{\mathord{M}}}}
\newcommand{\hMa}{\ensuremath{\dot{\mathord{{\'{M}}}}}}
\newcommand{\hpa}{\ensuremath{\dot{\mathord{P}}}}
\newcommand{\hdha}{\ensuremath{\dot{\mathord{\b{D}}}}}
\newcommand{\hDha}{\ensuremath{\dot{\mathord{D}}}}
\newcommand{\hnii}{\ensuremath{\dot{\mathord{\b{N}}}}}
\newcommand{\hNii}{\ensuremath{\dot{\mathord{N}}}}

% Define a new command that maps letters to notes
\ExplSyntaxOn
\NewDocumentCommand{\cn}{m}
 {
   \bhavik_convert_notes:n { #1 }
 }

% Define the mapping function
\cs_new_protected:Nn \bhavik_convert_notes:n
 {
   % Step 1: Handle Mandra and Madhya Saptak (suffix '1')
   \tl_set:Nx \l_temp_tl { #1 }
   
   % Step 2: Handle Tara Saptak 
   \tl_replace_all:Nnn \l_temp_tl {s2} {\hsa}
   \tl_replace_all:Nnn \l_temp_tl {r2} {\hri}
   \tl_replace_all:Nnn \l_temp_tl {R2} {\hRi}
   \tl_replace_all:Nnn \l_temp_tl {g2} {\hga}
   \tl_replace_all:Nnn \l_temp_tl {G2} {\hGa}
   \tl_replace_all:Nnn \l_temp_tl {m2} {\hma}
   \tl_replace_all:Nnn \l_temp_tl {M2} {\hMa}
   \tl_replace_all:Nnn \l_temp_tl {P2} {\hpa}
   \tl_replace_all:Nnn \l_temp_tl {d2} {\hdha}
   \tl_replace_all:Nnn \l_temp_tl {D2} {\hDha}
   \tl_replace_all:Nnn \l_temp_tl {n2} {\hnii}
   \tl_replace_all:Nnn \l_temp_tl {N2} {\hNii}
   
   
   % Replace with mappings for suffix 1
   \tl_replace_all:Nnn \l_temp_tl {s1} {\lsa}
   \tl_replace_all:Nnn \l_temp_tl {r1} {\lri}
   \tl_replace_all:Nnn \l_temp_tl {R1} {\lRi}
   \tl_replace_all:Nnn \l_temp_tl {g1} {\lga}
   \tl_replace_all:Nnn \l_temp_tl {G1} {\lGa}
   \tl_replace_all:Nnn \l_temp_tl {m1} {\lma}
   \tl_replace_all:Nnn \l_temp_tl {M1} {\lMa}
   \tl_replace_all:Nnn \l_temp_tl {P1} {\lpa}
   \tl_replace_all:Nnn \l_temp_tl {d1} {\ldha}
   \tl_replace_all:Nnn \l_temp_tl {D1} {\lDha}
   \tl_replace_all:Nnn \l_temp_tl {n1} {\lnii}
   \tl_replace_all:Nnn \l_temp_tl {N1} {\lNii}
   \tl_replace_all:Nnn \l_temp_tl {s} {\sa}
   \tl_replace_all:Nnn \l_temp_tl {r} {\ri}
   \tl_replace_all:Nnn \l_temp_tl {R} {\Ri}
   \tl_replace_all:Nnn \l_temp_tl {g} {\ga}
   \tl_replace_all:Nnn \l_temp_tl {G} {\Ga}
   \tl_replace_all:Nnn \l_temp_tl {m} {\ma}
   \tl_replace_all:Nnn \l_temp_tl {M} {\Ma}
   \tl_replace_all:Nnn \l_temp_tl {P} {\pa}
   \tl_replace_all:Nnn \l_temp_tl {d} {\dha}
   \tl_replace_all:Nnn \l_temp_tl {D} {\Dha}
   \tl_replace_all:Nnn \l_temp_tl {n} {\nii}
   \tl_replace_all:Nnn \l_temp_tl {N} {\Nii} 

   % Output the final converted text
   \tl_use:N \l_temp_tl
 }
\ExplSyntaxOff

\ExplSyntaxOn
 % Helper function to process cells
\cs_new:Nn \taal_format_cell:n
 {
  % Check if the input contains '*'
  \tl_set:Nn \l_tmpa_tl {#1}
  \tl_if_in:nnTF {#1} {*}
    {
       % Remove the '*' and apply matra to the content
      \tl_replace_all:Nnn \l_tmpa_tl {*} {}
      \matra{\cn{\l_tmpa_tl}} % Render with \matra
    }
    {
      % Render the cell content normally if no *
      \cn{\l_tmpa_tl}
    }
 }


\NewDocumentCommand{\teentaal}{ m }
 {
 \begin{center}
   \resizebox{\textwidth}{!}{
   \begin{tabular}{|cccc|cccc|cccc|cccc|} \hline
    \textbf{Dha} & \textbf{dhin} & \textbf{dhin} & \textbf{Dha} & 
    \textbf{Dha} & \textbf{dhin} & \textbf{dhin} & \textbf{Dha} & 
    \textbf{Dha} & \textbf{tin} & \textbf{tin} & \textbf{ta} & 
    \textbf{Tita} & \textbf{tin} & \textbf{tin} & \textbf{dha} \\ \hline
    \teentaal_process_input:nN { #1 }{16}
  \end{tabular}
  }
  
 \end{center}
 }
 
 \NewDocumentCommand{\roopaktaal}{ m }
 {
   \begin{tabular}{|ccc|cc|cc|} \hline
    \textbf{Ti} & \textbf{Ti} & \textbf{na} & \textbf{Dhi} & \textbf{na} &\textbf{Dhi} & \textbf{na} \\ \hline
    \teentaal_process_input:nN { #1 }{7}
  \end{tabular}  
 }

% Process input and handle rows
\cs_new:Nn \teentaal_process_input:nN
 {
  % Split the input by commas
  \seq_set_split:Nnn \l_tmpa_seq { , } { #1 }

  % Initialize a global counter
  \int_gzero:N \g_tmpa_int
  
  % Get the total number of elements
  \int_gset:Nn \g_tmpb_int { \seq_count:N \l_tmpa_seq }

  % Iterate over the sequence
  \seq_map_inline:Nn \l_tmpa_seq
   {
    % Increment the counter
    \int_gincr:N \g_tmpa_int
    
    % Print the current item
    \taal_format_cell:n{##1}

    % Add separator (&) or row end (\\ or \hline)
    \int_compare:nNnTF { \int_mod:nn { \g_tmpa_int } { #2 } } = { 0 }
     {
      % Check if it's the last row
      \int_compare:nNnTF { \g_tmpa_int } = { \g_tmpb_int }
       { \\ \hline }     % Otherwise, start a new row
       {\\}
     }
     { & }  % Otherwise, continue the row
   }

  % Add "-" for the rows where there are not enough elements
  \int_compare:nNnT { \int_mod:nn { \g_tmpa_int } { #2 } } > { 0 }
   {
    % Calculate remaining columns
    \int_set:Nn \l_tmpb_int { #2 - \int_mod:nn { \g_tmpa_int } { #2 } }
    
    % Add empty cells
    \int_step_inline:nn { \l_tmpb_int -1 }
     { x & }

    % Close the last row
     x \\ \hline
   }
 }
\ExplSyntaxOff


% Representing notes per beat
\newcommand{\matra}[1]{%
  \tikz[baseline=(X.base)]{
    \node[inner sep=0pt] (X) {\raisebox{-0.2em}{\cn{#1}}};
    \draw[thick] ([xshift=-0.1em]X.south west) to[bend right=45] ([xshift=0.1em]X.south east);
  }%
}


% Representation of Meend
\newcommand{\meend}[1]{
  \begin{tikzpicture}[baseline=(X.base)]
    \node[inner sep=0pt] (X) {\cn{#1}};
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
