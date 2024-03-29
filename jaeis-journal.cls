\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jaeis-journal}
  [2017/04/28 Yoshiki Sato]

\LoadClass[a4j, twocolumn, 11pt, uplatex, dvipdfmx]{jsarticle}

\usepackage[uplatex,jis2004]{otf}

% 古いコマンドやパッケージを警告
% nag - Detecting and warning about obsolete LaTeX commands
% http://www.ctan.org/tex-archive/macros/latex/contrib/nag
\RequirePackage[l2tabu, orthodox]{nag}

% amsmath が提供しない数式環境を使用した場合に警告
% onlyamsmath
% http://www.ctan.org/tex-archive/macros/latex/contrib/onlyamsmath
\usepackage[all, warning]{onlyamsmath}

% コメントアウト
\usepackage{comment}

% 日本語のしおり文字化け対策
\ifx\kanjiskip\undefined\else
  \usepackage{atbegshi}
  \ifx\ucs\undefined
	\ifnum 42146=\euc"A4A2
	  \AtBeginShipoutFirst{\special{pdf:tounicode EUC-UCS2}}
	\else
	  \AtBeginShipoutFirst{\special{pdf:tounicode 90ms-RKSJ-UCS2}}
	\fi
  \else
	\AtBeginShipoutFirst{\special{pdf:tounicode UTF8-UCS2}}
  \fi
	\usepackage[dvipdfmx,colorlinks=false]{hyperref}
\fi


\usepackage[top=20truemm,bottom=24truemm,left=23truemm,right=23truemm]{geometry}

%\renewcommand{\baselinestretch}{1.0} % 行送りを倍率で設定
%\setlength{\baselineskip}{9pt}       % 行送りを値で設定
\pagestyle{empty}

% ######## measure #########
% # mm = 1mm = 2.85pt      #
% # cm = 10mm = 28.5pt     #
% # in = 25.4mm = 72.27pt  #
% # pt = 0.35mm = 1pt      #
% # em = width of [M]      #
% # ex = height of [x]     #
% # zw = width of [Kanji]  #
% # zh = height of [Kanji] #
% ##########################
% ##################### Portrait Setting #########################
% # TOP = 1inch + \voffset + \topmargin + \headheight + \headsep #
% #     = 1inch + 0pt + 4pt + 20pt + 18pt (default)              #
% # BOTTOM = \paperheight - TOP -\textheight                     #
% ################################################################
\setlength{\textheight}{\paperheight}  % 紙面縦幅を本文領域にする（BOTTOM=-TOP）
\setlength{\textheight}{50\baselineskip}   % 紙面縦幅を50行にする
\setlength{\topmargin}{-5.4truemm}       % 上の余白を20mm（=1inch-5.4mm）に
\addtolength{\topmargin}{-\headheight}  % 
\addtolength{\topmargin}{-\headsep}     % ヘッダの分だけ本文領域を移動させる
\addtolength{\textheight}{-65truemm}    % 下の余白は24mm（BOTTOM=-TOPだから+TOP+??mm）
% #################### Landscape Setting #######################
% # LEFT = 1inch + \hoffset + \oddsidemargin (\evensidemargin) #
% #      = 1inch + 0pt + 0pt                                   #
% # RIGHT = \paperwidth - LEFT - \textwidth                    #
% ##############################################################
\setlength{\textwidth}{\paperwidth}     % 紙面横幅を本文領域にする（RIGHT=-LEFT）

\setlength{\oddsidemargin}{-2.4truemm}  % 左の余白を23mm(=1inch-2.4mm)に
\setlength{\evensidemargin}{-2.4truemm} % 
\addtolength{\textwidth}{-46truemm}     % 右の余白も23mm（RIGHT=-LEFT）

%\setlength{\fullwidth}{43zw}     % 紙面横幅を43zw（20.5zw + 2zw + 20.5zw)
%\setlength{\textwidth}{\fullwidth}
%\setlength{\columnsep}{2zw}

% 行送り= フォントサイズ  * 1.15
% 9pt
%\renewcommand\small{\@setfontsize\normalsize{9.034}{10.3891}}
\renewcommand\small{\@setfontsize\normalsize{9.034}{13.551}}
% 10pt
\renewcommand\normalsize{\@setfontsize\normalsize{10.038}{11.5437}}
% 10.5pt
\renewcommand\large{\@setfontsize\large{10.539}{12.11985}}
% 11pt
\renewcommand\Large{\@setfontsize\Large{11.041}{12.69715}}
% 12pt
\renewcommand\LARGE{\@setfontsize\LARGE{12.045}{13.85175}}
% 14pt
\renewcommand\huge{\@setfontsize\huge{14.053}{16.16095}}
% 16pt
\renewcommand\Huge{\@setfontsize\huge{16.060}{18.469}}

\let\@etitle\@empty
\newcommand{\etitle}[1]{\gdef\@etitle{#1}}
\let\@subtitle\@empty
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\let\@esubtitle\@empty
\newcommand{\esubtitle}[1]{\gdef\@esubtitle{#1}}

\let\@abstract\@empty
\renewcommand{\abstract}[1]{\gdef\@abstract{#1}}
\let\@keyword\@empty
\newcommand{\keyword}[1]{\gdef\@keyword{#1}}

\let\@author\@empty
\renewcommand{\author}[1]{\gdef\@author{#1}}
\let\@eauthor\@empty
\newcommand{\eauthor}[1]{\gdef\@eauthor{#1}}

\let\@affiliation\@empty
\newcommand{\affiliation}[1]{\gdef\@affiliation{#1}}
\let\@eaffiliation\@empty
\newcommand{\eaffiliation}[1]{\gdef\@eaffiliation{#1}}

\let\@email\@empty
\newcommand{\email}[1]{\gdef\@email{#1}}

\def\@maketitle{%
	\newpage\null
	\begin{minipage}[c]{42zw}
		\begin{center}
		\let\footnote\thanks
		\hspace{0.32cm}{\huge\textbf{\@title} \par}%
		\vspace{2pt}
		{\Large\@etitle\par}%
		%\vspace{10pt}

		\if\relax\@subtitle\relax%
			\else
			{\LARGE\textbf{- \@subtitle -}\par}%
			\if\relax\@esubtitle\relax%
				\else
				{\normalsize-\hspace{2mm}\@esubtitle\hspace{2mm}-\par}%
			\fi%
			\vspace{12pt}
		\fi%
		{\LARGE\textbf{\@author}\par}%
		\vspace{-1pt}
		{\normalsize\@eauthor\par}%
		\vspace{5pt}
		{\Large\textbf{\@affiliation}\par}%
		{\normalsize\@eaffiliation\par}%
		\vspace{2pt}
		{\Large\textsf\@email\par}%
		\end{center}

		\vspace{4pt}

		\hspace{1zw}
		\begin{tabularx}{42zw}{X}
		{\setlength{\baselineskip}{12.056pt}
		\hspace{1zw}{\small\@abstract\par}}
		\end{tabularx}

		\vspace{-10pt}

		\hspace{2zw}
		\begin{tabularx}{42zw}{X}
		{\small\textbf{キーワード：}{\setlength{\baselineskip}{10.539pt}\@keyword\par}}
		\end{tabularx}
		\vspace{-10pt}
	\end{minipage}
}

\renewcommand{\section}{%
	\@startsection{section}{1}{\z@}%
	{0.9\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\large\headfont\raggedright}}

\renewcommand{\subsection}{%
	\@startsection{subsection}{1}{\z@}%
	%{0.9\Cvs}% 前アキ
	%{0.1\Cvs}% 後アキ
	{0.1\Cvs}
	{0.1\Cvs}
	{\normalfont\normalsize\headfont\raggedright}}

\renewcommand{\subsubsection}{%
	\@startsection{subsubsection}{1}{\z@}%
	{0.9\Cvs}% 前アキ
	{0.1\Cvs}% 後アキ
	{\normalfont\normalsize\headfont\raggedright}}

\usepackage{secdot}
\sectiondot{subsection}
\sectiondot{subsubsection}

\makeatletter
\renewcommand{\refname}{\center{参考文献}}
\makeatother
