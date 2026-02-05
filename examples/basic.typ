#import "../lib.typ": *

#show: clabels-init

#figure(
  rect(width: 100pt, height: 60pt, fill: blue.lighten(80%))[Graph 1],
  caption: [A simple graph]
) #lbl("Graph", "simple-graph")

#figure(
  rect(width: 100pt, height: 60pt, fill: yellow.lighten(80%))[Figure 1],
  caption: [A normal figure]
) <fig>

#figure(
  rect(width: 100pt, height: 60pt, fill: green.lighten(80%))[Graph 2],
  caption: [A directed graph]
) #lbl("Graph", "dir-graph")

#figure(
  caption: "text figure",
  [text]
) <fig2>

#figure(
  rect(width: 100pt, height: 60pt, fill: red.lighten(80%))[Code 1],
  caption: [Some code]
) #lbl("Code", "my-code")

#figure(
  caption: "listing",
  ```
  code
  ```
) <fig3>

== Refs

- @simple-graph - "Graph 1"
- @fig - "Figure 1"
- @fig2 - "Figure 2"
- @dir-graph - "Graph 2"  
- @my-code - "Code 1"
- @fig3 - "Listing 1"
