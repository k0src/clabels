#import "../lib.typ": *

#show: clabels-init

#set-lbls(
  ("gr", "Graph", (fill: blue, weight: "bold")),
  ("cd", "Code Example", (fill: red, style: "italic")),
  ("img", "Image"), 
)

#figure(
  rect(width: 100pt, height: 60pt, fill: blue.lighten(80%))[Graph],
  caption: [A graph]
) #lbl("gr", "graph-1")

#figure(
  rect(width: 100pt, height: 60pt, fill: yellow.lighten(80%))[Figure 1],
  caption: [A normal figure]
) <fig>


#figure(
  rect(width: 100pt, height: 60pt, fill: green.lighten(80%))[Code],
  caption: [Code]
) #lbl("cd", "code-1")

#figure(
  rect(width: 100pt, height: 60pt, fill: blue.lighten(80%))[Another Graph],
  caption: [Another graph]
) #lbl("gr", "graph-2")

#figure(
  rect(width: 100pt, height: 60pt, fill: blue.lighten(80%))[Another Graph],
  caption: [Another graph]
) #lbl("img", "graph-3")

== Refs

- @graph-1 - "Graph 1" (blue, bold)
- @code-1 - "Code Example 1" (red, italic)
- @graph-2 - "Graph 2" (blue, bold)
- @fig
- @graph-3