=== Risiko Management
Für das Projekt werden verschiedene Risiken identifiziert, die in der folgenden Matrix kategorisiert werden. Links ist die Eintrittswahrscheinlichkeit und oben die Auswirkung aufgeführt. Anschliessend werden die einzelnen Risiken beschrieben, sowie die Massnahmen, die ergriffen werden, um das Risiko zu minimieren. Nach jedem Sprint wird ausgewertet, ob die Risiken eingetreten sind und sie sich in der Matrix verschoben haben.

#figure(
	table(
		columns: (auto, auto, auto, auto, auto, auto),
		fill: (col, row) => {
			if col == 0 or row == 0 {white}
			else if (col == 1 and row >= 1 and row <= 3) or (col == 2 and (row == 1 or row == 2)) or (col == 3 and row == 1) {rgb(52, 173, 12)}
			else if (col == 1 and row == 4) or (col == 2 and row == 3) or (col == 3 and row == 2) or (col == 4 and row == 1) {rgb(134, 217, 67)}
			else if (col == 1 and row == 5) or (col == 2 and row == 4) or (col == 3 and row == 3) or (col == 4 and row == 2) or (col == 5 and row == 1) {yellow}
			else if (col == 2 and row == 5) or (col == 3 and row == 4) or (col == 4 and row == 3) or (col == 5 and row == 2) {rgb(245, 148, 12)}
			else if (col == 3 and row == 5) or (col == 4 and row == 4) or (col == 5 and row == 3) or (col == 4 and row == 5) or (col == 5 and row == 4) or (col == 5 and row == 5) {rgb(224, 29, 29)}
			else {white}
		},
		[], [*Niedrig*], [*Mittel*], [*Hoch*], [*Sehr hoch*], [*Kritisch*],
		[*Unmöglich*], [], [], [], [], [],
		[*Unwahrscheinlich*], [R1], [], [], [], [],
		[*Möglich*], [], [], [], [], [],
		[*Wahrscheinlich*], [], [], [], [], [],
		[*Sehr wahrscheinlich*], [], [], [], [], [],
	),
	caption: "Risikomatrix zu Beginn des Projektes",
)

#figure(
	table(
    columns: (auto, auto),
		align: left,
    [*Nummer*], [R1],
    [*Risiko*], [Panzerknacker überfallen Tresor],
    [*Auswirkung*], [Ganzes Geld ist weg],
    [*Massnahmen*], [Gute Fallen und Verteidigung aufstellen],
	),
	caption: "Risiko 1: Tresor wird von Panzerknacker überfallen",
)

==== Update nach Sprint 1
