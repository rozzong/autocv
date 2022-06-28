\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{autocv}[2022/06/27 A class offering hooks to automate the creation of CVs.]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{extarticle}}
\ProcessOptions\relax

\LoadClass{extarticle}

\RequirePackage{etoolbox}
\RequirePackage[a-1b]{pdfx}
\RequirePackage{accsupp}
\RequirePackage{scrlfile}
\RequirePackage[newcommands]{ragged2e}


% Constant setters
\newcommand{\firstname}{}
\newcommand{\middlename}{}
\newcommand{\lastname}{}
\newcommand{\jobtitle}{}
\newcommand{\photo}{}
\newcommand{\about}{}

% Item constructors
\newcommand{\contactinfo}[2]{\ClassWarning{autocv}{Command 'contactinfo' is not defined}}
\newcommand{\experience}[5]{\ClassWarning{autocv}{Command 'experience' is not defined}}
\newcommand{\education}[5]{\ClassWarning{autocv}{Command 'education' is not defined}}
\newcommand{\certification}{\ClassWarning{autocv}{Command 'certification' is not defined}}
\newcommand{\skill}{\ClassWarning{autocv}{Command 'skill' is not defined}}
\newcommand{\recommendation}{\ClassWarning{autocv}{Command 'recommendation' is not defined}}
\newcommand{\course}{\ClassWarning{autocv}{Command 'course' is not defined}}
\newcommand{\award}{\ClassWarning{autocv}{Command 'award' is not defined}}
\newcommand{\languageskill}{\ClassWarning{autocv}{Command 'languageskill' is not defined}}
\newcommand{\organization}{\ClassWarning{autocv}{Command 'organization' is not defined}}
\newcommand{\patent}{\ClassWarning{autocv}{Command 'patent' is not defined}}
\newcommand{\publication}{\ClassWarning{autocv}{Command 'publication' is not defined}}  % TODO: use bibtex
\newcommand{\project}{\ClassWarning{autocv}{Command 'project' is not defined}}
\newcommand{\testscore}{\ClassWarning{autocv}{Command 'testscore' is not defined}}
\newcommand{\volunteerexperience}{\ClassWarning{autocv}{Command 'volunteerexperience' is not defined}}


% Item lists
% Based on the sections from:
% https://www.linkedin.com/help/linkedin/answer/a564064/your-linkedin-profile
\newcommand{\contactinfos}{}
\newcommand{\experiences}{}
\newcommand{\educations}{}
\newcommand{\certifications}{}
\newcommand{\skills}{}
\newcommand{\recommendations}{}
\newcommand{\courses}{}
\newcommand{\awards}{}
\newcommand{\languageskills}{}
\newcommand{\organizations}{}
\newcommand{\patents}{}
\newcommand{\publications}{}  % TODO: use bibtex
\newcommand{\projects}{}
\newcommand{\testscores}{}
\newcommand{\volunteerexperiences}{}


% List utilities
\newcommand{\listitems}[2][]{
	\def\itemssep{\def\itemssep{#1}}
	\forlistloop{\itemssep}{#2}
}
\newcounter{itemcounter}
\newcommand{\length}[1]{
    \setcounter{itemcounter}{0}
    \renewcommand*{\do}[1]{\stepcounter{itemcounter}}
    \docsvlist{#1}
    \theitemcounter
}


% Constants interface commands
\newcommand{\setfirstname}{\def\firstname}
\newcommand{\setmiddlename}{\def\middlename}
\newcommand{\setlastname}{\def\lastname}
\newcommand{\setjobtitle}{\def\jobtitle}
\newcommand{\setphoto}{\def\photo}
\newcommand{\setabout}{\def\about}


% Item lists interface commands
\newrobustcmd{\addcontactinfo}[2]{\listadd{\contactinfos}{\ifcsdef{#1}{\csuse{#1}{#2}}{}}}
\newcommand{\addexperience}[5]{\listadd{\experiences}{\experience{#1}{#2}{#3}{#4}{#5}}}
\newcommand{\addeducation}[5]{\listadd{\educations}{\education{#1}{#2}{#3}{#4}{#5}}}
\newcommand{\addcertification}[4][]{\listadd{\certifications}{\certification[#1]{#2}{#3}{#4}}}
\newcommand{\addskill}[1]{\listadd{\skills}{\skill{#1}}}
\newcommand{\addrecommendation}[3][]{\listadd{\recommendations}{\recommendation[#1]{#2}{#3}}}
\newcommand{\addcourse}[3]{\listadd{\courses}{\course{#1}{#3}{#3}}}
\newcommand{\addaward}[4]{\listadd{\awards}{\award{#1}{#2}{#3}{#4}}}
\newcommand{\addlanguageskill}[2]{\listadd{\languageskills}{\languageskill{#1}{#2}}}
\newcommand{\addorganization}[4]{\listadd{\organizations}{\organization{#1}{#2}{#3}{#4}}}
\newcommand{\addpatent}[2]{\listadd{\patents}{\patent{#1}{#2}}}
\newcommand{\addpublication}[2]{\listadd{\publications}{\publication{#1}{#2}}}  % TODO: use bibtex
\newcommand{\addproject}[4][]{\listadd{\projects}{\project[#1]{#2}{#3}{#4}}}
\newcommand{\addtestscore}[2]{\listadd{\testscores}{\testscore{#1}{#2}}}
\newcommand{\addvolunteerexperience}[5]{\listadd{\volunteerexperiences}{\volunteerexperience{#1}{#2}{#3}{#4}{#5}}}


% Section constructor
\newcommand{\makesection}[3][]{
	\expandafter\ifstrequal\expandafter{#3}{}{}{
		\section*{#2}
		\sloppy
		\listitems[#1]{#3}
	}
}
