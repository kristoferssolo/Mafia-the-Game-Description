#import "@preview/tablex:0.0.6": tablex
#import "@preview/big-todo:0.2.0": todo as TODO

#let custom-block(item) = {
  set align(start)
   block(
    inset: 8pt,
    stroke: black,
    width: 100%,
    spacing: 0pt,
    breakable: true,
    item
  )
}

#let longtable(
  title: "",
  titles: (),
  caption: "",
  ..items
) = {
  set par(first-line-indent: 0pt)
  figure(
    gap: 1.5em,
    kind: table,
    caption: if caption != ""{
        caption
      } else {
        if titles.len() == 0 {
          title
        } else {
          titles.first()
        }
      },
    [
      #if titles.len() == 0 {
        custom-block(text(weight: "bold", title))
      }
      #for i in range(items.pos().len()) {
        if titles.len() > 0 {
          custom-block(text(weight: "bold", titles.at(i)))
        }
        custom-block(items.pos().at(i))
      }
    ]
  )
  linebreak()
}

#let parameter-table(caption: "", ..items) = {
  if caption == "" {
    caption = items.pos().first()
  }
  longtable(
    titles: ("Parametra nosaukums", "Parametra identifikators", "Parametra apraksts", "Parametra prasības", "Parametra piemērs (/-i)"),
    caption: caption,
    ..items
  )
} 

#let procedure-table(caption: "", ..items) = {
  if caption == "" {
    caption = items.pos().first()
  }
  longtable(
    titles: ("Procedūras nosaukums", "Procedūras identifikators", "Procedūras apraksts", "Ievade", "Apstrāde", "Izvade"),
    caption: caption,
    ..items
  )
}

#let function-table(caption: "", ..items) = {
  if caption == "" {
    caption = items.pos().first()
  }
  longtable(
    titles: ("Funkcijas nosaukums", "Funkcijas identifikators", "Ievads", "Ievade", "Apstrāde", "Izvade", "Paziņojumi",),
    caption: caption,
    ..items
  )
}


#let entity-table-row(..items) = {
  (
    items.pos().at(0),
    upper(raw(items.pos().at(1), block: false)),
    upper(raw(items.pos().at(2), block: false)),
    items.pos().at(3)
  )
}

#let entity-table(caption: "", id: (), ..items) = {
  if id == () {
    id = ("id", "serial8", "primary key, not null", "Unikālais identifikators")
  }
  
  figure(
    caption: caption,
    kind: table,
    tablex(
      columns: (4cm, 3cm, auto, auto),
      repeat-header: true,
      /* Header */
      [*Lauks*], [*Datu tips*], [*Lauka atribūti*], [*Apraksts*], 

      ..entity-table-row(..id), // id row

      ..for i in range(items.pos().len(), step:4){
        entity-table-row(..items.pos().slice(i, i+4))
      },
    )
  )
}

#let todo(..body) = {
  TODO(..body, inline: true, big_text: 14pt, small_text: 12pt)
}

#let hyperlink-source(author, title, link_str, date) = {
  if link_str == "" {
    [#author #title Aplūkots #date.display("[day].[month].[year]")]
  } else {
    [#author #title Pieejams: #link(link_str) aplūkots #date.display("[day].[month].[year]")]
  }
}
