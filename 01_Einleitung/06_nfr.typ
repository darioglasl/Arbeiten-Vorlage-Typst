#import "../Helpers/nfr-data.typ": nfrScenarios
== Non Functional Requirements (NFR) <headingNfrs>

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
      [Szenario], [#nfrScenarios.at(n).szenario],
      [Stimulus], [#nfrScenarios.at(n).stimulus],
      [Reaktion], [#nfrScenarios.at(n).reaktion],
      [Massnahme], [
        #for measure in nfrScenarios.at(n).massnahme [
          #measure 
        ]
      ],
      [Level], [#nfrScenarios.at(n).level],
    ),
    caption: [#title #nfrScenarios.at(n).anforderung],
  )
  n = n + 1
}