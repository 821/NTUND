% cbook.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nd}
\DeclareRobustCommand{\university}[2]{\gdef\@universityen{#1}\gdef\@universityzh{#2}}
\DeclareRobustCommand{\college}[2]{\gdef\@collegeen{#1}\gdef\@collegezh{#2}}
\DeclareRobustCommand{\institute}[2]{\gdef\@instituteen{#1}\gdef\@institutezh{#2}}
\DeclareRobustCommand{\title}[2]{\gdef\@titleen{#1}\gdef\@titlezh{#2}}
\DeclareRobustCommand{\author}[2]{\gdef\@authoren{#1}\gdef\@authorzh{#2}}
\DeclareRobustCommand{\advisor}[2]{\gdef\@advisoren{#1}\gdef\@advisorzh{#2}}
\DeclareRobustCommand{\defenseyear}[2]{\gdef\@yearen{#1}\gdef\@yearzh{#2}}
\DeclareRobustCommand{\defensemonth}[2]{\gdef\@monthen{#1}\gdef\@monthzh{#2}}
\DeclareRobustCommand{\degree}[2]{\gdef\@degreeen{#1}\gdef\@degreezh{#2}}

\DeclareRobustCommand{\makecover}{
  \begin{titlepage}
    \vspace{1cm}
    \linespread{1.5}
    \begin{center}
      \fontsize{18pt}{27pt}\selectfont
      \@universityzh\@collegezh\@institutezh\par
        \@degreezh{}\par
      {\fontsize{14pt}{20pt}\selectfont
        \@instituteen\par
        \@collegeen\par
        \@universityen\par
        \@degreeen{}\par}
      \vspace{\fill}
      \fontsize{18pt}{27pt}\selectfont
      \@titlezh\par
      \@titleen\par
      \vspace{\fill}
      \@authorzh\\
      \@authoren\par
      \vspace{1cm}
      指導教授：\@advisorzh\\
      Advisor: \@advisoren\par
      \vspace{1cm}
      中華民國 \@yearzh 年 \@monthzh 月\\
      \@monthen, \@yearen
      \vspace{0.5cm}
    \end{center}
  \end{titlepage}
}




\LoadClass[a4paper,12pt,oneside]{book}
\linespread{1.5} % 行間距
\RequirePackage[top=2.8cm,right=2.8cm,bottom=2cm,left=2.8cm]{geometry}
\RequirePackage{xeCJK}
\RequirePackage{zhnumber}
\RequirePackage{CJKpunct}
\punctstyle{quanjiao}
\defaultfontfeatures{Mapping=tex-text}
\setCJKmainfont[]{PMingLiU} % AutoFakeSlant 是斜體， AutoFakeBold 是黑體 fc-cache -fsv
\setmainfont{Times New Roman}
\setCJKmonofont[AutoFakeBold]{楷体}
\setmonofont{Times New Roman}

\RequirePackage{color}
\RequirePackage[bottom]{footmisc}
\RequirePackage{url}
\RequirePackage[unicode,CJKbookmarks=true,colorlinks=true,linkcolor=blue,urlcolor=blue,citecolor=blue]{hyperref}

% 結構漢化
\renewcommand{\contentsname}{目錄}
\renewcommand{\listfigurename}{圖目錄}
\renewcommand{\listtablename}{表目錄}
\renewcommand{\figurename}{圖}
\renewcommand{\tablename}{表}
\renewcommand{\indexname}{索引}

% 章節名
\RequirePackage{titlesec, titletoc}
\titleformat{\chapter}{\Huge\center}{第\zhnumber{\thechapter}章}{1em}{}
\renewcommand{\thesection}{\zhnumber{\arabic{section}}}
\titleformat{\section}{\Large\center}{第\thesection 節}{1em}{}
\renewcommand{\thesubsection}{\arabic{subsection}}
\titleformat{\subsection}{\large}{\zhnumsetup{style={Traditional,Financial}} \zhnumber{\thesubsection} 、 }{0em}{}
\renewcommand{\thesubsubsection}{\zhnumber{\arabic{subsubsection}}}
\titleformat{\subsubsection}{\large}{\thesubsubsection 、}{0em}{}
\titlespacing{\chapter}{0pt}{0pt}{2em}
% \titlecontents{标题名}[左间距]{标题格式}{标题标志}{无序号标题}{指引线与页码}[下间距]
\titlecontents{chapter}[0pt]{}{第\zhnumber{\thecontentslabel} 章\hspace*{1em}}{}{\small\dotfill \thecontentspage}
\titlecontents{section}[24pt]{}{第\thecontentslabel 節\hspace*{1em}}{}{\small\dotfill \thecontentspage}
\titlecontents{subsection}[48pt]{}{\zhnumsetup{style={Traditional,Financial}} \zhnumber{\thecontentslabel} 、}{}{\small\dotfill \thecontentspage}
\titlecontents{subsubsection}[72pt]{}{\thecontentslabel 、}{}{\small\dotfill \thecontentspage}
\setcounter{secnumdepth}{3}

% 合倂圖表目錄
\newcommand*\listoffiguresandtables{%
  \chapter*{圖表目錄}
  \@starttoc{lof}
  \@starttoc{lot}
}
% 中文版默認脫落「圖」字，此處補上
\def\@caption#1[#2]#3{%
  \par
  \addcontentsline{\csname ext@#1\endcsname}{#1}%
                  {\protect\numberline{\csname #1name\endcsname\hskip0.5em\csname the#1\endcsname}%
                  {\ignorespaces #2}}%
  \begingroup
  \@parboxrestore
  \if@minipage
  \@setminipage
  \fi
  \normalsize
  \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
\renewcommand*\l@figure{\@dottedtocline{1}{0em}{4em}}
\let\l@table\l@figure

% 造個簡單的長篇引用環境
\renewenvironment{quote}
               {\list{}{\leftmargin 3em
               \ttfamily\selectfont}%
                \item\relax}
               {\endlist}

\RequirePackage{fancyhdr}
\pagestyle{plain}
\fancyhf{}
\cfoot{\thepage}

% 首行縮進
\def\elegant@CJKChar@size{\hskip \f@size \p@}
\newdimen\elegant@CJKChar@size@dimen
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}
\newcommand{\CJKsetfontspace}{
\settowidth\elegant@CJKChar@size@dimen{\elegant@CJKChar@size\CJKglue}%
\ifdim\parindent=0pt%
\relax%
\else%
\parindent2\elegant@CJKChar@size@dimen%
\fi%
}
\newcommand{\Eindent}{\CJKsetfontspace\parindent2\elegant@CJKChar@size@dimen}
\newcommand{\Enoindent}{\parident\z@}
\RequirePackage{indentfirst}
\AtBeginDocument{\Eindent}
\endinput

