# AutoCV
AutoCV is a **LaTeX document class** providing an **easy-to-use interface** for the making of **résumés** allowing users to **focus on formatting**.

## Using a template

### Basic example
Here is an example of how to use the tool with an AutoCV-compatible document class template.

```latex
% Use an AutoCV-compatible document class
\documentclass[9pt,a4paper]{altacv}

% Add basic information
\setfirstname{Dwight}
\setlastname{Schrute III}
\setjobtitle{Regional Manager}
\setabout{Whenever I'm about to do something, I think, "Would an idiot do that?"\\And if they would, I do not do that thing.}

% Add contact information
\addcontactinfo{location}{Scranton, PA}
\addcontactinfo{phone}{(570) 555-1212}

% Add section items
\addexperience{Regional Manager}{Dunder Mifflin}{May 2013 - present}{Scranton, PA}{
  \begin{itemize}
    \item Maintained the highest sales average, despite the weak economy and obsolete product.
    \item Managed, inspired, and protected the Scranton branch from criminals and raccoons.
    \item Led the office to obtain immeasurable success and glory.
  \end{itemize}
  \leavevmode
}
\addexperience{Assistant (to the) Regional Manager}{Dunder Mifflin}{Mar 2008 - Mar 2013}{Scranton, PA}{
  \begin{itemize}
    \item Closed more sales with revenues totaling more profit than any other employee – past, present, and future (projected).
    \item Served as self-appointed enforcer of The Rules (policies and procedures manual).
    \item Instituted "Schrute Bucks" reward system, immeasurably raising office morale.
  \end{itemize}
  \leavevmode
}
\addeducation{Business Administration}{Scranton University}{1992}{Scranton, PA}{}

% Make the document
\makecv
```

### Commands
Here is the list of commands available when using a template document class extending AutoCV.

#### Constant setters
| Command          | Description                          |
|:-----------------|:-------------------------------------|
| `\setfirstname`  | First name                           |
| `\setmiddlename` | Middle name                          |
| `\setlastname`   | Last name                            |
| `\setphoto`      | Relative path to a photo             |
| `\setabout`      | Text for a short profile description |

#### Section items
| Command                   | Arguments                                                      |
|:--------------------------|:---------------------------------------------------------------|
| `\addexperience`          | {`title`}{`organization`}{`period`}{`location`}{`description`} |
| `\addeducation`           | {`title`}{`organization`}{`period`}{`location`}{`description`} |
| `\addcertification`       | [`url`]{`name`}{`organization`}{`date`}                        |
| `\addskill`               | {`skill`}                                                      |
| `\addrecommendation`      | [`linkedin`]{`name`}{`text`}                                   |
| `\addcourse`              | {`name`}{`organization`}{`description`}                        |
| `\addaward`               | {`name`}{`organization`}{}{`description`}                      |
| `\addlanguageskill`       | {`language`}{`level`}                                          |
| `\addorganization`        | {`title`}{`organization`}{`period`}{`description`}             |
| `\addpatent`              | {`name`}{`number`}                                             |
| `\addpublication`         | {`title`}{`authors`}                                           |
| `\addproject`             | [`url`]{`name`}{`date`}{`description`}                         |
| `\addtestscore`           | {`name`}{`organisation`}                                       |
| `\addvolunteerexperience` | {`title`}{`organization`}{`period`}{`location`}{`description`} |

#### Contact information
Some templates may have support for quick access contact information tags. They can be added with the `\addcontactinfo` command:
```latex
\addcontactinfo{type}{value}
```
For instance:
```latex
\addcontactinfo{phone}{(570) 555-1212}
```
Available types of contact information depend on the considered AutoCV template.

#### Make the document
Once all the content is defined, don't forget to run `\makecv`!
