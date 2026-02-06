**clabels** is a simple Typst package that allows you to give custom supplement labels to figures that auto-increment based on the supplement name.

![clabels example](example.png)

### Import & Setup

Import `clabels` and use the `show` rule to enable the package.

```typ
#import "@preview/clabels:0.1.0": *

#show: clabels-init
```

### Usage

Use the `lbl` function, with the supplement name or ID, followed by the label name.

```typ
#figure(image("graph.png")) #lbl("Graph", "my-graph")
#figure(image("code.png")) #lbl("Code", "my-code")
#figure(image("graph2.png")) #lbl("Graph", "another-graph")

@my-graph       // Graph 1
@my-code        // Code 1
@another-graph  // Graph 2
```

Define short IDs and optional reference styling:

```typ
#set-lbls(
  ("gr", "Graph"),
  ("cd", "Code", (fill: red, style: "italic")),
)

#figure(...) #lbl("gr", "my-graph")  // Graph 1
#figure(...) #lbl("cd", "my-code")   // Code 1 (red, italic)
```

### License

MIT
