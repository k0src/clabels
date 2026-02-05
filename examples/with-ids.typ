#import "../lib.typ": *

#show: clabels-init

#set-lbl-ids(
  ("gr", "Graph"),
  ("cd", "Code Example"),
  ("img", "Image"),
)

#figure(
  rect(width: 100pt, height: 60pt, fill: blue.lighten(80%))[Graph],
  caption: [A graph]
) #lbl("gr", "graph-1")

#figure(
  rect(width: 100pt, height: 60pt, fill: green.lighten(80%))[Code],
  caption: [Code]
) #lbl("cd", "code-1")

#figure(
  rect(width: 100pt, height: 60pt, fill: blue.lighten(80%))[Another Graph],
  caption: [Another graph]
) #lbl("gr", "graph-2")

== Refs

- @graph-1 - "Graph 1"
- @code-1 - "Code Example 1"
- @graph-2 - "Graph 2"
