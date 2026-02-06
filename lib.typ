#let _clabels-ids = state("_clabels-ids", (:))
#let _clabels-styles = state("_clabels-styles", (:))
#let _get-counter(supplement) = counter("clabels-" + supplement)

// Set supplement IDs and optional styles
#let set-lbls(..mappings) = {
  _clabels-ids.update(current => {
    let result = current
    for item in mappings.pos() { result.insert(item.at(0), item.at(1)) }
    result
  })
  _clabels-styles.update(current => {
    let result = current
    for item in mappings.pos() {
      if item.len() >= 3 { result.insert(item.at(1), item.at(2)) }
    }
    result
  })
}

// Resolve supplement
#let _resolve-supplement(s) = {
  let ids = _clabels-ids.get()
  if s in ids { ids.at(s) } else { s }
}

// Get style for supplement
#let _get-style(supplement) = {
  let styles = _clabels-styles.get()
  styles.at(supplement, default: none)
}

#let _is-before(a, b) = a.page < b.page or (a.page == b.page and a.y < b.y)

#let lbl(supplement, name) = context {
  let supp = _resolve-supplement(supplement)
  _get-counter(supp).step()

  let figs-before = query(selector(figure).before(here())).filter(f => f.kind != "clabel-figure")
  let fig-idx = figs-before.len()
  [#metadata((supplement: supp, _clabel: true, _fig-idx: fig-idx)) #label(name)]
}

// Initialize
#let clabels-init(body) = {
  show figure: it => {
    if it.kind == "clabel-figure" { return it }
    
    context {
      let fig-loc = here()

      let figs-before = query(selector(figure).before(fig-loc)).filter(f => f.kind != "clabel-figure")
      let my-idx = figs-before.len()
      
      // Find clabel with matching figure index
      let clabels = query(metadata).filter(m => 
        type(m.value) == dictionary and m.value.at("_clabel", default: false)
      )
      
      let my-clabel = clabels.filter(cl => cl.value.at("_fig-idx", default: -1) == my-idx)
      
      if my-clabel.len() == 0 { return it }
      
      let cl = my-clabel.first()
      let supp = cl.value.supplement
      let num = _get-counter(supp).at(cl.location()).first()
      
      counter(figure.where(kind: image)).update(n => n - 1)
      figure(
        it.body,
        caption: it.caption,
        supplement: supp,
        numbering: _ => str(num),
        placement: it.placement,
        gap: it.gap,
        kind: "clabel-figure",
        outlined: false,
      )
    }
  }
  
  show ref: it => {
    if it.element == none or it.element.func() != metadata { return it }
    let data = it.element.value
    if type(data) != dictionary or not data.at("_clabel", default: false) { return it }
    
    context {
      let num = _get-counter(data.supplement).at(it.element.location()).first()
      let style = _get-style(data.supplement)
      
      if style != none {
        link(it.target)[#text(..style)[#data.supplement #num]]
      } else {
        link(it.target)[#data.supplement #num]
      }
    }
  }
  
  body
}
