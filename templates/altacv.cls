% An adaptation of AltaCV for AutoCV (https://github.com/rozzong/autocv)
% Adapted from LianTze Lim's work (https://github.com/liantze/AltaCV)


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{altacv}[2022/06/22 An adaptation of AltaCV for AutoCV]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{autocv}}
\ProcessOptions\relax

\LoadClass{autocv}

\RequirePackage{dashrule}
\RequirePackage{enumitem}
\RequirePackage[fixed]{fontawesome5}
\RequirePackage{fontspec}
\RequirePackage{ifthen}
\RequirePackage{lengthconvert}
\RequirePackage[margin=2cm]{geometry}
\RequirePackage[nomessages]{fp}
\RequirePackage{paracol}
\RequirePackage{pgf}
\RequirePackage{setspace}
\RequirePackage{tabularx}
\RequirePackage[skins]{tcolorbox}
\RequirePackage[nobottomtitles*]{titlesec}
\RequirePackage{tikz}
\RequirePackage{xcolor}


% Settings
\newcommand{\leftcolumnratio}{
	% Custom ratio
	0.24
	% Golden ratio
%	\directlua{
%		local phi = (1 + math.sqrt(5)) / 2
%		local ratio = 1 - (1 / phi)
%		tex.print(ratio)
%	}
}


% General layout
\geometry{left=0.75cm,right=0.75cm,top=0.75cm,bottom=0.75cm,columnsep=0.75cm}
\setlist{nosep}


% Colors
\definecolor{PrimaryColor}{HTML}{001F5A}
\definecolor{SecondaryColor}{HTML}{0039AC}
\definecolor{ThirdColor}{HTML}{F3890B}
\definecolor{BodyColor}{HTML}{666666}
\definecolor{EmphasisColor}{HTML}{2E2E2E}
\definecolor{BackgroundColor}{HTML}{E2E2E2}

\colorlet{name}{PrimaryColor}
\colorlet{jobtitle}{PrimaryColor}
\colorlet{heading}{PrimaryColor}
\colorlet{headingrule}{ThirdColor}
\colorlet{subheading}{SecondaryColor}
\colorlet{accent}{SecondaryColor}
\colorlet{emphasis}{EmphasisColor}
\colorlet{body}{BodyColor}
\pagecolor{BackgroundColor}


% Fonts
\setmainfont{Roboto}
\setsansfont{Lato}
\renewcommand{\familydefault}{\sfdefault}
\newcommand{\namefont}{\Huge\bfseries}
\newcommand{\jobtitlefont}{\large\bfseries}
\newcommand{\personalinfofont}{\footnotesize\bfseries}
\newcommand{\sectionfont}{\LARGE\bfseries}
\newcommand{\subsectionfont}{\large\bfseries}


% Styles
\titleformat{\section}{\sectionfont}{\thesection}{1em}{\color{heading}\MakeUppercase}[
	{\color{headingrule}\titlerule[2pt]}
]
\titlespacing{\section}{0pt}{1.5ex plus 0ex minus .2ex}{2.3ex plus .2ex}
\renewenvironment{quote}{\color{accent}\itshape\large}{\par}
\renewcommand{\emph}[1]{\textcolor{accent}{#1}}


% Custom elements
\newcommand{\divider}{\textcolor{body!50}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip\\}
\newcommand{\link}[2][]{\textcolor{accent}{\href{#2}{\ifstrequal{#1}{}{\faLink}{#1}}}}


% Lengths
\newlength{\leftcolumnwidth}
\newlength{\rightcolumnwidth}
\newlength{\headerphotowidth}
\newlength{\headertextwidth}
\newlength{\consumedlinewidth}
\newlength{\itemwidth}
\newcommand{\updatelengths}[1][\leftcolumnwidth]{
	% Set column widths
	\setlength{\leftcolumnwidth}{\leftcolumnratio\dimexpr\linewidth-\columnsep}
	\setlength{\rightcolumnwidth}{\dimexpr\textwidth-\leftcolumnwidth-\columnsep}
	% Set header widths
	\expandafter\ifstrequal\expandafter{\photo}{}{
		\setlength{\headertextwidth}{\textwidth}
	}{
		\setlength{\headerphotowidth}{#1}
		\setlength{\headertextwidth}{\dimexpr\textwidth-\headerphotowidth-\columnsep}
	}
}
\setlength{\tabcolsep}{0pt}


% AutoCV item hooks
\renewcommand{\contactinfo}[3][]{
	\mbox{\textcolor{accent}{#2}~\textcolor{emphasis}{\ifstrequal{#1}{}{#3}{\href{#1#3}{#3}}}}
}
\newcommand{\citizenship}[1]{\contactinfo{\faPassport}{#1}}
\newcommand{\email}[1]{\contactinfo[mailto:]{\faAt}{#1}}
\newcommand{\phone}[1]{\contactinfo[tel:]{\faPhone}{#1}}
\newcommand{\location}[1]{\contactinfo[https://www.openstreetmap.org/search?query=]{\faMapMarker}{#1}}
\newcommand{\linkedin}[1]{\contactinfo[https://linkedin.com/in/]{\faLinkedin}{#1}}
\newcommand{\github}[1]{\contactinfo[https://github.com/]{\faGithub}{#1}}
\newcommand{\telegram}[1]{\contactinfo[https://t.me/]{\faTelegram}{#1}}
\newcommand{\timeperiod}[1]{\contactinfo{\faCalendar}{#1}}
\newcommand{\website}[1]{\contactinfo[https://]{\faGlobe }{#1}}
\newcommand{\whatsapp}[1]{\contactinfo[https://wa.me/]{\faWhatsapp}{#1}}

\renewcommand{\experience}[5]{
	{\large\textcolor{emphasis}{\textbf{#1}}}
	\ifstrequal{#2}{}{}{\large{\hspace{0.8ex}\textcolor{accent}{@\nobreak\hspace{0.8ex}#2}}}\par
	\ifstrequal{#3#4}{}{}{
		\par\medskip\small
		\begin{tabularx}{\linewidth}{Xr}
			\contactinfo{\faCalendar}{#3} & \location{#4}
		\end{tabularx}\leavevmode
	}
	\ifstrequal{#5}{}{}{
		\par\normalsize
		#5\leavevmode
	}\par
}

\renewcommand{\education}[5]{\experience{#1}{#2}{#3}{#4}{#5}}

\renewcommand{\award}[4]{\experience{#1}{#2}{#3}{}{#4}}

\renewcommand{\skill}[1]{%
	\begingroup
		\tikz[baseline]
		\node[
			anchor=base,
			draw=body,
			rounded corners,
			inner xsep=1ex,
			inner ysep=0.75ex,
			text height=1.5ex,
			text depth=.25ex
		]{#1};%
		\vspace{0.25ex}
	\endgroup
}

\renewcommand{\languageskill}[2]{
	\begin{tabularx}{\linewidth}{Xr}
		\textcolor{emphasis}{\textbf{#1}} & \textcolor{accent}{\textbf{#2}} 
	\end{tabularx}
	\par
}

\renewcommand{\organization}[4]{\experience{#1}{#2}{#3}{}{#4}}

\renewcommand{\certification}[4][]{
	\ifstrequal{#1}{}{}{\link{#1}}
    \textcolor{accent}{\textbf{#2}}\hspace{0.8ex}%
    \textcolor{emphasis}{--\nobreak\hspace{0.8ex}\textbf{#3}}\\
    #4
    \par
}

\renewcommand{\recommendation}[2]{
	\textcolor{emphasis}{\textbf{#1}}\par
	\begin{description}[font=\color{accent},style=multiline,leftmargin=1.35em,align=left]
		\item[\small\normalfont\faLinkedin]\href{https://linkedin.com/in/#2}{#2}
	\end{description}
}

\renewcommand{\project}[4][]{
	\large\color{emphasis}{#2}
	\ifstrequal{#1}{}{}{
		\color{accent}\,|\,\small{\href{#1}{\faLink}}
	}
	\par\smallskip\normalsize
	\ifstrequal{#3}{}{}{
		\small\makebox[0.5\linewidth][l]{\color{accent}\faCalendar\color{emphasis}~#3}
	}
	\par\normalsize\color{body}
	#4
	\par
}

\renewcommand{\testscore}[2]{\certification{#1}{#2}{}}

\renewcommand{\volunteerexperience}[5]{\experience{#1}{#2}{#3}{#4}{#5}}


% Header layout
\newcommand{\makeheaderphoto}{
	\expandafter\ifstrequal\expandafter{\photo}{}{}{
		\begin{minipage}{\headerphotowidth}		
			\tikz\filldraw[
				color=headingrule,
				fill overzoom image={\photo},
				ultra thick
			](0,0) circle[radius=0.5\headerphotowidth];
		\end{minipage}
	}
}

\newcommand{\makeheadertext}{
    \begin{minipage}{\headertextwidth}
    	\expandafter\ifstrequal\expandafter{\photo}{}{\raggedright}{
    	\raggedleft}
    	{\namefont\color{name}\MakeUppercase{\firstname\,\middlename\,\lastname}\\}
    	\medskip
    	{\jobtitlefont\color{jobtitle}\jobtitle\\}
    	\medskip
    	{\setstretch{1.5}\listitems[\quad]{\contactinfos}\\}
    \end{minipage}
}

\newcommand{\makeheader}{
	% Add the photo if a source file was provided
	\makeheaderphoto
	\hfill
	\makeheadertext
}


% Main layout
\renewcommand{\makecv}{	
	\pagestyle{empty}
	\color{body}	
	\hypersetup{hidelinks}
    \urlstyle{same}
    \raggedright
	\begin{document}
		\columnratio{\leftcolumnratio}
		\updatelengths%[2cm]
		\makeheader  % For a header built in one block
		\begin{paracol}{2}
%			\makeheaderphoto  % For column spread headers
			\makesection{About Me}{\about}
			\makesection{Skills}{\skills}
			\makesection[\smallskip]{Languages}{\languageskills}
			\makesection[\smallskip]{Certifications}{\certifications}
			\makesection[\smallskip]{Awards}{\awards}
			\makesection[\smallskip]{Test scores}{\testscores}
			\switchcolumn
%			\makeheadertext  % For column spread headers
			\makesection[\divider]{Education}{\educations}			
			\makesection[\divider]{Experience}{\experiences}		
			\makesection[\divider]{Volunteering}{\volunteerexperiences}
		\end{paracol}
		\makesection[\divider]{Projects}{\projects}
		\makesection[\smallskip]{Publications}{\publications}
		\makesection[\smallskip]{Patents}{\patents}
		\makesection[\divider]{Organizations}{\organizations}
	\end{document}
}
