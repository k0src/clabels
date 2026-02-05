#let _clabels-ids = state("_clabels-ids", (:))
#let _get-counter(supplement) = counter("clabels-" + supplement)

// Set supplement IDs
#let set-lbl-ids(..mappings) = {
  _clabels-ids.update(current => {
    let result = current
    for pair in mappings.pos() { result.insert(pair.at(0), pair.at(1)) }
    result
  })
}

// Resolve supplement
#let _resolve-supplement(s) = {
  let ids = _clabels-ids.get()
  if s in ids { ids.at(s) } else { s }
}

#let _is-before(a, b) = a.page < b.page or (a.page == b.page and a.y < b.y)

#let lbl(supplement, name) = context {
  let supp = _resolve-supplement(supplement)
  _get-counter(supp).step()
  [#metadata((supplement: supp, _clabel: true)) #label(name)]
}

// Initialize
#let clabels-init(body) = {
  show figure: it => {
    if it.kind == "clabel-figure" { return it }
    
    context {
      let fig-pos = here().position()
      
      // Find all clabels after this figure
      let clabels = query(metadata).filter(m => 
        type(m.value) == dictionary and m.value.at("_clabel", default: false)
      )
      let clabels-after = clabels.filter(cl => _is-before(fig-pos, cl.location().position()))
      
      if clabels-after.len() == 0 { return it }
      
      let target-clabel = clabels-after.first()
      let cl-pos = target-clabel.location().position()
      
      // Find the figure closest before this clabel
      let figures = query(figure).filter(f => 
        f.kind != "clabel-figure" and _is-before(f.location().position(), cl-pos)
      )
      
      if figures.len() == 0 { return it }
      
      let owner-pos = figures.last().location().position()
      
      // Transform if this figure owns that clabel
      if owner-pos.page != fig-pos.page or calc.abs(owner-pos.y - fig-pos.y) >= 1pt { return it }
      
      let supp = target-clabel.value.supplement
      let num = _get-counter(supp).at(target-clabel.location()).first()
      
      counter(figure.where(kind: image)).update(n => n - 1)
      figure(
        it.body,
        caption: it.caption,
        supplement: supp,
        numbering: _ => str(num),
        placement: it.placement,
        gap: it.gap,
        kind: "clabel-figure",
      )
    }
  }
  
  show ref: it => {
    if it.element == none or it.element.func() != metadata { return it }
    let data = it.element.value
    if type(data) != dictionary or not data.at("_clabel", default: false) { return it }
    
    let num = context _get-counter(data.supplement).at(it.element.location()).first()
    link(it.target)[#data.supplement #num]
  }
  
  body
}
