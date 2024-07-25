#import "@preview/i-figured:0.1.0"
#import "@preview/big-todo:0.2.0": *
#import "@preview/tablex:0.0.6": tablex

#let indent = 1cm
#let indent-par(
  body,
) = par(h(indent) + body)

#let project(
  university: "",
  faculty: "",
  title: [],
  authors: (),
  advisor: "",
  date: "",
  body,
) = {
  set document(author: authors)

  set page(
    margin: (
      left: 30mm,
      right: 20mm,
      top: 20mm,
      bottom: 20mm,
    ),
    number-align: center,
    paper: "a4",
  )
  set text(
    //font: "New Computer Modern",
    font: "CMU", size: 12pt, hyphenate: auto, lang: "lv", region: "LV",
  )
  show raw: set text(font: "New Computer Modern Mono")

  show math.equation: set text(weight: 400)

  // Formatting for regular text
  set par(
    justify: true,
    leading: 1.5em,
    first-line-indent: indent,
  )
  show par: set block(spacing: 1.5em) // Set 1.5em gap between paragraphs
  show heading: set block(spacing: 1.5em)
  set terms(separator: [ -- ])

  // Headings
  set heading(numbering: "1.1.")
  show heading: it => {
    if it.level == 1 {
      // pagebreak(weak: true)
      text(
        14pt,
        align(
          center,
          upper(it),
        ),
      )
    } else {
      it
    }
  }

  /* Title page config start */
  align(
    center,
    upper(
      text(
        size: 16pt,
        [
          #university\
          #faculty
        ],
      ),
    ),
  )

  v(1fr)

  align(
    center,
    text(
      20pt,
      weight: "bold",
      title,
    ),
  )

  v(1fr)

  // Author information
  align(
    right,
    [
      #if authors.len() > 1 {
        text(
          weight: "bold",
          "Darba autori:",
        )
      } else {
        text(
          weight: "bold",
          "Darba autors:",
        )
      }\
      #authors.join("\n")

      #v(2em)

      #if advisor != "" {
        text(
          weight: "bold",
          "Darba vadītājs:\n",
        )
        advisor
      }
    ],
  )

  v(0.5fr)

  align(
    center,
    upper(
      text(date),
    ),
  )
  /* Title page config end */

  // WARNING: removove before sending
  // todo_outline

  /* --- Figure/Table conf start --- */
  show heading: i-figured.reset-counters
  show figure: i-figured.show-figure.with(numbering: "1.1.")

  show figure.where(kind: "i-figured-table"): set block(breakable: true)
  show figure.where(kind: "i-figured-table"): set figure.caption(position: top)

  show figure: set par(justify: false) // disable justify for figures (tables)

  show figure.caption: it => {
    if it.kind == "i-figured-table" {
      align(
        end,
        emph(it.counter.display(it.numbering) + " tabula ") + text(
          weight: "bold",
          it.body,
        ),
      )
    } else if it.kind == "i-figured-image" {
      align(
        start,
        emph(it.counter.display(it.numbering) + " att. ") + text(
          weight: "bold",
          it.body,
        ),
      )
    } else {
      it
    }
  }

  set ref(supplement: it => { }) // disable default reference suppliments
  /* --- Figure/Table conf end --- */

  set list(marker: (
    [•],
    [--],
    [\*],
    [·],
  ))
  set enum(numbering: "1aiA)") // TODO: make the same style as LaTeX: 1. | (a) | i. | A.

  // Abstract
  include "abstract.typ"

  /* ToC config start */
  // Uppercase 1st level headings in ToC
  show outline.entry.where(level: 1): it => {
    upper(it)
  }

  pagebreak()
  outline(
    depth: 3,
    indent: 1cm,
    title: text(
      size: 14pt,
      "SATURS",
    ),
  )
  /* ToC config end */

  // Start page numering
  set page(
    numbering: "1",
    number-align: center,
  )

  // Main bdy.
  body
}
