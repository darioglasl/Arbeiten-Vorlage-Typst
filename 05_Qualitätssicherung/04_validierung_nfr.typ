#import "../Helpers/nfr-data.typ": nfrScenarios

== Validierung von NFRs <headingNfrValidation>>
Die Validation der Non Functional Requirements ist durch die Entwickler und den Review Prozess sichergestellt.

Die nicht funktionalen Anforderungen sind in @headingNfrs beschrieben.

Folgende Tabellen beschreiben den abschliessenden Status der NFRs.
#let n = 0

#while n < nfrScenarios.len() {
  let number = n + 1
  let title = if n < 10 {
    [NFR-0#number]
  } else {
    [NFR-#number]
  }

  figure(
    table(
      columns: (16%, 84%),
      inset: (x: 5pt, y: 4pt),
      align: left,
      fill: (_, row) => if calc.odd(row) { luma(225) } else { white },
      [*ID*], [*#title* #nfrScenarios.at(n).titel],
      [Anforderung], [#nfrScenarios.at(n).anforderung],
      [Level], [#nfrScenarios.at(n).level],
      [Status], [*#nfrScenarios.at(n).status*],
      [Begründung], [#nfrScenarios.at(n).begründung],
    ),
    caption: [Validierung #title #nfrScenarios.at(n).anforderung],
  )
  n = n + 1
}