// ----------------------------------------------------------------------------
// "THE BEER-WARE LICENSE" (Revision 42):
// <dario.glasl@ost.ch> wrote this file.  As long as you retain this notice you can do whatever you want with this stuff. If we meet some day, and you think this stuff is worth it, you can buy me a beer in return.   Poul-Henning Kamp
// ----------------------------------------------------------------------------

#import "template.typ": *

#show: project.with(
  title: "SA / BA Vorlage",
  bibliographyFilePath: "bibliography.yml",
  logoIndustrialPartner: "Images/Logos/placeholder-image-square.jpg",
  ostLogo: "Images/Logos/OST_Logo_DE_RGB_Schutz.svg",
  subtitle: "Die Typst Vorlage zu deiner Arbeit",
	university: "OST - Ostschweizer Fachhochschule",
	arbeit: "Studienarbeit",
	semester: "Herbstsemester 2023/24",
  authors: (
    (name: "Max Muster", email: "max.muster@ost.ch"),
    (name: "Anna Abc", email: "anna.abc@ost.ch"),
  ),
	supervisors:(
    (name: "Prof. Dr. Daniel Düsentrieb", email: "dani.duesen@ost.ch"),
	),
	industrialPartners:(
    (name: "Dagobert Duck", email: "dagobert@duck.ch", company: "Duck Incl."),
	),
  abstract: [#include "abstract.typ"],
  managementSummary: [#include "management_summary.typ"],
  date: datetime.today().display("[day].[month].[year]"),
)

#counter(page).update(1)

= Einleitung <headingIntroduction>
#include "01_Einleitung/00_index.typ"
#pagebreak()

= Analyse <headingAnalysis>
#include "02_Analyse/00_index.typ"
#pagebreak()

= Konzept <headingConcept>
#include "03_Konzept/00_index.typ"
#pagebreak()

= Ausführung <headingExecution>
#include "04_Ausfuehrung/00_index.typ"
#pagebreak()

= Qualitätssicherung <headingQualityAssurance>
#include "05_Qualitätssicherung/00_index.typ"
#pagebreak()

= Ergebnisdiskussion mit Ausblick <headingResults>
#include "06_Ergebnisse/00_index.typ"
