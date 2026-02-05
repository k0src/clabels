#import "../lib.typ": *

#show: clabels-init

#set page(
  paper: "us-letter",
  margin: (
    top: 6em, 
    right: 6em, 
    bottom: 6.5em, 
    left: 6em
  )
)

#show raw: set text(font: "Fira Code", size: 1.05em)
#set text(font: "Inter 24pt", size: 10pt)

#set-lbls(
  ("gr", "Graph"),
  ("ch", "Chart"),
  ("img", "Image", (fill: blue)),
  ("cd", "Code", (fill: red, style: "italic")),
)

= clabels Example

== Auto-Incrementing Counters

#align(center, [
  #v(1em)
  #grid(
    columns: 3,
    column-gutter: 1em,
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: blue.lighten(80%))[Graph A],
        caption: [First graph]
      ) #lbl("Graph", "graph-1")
    ],
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: red.lighten(80%))[Chart A],
        caption: [A chart]
      ) #lbl("Chart", "chart-1")
    ],
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: blue.lighten(80%))[Graph B],
        caption: [Second graph]
      ) #lbl("Graph", "graph-2")
    ]
  )
])

*References:* 
- @graph-1
- @chart-1
- @graph-2

== Use with Regular Figures

#align(center, [
  #v(1em)
  #grid(
    columns: 2,
    column-gutter: 1em,
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: purple.lighten(80%))[Figure],
        caption: [A regular figure]
      ) <fig>
    ],
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: blue.lighten(80%))[Graph C],
        caption: [Third graph]
      ) #lbl("Graph", "graph-3")
    ]
  )
])

*References:*
- @fig (Figure 1)
- @graph-3 (Graph 3)

== Styling

#align(center, [
  #v(1em)
  #grid(
    columns: 3,
    column-gutter: 1em,
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: green.lighten(80%))[Code A],
        caption: [Using `cd` ID]
      ) #lbl("cd", "code-1")
    ],
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: orange.lighten(80%))[Image A],
        caption: [Using `img` ID]
      ) #lbl("img", "image-1")
    ],
    [
      #figure(
        rect(width: 80pt, height: 50pt, fill: green.lighten(80%))[Code B],
        caption: [Using `cd` ID]
      ) #lbl("cd", "code-2")   
    ]
  )
])

*References:*
- @code-1 (red italic)
- @image-1 (blue)
- @code-2 (red italic)
