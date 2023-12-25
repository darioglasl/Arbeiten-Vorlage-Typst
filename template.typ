// The project function defines how your document looks.
// It takes your content and some metadata and formats it.
// Go ahead and customize it to your liking!
#let project(
  title: "",
  subtitle: "",
	university: "",
	semester: "",
	arbeit: "",
  bibliographyFilePath: "",
  abstract: [],
  managementSummary: [],
  authors: (),
  supervisors: (),
  industrialPartners: (),
  date: none,
  logoIndustrialPartner: none,
  ostLogo: none,
  enableOutlines: true,
  body,
) = {
  // Set the document's basic properties.
  set document(author: authors.map(a => a.name), title: title)
  
  set text(font: "Linux Libertine", lang: "de")
  show math.equation: set text(weight: 400)
  show link: underline
  
  set page(numbering: none)

  let headingFont = "Arial";

  show heading.where(level: 1): h => {
    v(50pt)
    align(right, text(size: 1.7em, font: headingFont, h))
  }
  show heading.where(level: 2): h => {
    text(size: 1.1em, font: headingFont, h)
  }
  show heading.where(level: 3): h => {
    text(size: 1.1em, font: headingFont, h)
  }
  show heading.where(level: 4): h => {
    text(size: 1.05em, font: headingFont, h)
  }

  // --- Title page ---   
  // Logos
  if logoIndustrialPartner != none and ostLogo != none {
    // TODO: align it properly
      grid(
        columns: (1fr, 1fr),
        gutter: 1em,
        image(logoIndustrialPartner, width: 65%),
        image(ostLogo, width: 100%),
      )
  }

  v(6fr)
  smallcaps(text(1.1em, [#date - #arbeit #semester]))

  v(0.6fr)
  text(2em, weight: 700, title)

  if subtitle != "" {
    v(0.3fr)
    text(1.3em, subtitle)
  }

  // Author information.
  pad(
    top: 1em,
    right: 16%,
    grid(
      columns: (1.3fr, 1fr, 1fr, 1fr),
      gutter: 2em,
			[#smallcaps("Studierende:")],
			..authors.map(author => align(start)[
				*#author.name* \
				#author.email
			]),
    ),
  )

	// Supervisor information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1.3fr, 3fr),
      gutter: 1em,
			[#smallcaps("Betreuer:")],
			..supervisors.map(sv => align(start)[
				*#sv.name* \
				#sv.email
			]),
    ),
  )

	// Industrial partner information.
  pad(
    top: 0.7em,
    right: 20%,
    grid(
      columns: (1.3fr, 3fr),
      gutter: 1em,
			[#smallcaps("Industrie-Partner:")],
			..industrialPartners.map(ip => align(start)[
				*#ip.name* \
				#ip.company \
				#ip.email
			]),
    ),
  )

  v(2.4fr)
  pagebreak()

  // --- Abstract page --- 
  set par(justify: true)
  set page(
    numbering: "I", 
    number-align: center,
		header: [
			#set text(10pt)
			#smallcaps(title)
			#h(1fr)	#text(date)
		]
	)
  counter(page).update(1)

  v(1fr)
  align(center)[
    #heading(
      outlined: false,
      numbering: none,
      bookmarked: true,
      text(0.85em, smallcaps[Abstract])
    )
  ]

  v(10pt)
  abstract
  
  v(1.618fr)
  pagebreak()

  // --- Management Summary page ---
  v(1fr)
  align(center)[
    #heading(
      outlined: false,
      numbering: none,
      bookmarked: true,
      text(0.85em, smallcaps[Management Summary]),
    )
  ]
  
  v(10pt)
  managementSummary

  v(1.618fr)
  pagebreak()

  // --- Table of contents --- 
  {
    show outline.entry.where(
      level: 1
    ): it => {
      v(12pt, weak: true)
      strong(it)
    }
    heading(outlined: false,numbering: none, bookmarked: true, [Inhaltsverzeichnis])
    outline(depth: 3, indent: true, title: none)
  }
  
  pagebreak()


  // --- Main body --- 
  set page(numbering: "1 / 1", number-align: center)
  set heading(numbering: "1.1", supplement: [Kapitel])

  body

  pagebreak()
  
  set heading(numbering: "A.1")
  counter(heading).update(0)

  // --- Outlines ---  
  if enableOutlines {
    heading("Glossar")
    include "glossar.typ"
  	pagebreak()

    heading("Tabellenverzeichnis")
    outline(title: none, target: figure.where(kind: table))
  	pagebreak()

    heading("Abbildungsverzeichnis")
    outline(title: none, target: figure.where(kind: image))
		pagebreak()

    heading("Codeverzeichnis")
    outline(title: none, target: figure.where(kind: "Code-Fragment"))
		pagebreak()
  }

  // Bibliography
  if bibliographyFilePath != "" {
    heading("Bibliographie")
    bibliography(bibliographyFilePath, title: none, style: "ieee")
		pagebreak()
  }

	include "Anhang/00_index.typ"
}