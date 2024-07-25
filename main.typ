#import "layout.typ": project, indent-par
#import "@preview/i-figured:0.1.0"
#import "@preview/tablex:0.0.6": tablex, rowspanx, colspanx, cellx
#import "utils.typ": *


#show: project.with(
  university: "Latvijas Universitāte",
  faculty: "Datorikas fakultāte",
  title: [Tiešsaistes spēles sistēma "Mafija"\ Praktiskais darbs programminžinierijā],
  authors: (
    "Alens Aleksandrs Čerņa, ac22065",
    "Kristiāns Francis Cagulis, kc22015",
    "Ernests Gustavs Dane, eg22086",
    "Miķelis Kukainis, mk22092",
    "Jorens Štekeļs, js21283",
  ),
  advisor: "prof. Dr. sc. comp. Laila Niedrīte",
  date: "Rīga 2024",
)


#set heading(numbering: none)

#pagebreak(weak: true)
= Apzīmējumu saraksts

#par(
  first-line-indent: 0cm,
  [
    / API: lietojumprogrammu saskarne (angl. Application Program Interface);
    / Abonements: uz noteiktu laiku par maksu piešķirtās papildus lietotāja iespējas;
    / BCNF: Boisa-Kodda normālforma (angl. Boyce–Codd normal form) izmanto datu bāzu normalizācijā;
    / CSRF: Starpvietņu pieprasījuma viltošana (angl. Cross-Site Request Forgery) -- uzbrukuma veids, kurā ļaunprātīgi pieprasījumi tiek izsūtīti no lietotāja pārlūka, izmantojot lietotāja autentifikācijas datus;
    / DPD: datu plūsmas diagramma;
    / Dialogs: lietotāja saskarnes elements, kas parāda ziņojumu un piedāvā lietotājam vienu vai vairākas iespējas, kuras izvēlēties;
    / Docker/Konteineris: ir platforma, kas izmanto operētājsistēmas līmeņa virtualizāciju, lai piegādātu programmatūru;
    / ER modelis: entitāšu saišu modelis (angl. Entity-Relationship model);
    / GDPR: vispārīgā datu aizsardzības regula (angl. General Data Protection Regulation) -- Eiropas Savienības regula, kas nosaka kā jāapstrādā un jāaizsargā personu dati;
    / HTTP: hiperteksta pārsūtīšanas protokols (angl. Hypertext Transfer Protocol) -- protokols datu pārsūtīšanai tīmeklī, galvenokārt izmantojot tīmekļa lapas;
    / IP adrese: Interneta protokola adrese (angl. Internet Protocol address) -- unikāls numurs, kas tiek piešķirts katrai ierīcei, kas ir savienota ar datoru tīklu, kas izmanto IP komunikāciju;
    / Istaba (spēles istaba): lietotāju kopa, kas ir saistīti vienas spēles ietvaros, i.e., spēles instance;
    / Izvairīšanās simboli: izvairīšanās simboli (angl. escape symbols vai escape characters) ir īpaši simboli, kas ļauj iekļaut teksta virknēs simbolus, kuri parasti ir rezervēti citām funkcijām;
    / Karodziņš: Būla mainīgais, i.e., mainīgais, kas var būt patiess vai nepatiess;
    / Klienta identifikators: maksājumu apstrādātāja uzglabāts identifikators, kas ir saistīts ar sistēmas lietotāju;
    / Komandu injekcija: drošības uzbrukuma veids, kurā uzbrucējs var izpildīt ļaunprātīgas komandas sistēmā, izmantojot drošības nepilnības;
    / Loma (spēles loma): spēlēs loma, kam piemīt noteiktas darbības un mērķis;
    / Maksas siena: maksājums par lietotāju pieeju daļai no sistēmas piedāvātās funkcionalitātes;
    / PNG: portatīvā tīkla grafika (angl. Portable Network Graphics) ir rastra grafikas failu formāts, kas atbalsta datu saspiešanu bez zudumiem;
    / PPA: programmatūras projektējuma apraksts;
    / PPS: programmatūras prasību specifikācija;
    / PostgreSQL: ir atvērtā koda objektu-relationālās datu bāzes pārvaldības sistēma, kas atbalsta plašu strukturētas vaicājumu valodas funkcionalitāti;
    / SQL injekcija: drošības apdraudējums, kas rodas, kad uzbrucējs var ievietot vai "injicēt" SQL komandas datu bāzes vaicājumā, tādējādi mainot tā darbību vai izgūstot konfidenciālu informāciju;
    / SQL: strukturēta vaicājumu valoda (angl. val. Structured Query Language) ir standartizēta programmēšanas valoda, kas ir plaši izmantojama datu bāzu pārvaldībai;
    / Sanitizēšana: Datu vai ievades apstrāde, lai noņemtu vai neitralizētu potenciāli kaitīgus vai nevēlamus elementus;
    / Sistēmas loma: sistēmas lietotāju grupa ar noteiktām privilēģijām;
    / Skripts: Automatizēta instrukciju virkne, kas izpilda noteiktas darbības programmēšanas vai sistēmas vidē;
    / Spēlētājs: lietotāja ieraksts vienas virtuālās istabas kontekstā;
    / Sāls pievienošana: Drošības metode, kurā pirms paroles jaucējfunkcijas izmantošanas tai tiek pievienots nejaušs simbolu virknes fragments, lai padarītu paroles atšifrēšanu sarežģītāku;
    / UTC: saskaņotais pasaules laiks (angl. Coordinated Universal Time) -- starptautisks, ļoti precīzs un stabils laika noteikšanas standarts;
    / UTF8: Vienota teksta formāta kodējums 8-bitu garumā (angl. Unicode Transformation Format -- 8 bit) -- populārs teksta kodējums, kas atbalsta visu pasaules valodu rakstzīmes;
    / XSS: Starpvietņu skriptēšana (angl. Cross-Site Scripting) -- drošības uzbrukuma veids, kurā uzbrucēji ievieto ļaunprātīgus skriptus tīmekļa lapā, kas tiek izpildīti citu lietotāju pārlūkos.
  ],
)

#pagebreak(weak: true)
= Ievads

== Nolūks

#indent-par([
  Šī dokumenta mērķis ir raksturot tiešsaistes sistēmas "Mafija" programmatūras prasības. Sistēma ir paredzēta individuāliem lietotājiem, kuru interesēs ir iesaistīties savstarpējā sociālā aktivitātē lomu spēles formātā.
])

== Darbības sfēra
#indent-par([
  Sistēma "Mafija" ir atvasināta no plaši pazīstamas sociālas lomu spēles, kas balstīta uz dedukciju. Spēlē piedalās indivīdi -- spēlētāji. Tiem piešķirtas lomas, kas pieder kādai lomu grupai. Lomu grupa "Ciems" cenšas izdibināt kuri ir lomu grupas "Mafija" locekļi. Mafijas mērķis ir radīt haosu ciema iedzīvotāju vidū un pakāpeniski izslēgt ciema iedzīvotājus no spēles, izmantojot stratēģisku manipulāciju un iedalītās lomas darbības. Spēlētāji, kuri nav ietverti ne "Ciems", ne "Mafija" lomu grupā cenšas sasniegt tiem iedalītās lomas mērķi. Tikai "Mafijas" locekļiem ir informācija par to, kuri no spēlētāju loka pieder "Mafija" lomu grupai. Katram spēlētājam jāizmanto individuāla ierīce, kas var pieslēgties tīmeklim, lai pieteiktos sistēmā, pievienotos konkrētai spēlei un tajā piedalītos.
])

Katra spēlētāja ierīcē spēles sesijas laikā tiek parādīta informācija par iedalīto lomu un ar to saistītajām, pieejamajām darbībām. Informāciju nav paredzēts vai atļauts rādīt citiem spēlētājiem. Sistēmas vizuālā saskarne ietver informāciju par spēles aktuālo stāvokli, precīzāk, fāzi (diena, nakts vai balsošana), spēles ilgumu, palikušo spēlētāju skaitu un citiem spēli raksturojošiem faktoriem.

Spēlētāja darbību klāsts ir atkarīgs no iedalītās lomas un aktuālā spēles stāvokļa. Spēles organizatoram (maksas lietotājam) ir iespēja izveidot virtuālu istabu un pielāgot tās uzstādījumus, lai mainītu to uzstādījumu, kas ietver noteiktās lomas, kā arī mainīt un veidot jaunas lomas. Maksas lietotājs spēj izveidot jaunas lomas ar kādu darbību kombināciju, ko, savukārt, var izmantot spēles uzstādījumos, kas ir kombinācijas no lomām -- gan pamata izveidotām, gan citu lietotāju (publiski) izveidotām.

Katram spēlētājam tiek nodrošināta sinhronizēta informācija par spēles stāvokli un pieejamajām darbībām, tai skaitā, paziņojumi par spēles stāvokļa izmaiņām.

Ārpus spēles sesijas, lietotājiem ir pieejams spēļu istabu saraksts, kas var ietvert gan atvērtas, gan privātas virtuālās spēļu telpas, un lietotāja profils, kurā var rediģēt lietotāju raksturojošo informāciju.

// Explain customization of the roles / setups

== Saistība ar citiem dokumentiem

#indent-par([
  PPS ir izstrādāta, ievērojot LVS 68:1996 "Programmatūras prasību specifikācijas ceļvedis" un LVS 72:1996 "Ieteicamā prakse programmatūras projektējuma aprakstīšanai" standarta prasības.
])

== Pārskats

#indent-par([
  Dokumenta ievads satur tā nolūku, izstrādājamās programmatūras skaidrojumu, vispārīgu programmatūras mērķi un funkciju klāstu, saistību ar citiem dokumentiem, kuru prasības tika izmantotas dokumenta izstrādāšanas gaitā, kā arī pārskatu par dokumenta daļu saturu ar dokumenta struktūras skaidrojumu.
])

Pirmajā nodaļa tiek aprakstīti faktori, kas var ietekmēt produktu un tā prasības. Nodaļā tiek pamatota programmatūras izstrādes motivācija un nolūks, aprakstītas produkta vieta citu sistēmu perspektīvā, galvenās augsta līmeņa darījumprasības, sistēmas lietotāju grupu lomas un mērķi, kā arī tiek uzskaitīti faktori, kas var ierobežot vai ietekmēt programmatūras prasību specifikāciju.

Otrajā nodaļā tiek norādītas konkrētas prasības, kas satur visu nepieciešamo programmatūras projektējuma veidošanai. Tā ietver: datu bāzes konceptuālo modeli, funkcionālās prasības, kas apraksta sistēmas funkciju sadalījumu pa moduļiem, arējās saskarnes prasības un sistēmas vispārējās prasības.

Trešajā nodaļā tiek aprakstīta daļa no projektējuma. Nodaļa satur datu bāzes projektējumu - datubāzes loģisko modeli, fizisko modeli un tā lauku aprakstu -, dažu funkciju projektējumu diagrammas un dažu lietotāju saskarņu ekrānskatus.

#set heading(numbering: "1.1.")

= Vispārējais apraksts

== Esošā stāvokļa apraksts

#indent-par([
  Tirgū pastāv vairākas sistēmas un citi programmatūras formāti, piemēram, lietotnes, kas piedāvā dažādas lomu spēļu variācijas, to skaitā, "Warewolf online", "Town of Salem", "Mafia.gg", "BeyondMafia", "Mafia: The Game" un daudzi citi. Esošiem risinājumiem ir vairākas problēmas: maksas piekļuve, pārmērīgs iespēju skaits, kas ir pieejamas tikai par maksu, spēle ir pieejama tikai uz mobilā viedtālruņa. "Mafija" īstenos svarīgākās no esošo spēļu iespējām un pievienos jaunas iespējas, kas papildinās un uzlabos lietotāju pieredzi, kā arī samazinās maksas funkciju īpatsvaru.
])

== Pasūtītājs

#indent-par([
  Sistēma nav izstrādāta pēc konkrēta pasūtītāja pieprasījuma, tā ir raksturota un projektēta ar iespēju realizēt pēc studentu grupas iniciatīvas programminženierijas kursa ietvaros.
])

== Produkta perspektīva

#indent-par([
  Sistēmā tiek integrēti vai izmantoti citu uzņēmumu un izstrādātāju piedāvāti pakalpojumi. Produkta realizācijā ir paredzēts izmantot maksājumu apstrātāja un e-pasta pakalpojumu sniedzēja pakalpojumus, kamēr tie atbilst sistēmas pieprasītajai funkcionalitātei un piedāvā optimālākos, kā arī drošākos un efektīvākos risinājumus tirgū.
])

Maksājumu apstrādātājs realizēs lietotāju maksas pakalpojumu iegādi konkrētu papildus funkciju iegūšanai uz noteiktu laiku. Informācija par abonementiem tiek glabāta galvenokārt ārpus sistēmas. Tiks izmantota pakalpojumu sniedzēja nodrošināta maksājumu apstrāde ārpus "Mafija" sistēmas, sistēmā glabājot minimālu informāciju par maksājumu, tas ir, klienta identifikatoru, ko sagatavo maksājumu pakalpojuma sniedzējs. E-pasta apstiprināšanas un paroles atjaunošanas e-pastu izsūtīšanai tiks izmantots e-pasta pakalpojumu sniedzējs.

== Darījumprasības

#indent-par([
  Sistēmā tiks realizētas sekojošās darījumprasības:
  + Lietotāju reģistrācija, autentifikācija;
  + Lietotāju un to kontu pārvalde;
  + Lietotāju kontu apstiprināšana, izmantojot e-pastu;
  + Lietotāju profilu personalizācija un kontu rediģēšana;
  + Lietotāju stāvokļa virtuālajās telpās uzturēšana un izmaiņa;
  + Spēles automātiska vadība;
  + Lietotāju informēšana, izmantojot paziņojumu sistēmu;
  + Sinhronizēta spēles stāvokļa atjaunināšana;
  + Spēles uzstādījumu un lomu veidošana, rediģēšana un dzēšana;
  + Atvērtās un privātās virtuālās spēles istabas;
  + Kopēja un ierobežota (spēles lomu grupu atkarīga) tērzēšana;
  + Privilēģiju izmaiņa, izmantojot bezpersonisku maksājumu sistēmu;
  // Isn't it similar wo the 2nd?
  + Lietotāju administrēšana administratoru lietotāju grupai.
])

== Sistēmas lietotāji

#indent-par([
  Neautentificēts lietotājs (viesis), i.e., viesis ir jebkurš lietotājs, kas nav pieteicies vai reģistrējies sistēmā. Šiem lietotājiem ir pieejamas funkcijas, lai reģistrētos vai pieteiktos sistēmā;
])

Kad lietotājs ir pieteicies un ir autentificēts, tam ir pieejamas reģistrēta lietotāja grupas tiesības, precīzāk, darbības, kas saistītas ar spēli, profilu un konta pārvaldi. Tā būs vislielākā grupa pēc lietotāju skaita. Maksas lietotājiem, precīzāk, reģistrētiem lietotājiem, kuriem piesaistīts aktīvs abonements, tiek piešķirtas papildus tiesības -- izveidot jaunas virtuālās istabas, izveidot jaunu lomu, izvēlēties spēles uzstādījumus sevis veidotās istabās un citas. Maksas lietotāja grupa ir atvasināta no reģistrēta lietotāja grupas.

Administratoru uzdevumi ietver lietotāju, spēles lomu un uzstādījumu rediģēšanu un lietotāju moderēšanu, izmantojot darbības, kā konta bloķēšana, konta rediģēšana, konta dzēšana, abonementa atcelšana, spēles atcelšana, spēlētāja izslēgšana, sarakstes dzēšana. Lietotājs "Sistēma" ir izmantots notikumu apstrādes izsaukšanai, kas ir nepieciešama automātiskai spēles gaitas vadībai.

Ar lietotājiem saistītās datu plūsmas ir attēlotas sistēmas nultā līmeņa DPD (skat. @fig:dpd-0 att.)

#figure(
  caption: "0. līmeņa DPD",
  image("img/dpd0/0tāLīmeņaDPD.svg"),
) <dpd-0>

== Vispārējie ierobežojumi

+ Drošības un aizsardzības apsvērumi:
  + Lietotāju paroles tiek šifrētas pirms glabāšanas, izmantojot sāls pievienošanu AES-256 algoritmu;
+ Regulējošās politikas apsvērumi:
  + Tiek pieprasīta lietotāju atļauja realizēt analītisku datu ievākšanu, izmantojot sīkdatnes.
  + Tiek pieparsīta lietotāju atļauja personas datu ievākšanai un apstrādei, kas atbilst vispārējai datu aizsardzības regulai (GDPR)
+ Izstrādes vides, tehnoloģijas un tīmekļa ierobežojumi:
  + Programmēšanas valodas, to tehniskie ierobežojumi;
  + Responsivitāte;
  + Sistēmas saskarne ir tīmekļa vietne;
  + Sistēmas ietvaros mitināta vietne ir kopīga neatkarīgi no ierīces (netiek izmantots apakšdomēns mobilo tālruņu lietotājiem).

== Pieņēmumi un atkarības
- Ierīce atbilst un spēj pilnvērtīgi izpildīt sistēmas prasības;
- Ierīce uztur stabilu interneta savienojumu ar joslas platumu vismaz 2 megabiti sekundē un latentumu līdz 1000ms;
- Lietotāja izvēlētā pārlūkprogramma atbilst un spēj pilnvērtīgi izpildīt sistēmas prasības;
// Added a note: Payment processor should offer similar functionality as required by the specification
- Maksājumus apstrādās pasūtītāja izvēlēts pakalpojumu sniedzējs, nodrošinot tīmekļa vietnes saskarni maksājuma veikšanai un tā apstrādi ārpus "Mafija" sistēmas. Pasūtītāja izvēlētam maksājumu apstrādātājam ir jārealizē no tā sagaidāmā funkcionalitāte.

#pagebreak(weak: true)
= Programmatūras prasību specifikācija

== Konceptuālais datu bāzes apraksts

#indent-par([
  Konceptuālajā modelī redzamās entitātes no konceptuālā ER modeļa (@fig:conceptual-model attēls):
])
- Lietotājs -- reģistrēts lietotājs, kas pieder noteiktai grupai;
- Attēls -- datnes metadati un tās adrese, kas ir saistīta ar lietotāju vai spēles lomu;
- Spēles uzstādījums -- vairāku spēles lomu kopa (konfigurācija), kas ir izveidojamas arī publiski (maksas lietotājiem);
- Spēles loma -- spēlē izmantojamās lomas apraksts, katrai lomai obligāti piemīt darbības. Tā var tikt izveidota publiski (līdzīgi spēles uzstādījumiem);
- Lomas darbība -- vienai vai vairākām spēles lomām piemītošās spēles darbības apraksts un spēlei specifiskie atribūti;
- Spēlētājs -- vienai spēles istabai piederošais spēlētājs. Tam piemīt viena spēles loma un var būt vairākas spēles gaitā veiktās lomai atbilstošās darbības;
- Sarakste -- virtuālās istabas tērzēšanā izveidotā sarakste, kas tiek saistīta ar vienu spēlētāju un var atbildēt uz citu saraksti izveides laikā;
- Spēles notikums -- spēlē iespējamie notikumi, tai skaitā spēles fāzes maiņa, spēlētāju izslēgšana, piemēram, izbalsošana vai slepkavība un citi.
- Istaba -- vienas gaidāmas, tekošās vai pagātnē notikušas spēles, kam piemīt spēlētāji, spēles uzstādījums, notikumi, izveidotājs (lietotājs maskas lietotāja grupā). Katrai spēlei ir sava istaba.

#figure(
  caption: "Datu bāzes konceptuālais ER modelis",
  placement: auto,
  image("img/erd/KonceptualaisERModelis.svg"),
) <conceptual-model>


== Funkcionālās prasības

=== Funkciju sadalījums moduļos

#indent-par([
  Funkciju sadalījums moduļos ir aprakstīts tabulā (@tbl:function-modules tab.). Katrs maksas lietotājs un administrators ir uzskatāms par reģistrētu lietotāju. Administratora privilēģijas ir atvasinātas no maksas lietotāja privilēģijas. Sistēmas lietotājs nav ierobežots.
])

Citas lietotāju grupas, izņemot reģistrētu lietotāju, tiek norādītas pie lietotāja grupas tikai tad, ja, funkcijas rezultāts atšķiras no rezultāta, kuru atgrieztu reģistrētam lietotājam. Tiek pieņemts, ka lietotāja autentifikācija ir izpildīta, izmantojot funkcijas, kur apstrāde ir neatkarīga no lietotāju grupas.

\2. līmeņa DPD parāda izvērstāku 1. līmeņa (jeb konteksta) DPD ar sistēmas sadalījumu pa moduļiem. Pārskatāmības dēļ DPD tika sadalīta divās daļās (skat @fig:dpd-1.1 att. un @fig:dpd-1.2 att.). Datu plūsmas diagrammās tiek izlaisti lietotāja identifikācijas dati, ja tie ir nepieciešami lietotāja darbības autorizācijai.

#figure(
  caption: "1. līmeņa DPD (1)",
  image("img/dpd1/1LīmeņaDPDN1.svg"),
) <dpd-1.1>


#figure(
  caption: "1. līmeņa DPD (2)",
  image("img/dpd1/1LīmeņaDPDN2.svg"),
) <dpd-1.2>

#pagebreak(weak: true)
#figure(
  caption: "Funkciju sadalījums pa moduļiem",
  kind: table,
  tablex(
    columns: 4,
    /* --- header --- */
    [*Modulis*], [*Funkcija*], [*Identifikators*], [*Lietotāja grupa*],
    /* -------------- */

    rowspanx(7)[Reģistrācijas un pieteikšanās modulis],
    [Lietotāja reģistrācija], [#link(<AMF01>)[AMF01]], [Nereģistrēts lietotājs],
    [Apstiprinājuma ziņas atkārtotās izsūtīšanas pieteikums], [#link(<AMF02>)[AMF02]], [Reģistrēts lietotājs],
    [Paroles atjaunošanas pieteikums], [#link(<AMF03>)[AMF03]], [Reģistrēts lietotājs],
    [Paroles atjaunošana], [#link(<AMF04>)[AMF04]], [Reģistrēts lietotājs],
    [Lietotāja atteikšanās], [#link(<AMF05>)[AMF05]], [Reģistrēts lietotājs],
    [Lietotāja pieteikšanās], [#link(<AMF06>)[AMF06]], [Reģistrēts lietotājs],
    [Lietotāja konta apstiprināšana], [#link(<AMF07>)[AMF07]], [Reģistrēts lietotājs],

    rowspanx(5)[Lietotāju kontu modulis],
    [Lietotāju profilu pārskats], [#link(<LKMF01>)[LKMF01]], [Reģistrēts lietotājs],
    [Lietotāja konta detaļas], [#link(<LKMF02>)[LKMF02]], [Reģistrēts lietotājs, Administrators],
    [Lietotāja konta bloķēšana], [#link(<LKMF03>)[LKMF03]], [Administrators],
    [Lietotāja konta rediģēšana], [#link(<LKMF04>)[LKMF04]], [Reģistrēts lietotājs, Administrators],
    [Lietotāja konta dzēšana], [#link(<LKMF05>)[LKMF05]], [Reģistrēts lietotājs, Administrators],

    rowspanx(4)[Maksas abonementu modulis],
    [Abonementa pieteikums], [#link(<MAMF01>)[MAMF01]], [Reģistrēts lietotājs],
    [Abonementu pārskats], [#link(<MAMF02>)[MAMF02]], [Reģistrēts lietotājs, Administrators],
    [Abonementa atcelšana], [#link(<MAMF03>)[MAMF03]], [Maksas lietotājs],
    [Abonementa plānu pārskats], [#link(<MAMF04>)[MAMF04]], [Nereģistrēts lietotājs, Reģistrēts lietotājs],

    /*rowspanx(4)[Cenu modulis],
    [Cenas pievienošana], [#link(<CMF01>)[CMF01]], [Administrators],
    [Cenas rediģēšana], [#link(<CMF02>)[CMF02]], [Administrators],
    [Cenu pārskats], [#link(<CMF03>)[CMF03]], [Administrators],
    [Cenas dzēšana], [#link(<CMF04>)[CMF04]], [Administrators],*/

    rowspanx(9)[Spēles istabu modulis],
    [Spēles istabu pārskats], [#link(<SIMF01>)[SIMF01]], [Reģistrēts lietotājs],
    [Pieslēgšanās spēles istabai], [#link(<SIMF02>)[SIMF02]], [Reģistrēts lietotājs],
    [Atslēgšanās no spēles istabas pieteikums], [#link(<SIMF03>)[SIMF03]], [Reģistrēts lietotājs],
    [Jaunas spēles istabas izveide], [#link(<SIMF04>)[SIMF04]], [Maksas lietotājs],
    [Spēles sākuma pieteikums], [#link(<SIMF05>)[SIMF05]], [Maksas lietotājs],
    [Spēlētāja izslēgšana], [#link(<SIMF06>)[SIMF06]], [Administrators],
    [Spēlētāju pārskats], [#link(<SIMF07>)[SIMF07]], [Reģistrēts lietotājs],
    [Spēļu vēstures pārskats], [#link(<SIMF08>)[SIMF08]], [Reģistrēts lietotājs],
    [Spēles atcelšana], [#link(<SIMF09>)[SIMF09]], [Maksas lietotājs, Administrators],

    rowspanx(4)[Tērzēšanas modulis],
    [Jaunas sarakstes izveidošana], [#link(<TMF01>)[TMF01]], [Reģistrēts lietotājs],
    [Sarakstes dzēšana], [#link(<TMF02>)[TMF02]], [Reģistrēts lietotājs, Administrators],
    [Sarakstu pārskats], [#link(<TMF03>)[TMF03]], [Reģistrēts lietotājs, Administrators],
    [Sarakstes rediģēšana], [#link(<TMF04>)[TMF04]], [Reģistrēts lietotājs],

    rowspanx(4)[Spēles gaitas modulis],
    [Spēles darbības veikšana], [#link(<SGMF01>)[SGMF01]], [Reģistrēts lietotājs],
    [Spēles notikumu izveidošana], [#link(<SGMF02>)[SGMF02]], [Sistēma],
    [Spēles notikumu pārskats], [#link(<SGMF03>)[SGMF03]], [Sistēma, Administrators, Reģistrēts lietotājs],
    [Spēles stāvokļa detaļas], [#link(<SGMF04>)[SGMF04]], [Sistēma, Administrators, Reģistrēts lietotājs],

    rowspanx(6)[Spēles lomu uzstādījumu modulis],
    [Lomas detaļas], [#link(<SLMF01>)[SLMF01]], [Reģistrēts lietotājs],
    [Lomu pārskats], [#link(<SLMF02>)[SLMF02]], [Reģistrēts lietotājs],
    [Lomas darbību pārskats], [#link(<SLMF03>)[SLMF03]], [Reģistrēts lietotājs],
    [Jaunas lomas izveidošana], [#link(<SLMF04>)[SLMF04]], [Maksas lietotājs, Administrators],
    [Lomas rediģēšana], [#link(<SLMF05>)[SLMF05]], [Maksas lietotājs, Administrators],
    [Lomas dzēšana], [#link(<SLMF06>)[SLMF06]], [Maksas lietotājs, Administrators],

    rowspanx(5)[Spēles uzstādījumu modulis],
    [Spēles uzstādījumu pārskats], [#link(<SUMF01>)[SUMF01]], [Reģistrēts lietotājs],
    [Spēles uzstādījuma lomu pārskats], [#link(<SUMF02>)[SUMF02]], [Reģistrēts lietotājs],
    [Jauna spēles uzstādījuma izveidošana], [#link(<SUMF03>)[SUMF03]], [Maksas lietotājs, Administrators],
    [Spēles uzstādījuma rediģēšana], [#link(<SUMF04>)[SUMF04]], [Maksas lietotājs, Administrators],
    [Spēles uzstādījuma dzēšana], [#link(<SUMF05>)[SUMF05]], [Maksas lietotājs, Administrators],
  ),
) <function-modules>

=== Kopīgās funkcijas ievades / izvades datu prasības

#indent-par([
  Apakšnodaļa ietver informāciju par funkciju parametriem, tai skaitā, nosaukumu, identifikatoru, aprakstu, parametra prasībām. Parametri ir aprakstīti atsevišķās tabulās (skat.
  #link(<IIDP01>)[IIDP01],
  #link(<IIDP02>)[IIDP02],
  #link(<IIDP03>)[IIDP03],
  #link(<IIDP04>)[IIDP04],
  #link(<IIDP05>)[IIDP05],
  #link(<IIDP06>)[IIDP06],
  #link(<IIDP07>)[IIDP07],
  #link(<IIDP08>)[IIDP08],
  #link(<IIDP09>)[IIDP09],
  #link(<IIDP10>)[IIDP10],
  #link(<IIDP11>)[IIDP11],
  #link(<IIDP12>)[IIDP12],
  #link(<IIDP13>)[IIDP13],
  #link(<IIDP14>)[IIDP14],
  #link(<IIDP15>)[IIDP15],
  #link(<IIDP16>)[IIDP16],
  #link(<IIDP17>)[IIDP17],
  #link(<IIDP18>)[IIDP18],
  #link(<IIDP19>)[IIDP19],
  #link(<IIDP20>)[IIDP20],
  #link(<IIDP21>)[IIDP21],
  #link(<IIDP22>)[IIDP22]).
])

#parameter-table(
  "Datuma simbolu virkne",
  "IIDP01",
  "Datums, kas ir reprezentēts ar simbolu virkni noteiktā formātā un laika zonā (sistēmas ietvaros tiek izmantota viena laika zona).",
  [
    + Jāatbilst standarta ISO 8601 datumu formātam;
    + Gadam jābūt 4 cipariem;
    + Mēnesim un gadam jāsatur 2 ciparus, ar sākuma nullēm, ja attiecināms;
    + Gadu, mēnesi un dienu jāatdala ar svītru (-);
    + Datumu jānosaka pēc koordinētās universālās laika zonas (UTC);
    + Struktūru raksturo shēma: YYYY-MM-DD, kur Y simboli ir aizvietojami ar gadu, M ar mēnesi un D ar dienu.
  ],
) <IIDP01>

#parameter-table(
  "Laika simbolu virkne",
  "IIDP02",
  "Datums un laiks, kas ir reprezentēts ar simbolu virkni noteiktā formātā un laika zonā (sistēmas ietvaros tiek izmantota viena laika zona).",
  [
    + Jāatbilst standarta ISO 8601 datumu un laika formātam;
    + Gadam jābūt 4 cipariem;
    + Mēnesim un gadam jāsatur 2 ciparus, ar sākuma nullēm, ja nepieciešams;
    + Gadu, mēnesi un dienu jāatdala ar svītru (-);
    + Stundai un minūtei un sekundei jābūt 2 cipariem, ar sākuma nullēm, ja attiecināms;
    + Laiks un datums jānosaka pēc koordinētās universālās laika zonas (UTC);
    + Struktūru raksturo shēma: YYYY-MM-DDThh:mm:ss, kur Y simboli ir aizvietojami ar gadu, M ar mēnesi un D ar dienu, kā arī h simboli ir aizvietojami ar stundām, m ar minūtēm un s ar sekundēm.
  ],
) <IIDP02>

#parameter-table(
  "Skaitlisks stāvokļa kods",
  "IIDP03",
  "Skaitlis, kas reprezentē noteiktu stāvokli funkcijas darbībai vai datubāzes tabulai.",
  [
    + Vesels pozitīvs skaitlis.
  ],
) <IIDP03>

#parameter-table(
  "Vārds un uzvārds",
  "IIDP04",
  "Reģistrēta lietotāja vārds un uzvārds.",
  [
    + Simbolu virkne garumā līdz 255 simboliem;
    + Atļautie simbola: unikoda lielie burti (_Lu_), mazie burti (_Ll_), virsraksta burti (_Lt_) modifikatoru burti (_Lm_), citi burti (_Lo_), atstarpe, domuzīme.
  ],
) <IIDP04>

#pagebreak(weak: true)
#parameter-table(
  "E-pasts",
  "IIDP05",
  "Reģistrēta lietotāja e-pasts.",
  [
    + Simbolu virkne garumā līdz 255 simboliem;
    + Jāatbilst standarta RFC 2822 interneta ziņu formātam.
  ],
) <IIDP05>

#parameter-table(
  "Parole",
  "IIDP06",
  "Reģistrēta lietotāja parole.",
  [
    + Simbolu virkne garumā no 8 līdz 127 simboliem;
    + Var saturēt burtciparu simbolus, skaitļus, atstarpi, speciālos simbolus: izsaukuma zīmi ($!$), dubultpēdiņas ($\"$), skaitļa zīmi ($\#$),dolāra zīmi ($\$$), procenta zīmi ($%$), ampersandu ($\&$), pēdiņas ($'$), iekavas ($($)), figūriekavas ({}), zvaigznīti ($*$), plusu ($+$), komatu ($,$), mīnusu ($-$), punktu ($.$), slīpsvītru ($\/$), kolu ($:$), semikolu ($;$), salīdzinājuma zīmes ($<$ $>$), vienādības zīmi ($=$), jautājuma zīmi ($?$), "et" zīmi ($@$), pasvītru ($\_$), vertikālo joslu ($|$), tildi ($~$);
    + Minimālās drošības prasības: satur vismaz vienu lielo un mazo burtu, vienu ciparu.
  ],
) <IIDP06>

#parameter-table(
  "Segvārds",
  "IIDP07",
  "Reģistrēta lietotāja vārds, kas tiek izmantots saskarnes personalizācijai.",
  [
    + Simbolu virkne garumā no 6 līdz 255 simboliem;
    + Atļautie simboli: lielie burti (_Lu_), mazie burti (_Ll_, virsraksta burti (_Lt_,) modifikatoru burti (_Lm_), citi burti (_Lo_), atstarpe, domuzīme, apakšsvītra.
  ],
) <IIDP07>

#parameter-table(
  "Attēls",
  "IIDP08",
  "Sistēmā lietotu attēlu datne.",
  [
    + Attēla datne;
    + Paplašinājums ir viens no: JPEG, JPG, GIF, PNG, WEBP;
    + Izmērs nepārsniedz 1MB.
  ],
) <IIDP08>

#parameter-table(
  "Apraksts",
  "IIDP09",
  "Informācija par spēles priekšmetu, lietotāju u. tml.",
  [
    + Simbolu virkne garumā līdz 512 simboliem;
    + Atļautie simboli: Unikoda lielie burti (_Lu_), mazie burti (_Ll_), virsraksta burti (_Lt_), modifikatoru burti (_Lm_), citi burti (_Lo_), speciālie simboli.
  ],
) <IIDP09>

#parameter-table(
  "Tabulas identifikators",
  "IIDP10",
  "Datubāzē izmantots skaitlisks tabulas identifikators.",
  [
    + Vesels pozitīvs skaitlis
  ],
) <IIDP10>

#parameter-table(
  "Kārtošanas kods",
  "IIDP11",
  [Skaitlisks kods, kas atbilst kādam atribūtam, kurš ir kārtojams: 0 -- nekārtot, 1 -- kārtot augoši, 2 -- kārtot dilstoši.],
  [
    + Vesels pozitīvs skaitlis
  ],
) <IIDP11>

#parameter-table(
  "Datubāzes atribūta nosaukums",
  "IIDP12",
  "Datubāzes atribūta nosaukums",
  [
    + Simbolu virkne garumā līdz 127 simboliem;
    + Atļautie simboli: unikoda mazie burti (_Ll_), pasvītra.
  ],
) <IIDP12>

#parameter-table(
  "Datubāzes pieprasījums",
  "IIDP13",
  "Datubāzes pieprasījums.",
  [
    + Pieprasījums PostgreSQL formātā iekodēts simbolu virknes struktūrā;
    + Pieprasījumā jābūt iespējai rediģēt pastāvošos un pievienot papildus nosacījumus.
  ],
) <IIDP13>

#parameter-table(
  "Meklēšanas uzvedne",
  "IIDP14",
  "Uzvedne datubāzes ierakstu meklēšanai",
  [
    + Simbolu virkne garumā līdz 255 simboliem;
    + Atļautie simboli: Unikoda lielie burti (_Lu_), mazie burti (_Ll_), virsraksta burti (_Lt_), modifikatoru burti (_Lm_), citi burti (_Lo_), atstarpe, domuzīme, cipari.
  ],
) <IIDP14>

#parameter-table(
  "Cena",
  "IIDP15",
  "Maksas abonementa cena",
  [
    + Decimāls skaitlis līdz 16 cipariem un 2 cipariem aiz komata.
  ],
) <IIDP15>

#parameter-table(
  "Sarakstes teksts",
  "IIDP16",
  "Lietotāja sūtītās sarakstes teksts istabas tērzētavā.",
  [
    + Simbolu virkne līdz 2047 simboliem;
    + Atļautie simboli: Unikoda lielie burti (_Lu_), mazie burti (_Ll_), virsraksta burti (_Lt_) modifikatoru burti (_Lm_), citi burti (_Lo_), speciālie simboli.
  ],
) <IIDP16>

#parameter-table(
  "Marķieris",
  "IIDP17",
  "Sistēmas izmantots marķieris lietotāju identifikācijai.",
  [
    + Atbilst RFC 7519 standartam.
  ],
) <IIDP17>


#parameter-table(
  "Filtra kods",
  "IIDP18",
  [Skaitlisks kods, kam atbilst filtra veids: 0 -- Būla mainīgā filtrs, 1 -- tabulas identifikatora filtrs.],
  [
    + Vesels pozitīvs skaitlis.
  ],
) <IIDP18>

#parameter-table(
  "Filtru vārdnīcu saraksts",
  "IIDP19",
  "Saraksts ar vārdnīcām, kas satur informāciju par pārskatā pielietojamiem filtriem.",
  [
    + Saraksts, kas sastāv no vārdnīcām;
    + Vārdnīcu atslēgas -- datu bāzes atribūta nosaukums (atbilst #link(<IIDP12>)[IIDP12]);
    + Vārdnīcu vērtības -- filtra vērtība -- vesels skaitlis -- un filtra veids -- atbilst #link(<IIDP18>)[IIDP18]).
  ],
) <IIDP19>

#parameter-table(
  "Kārtošanas vārdnīcu saraksts",
  "IIDP20",
  "Saraksts ar vārdnīcām, kas satur informāciju par pārskatā pielietojamo kārtošanu.",
  [
    + Saraksts, kas sastāv no vārdnīcām;
    + Vārdnīcu atslēgas -- datu bāzes atribūta nosaukums (atbilst #link(<IIDP12>)[IIDP12]);
    + Vārdnīcu vērtības -- kārtošanas kods (atbilst #link(<IIDP11>)[IIDP11]);
  ],
) <IIDP20>

#parameter-table(
  "Spēles entitātes nosaukums",
  "IIDP21",
  "Spēles istabas, uzstādījuma vai lomas nosaukums.",
  [
    + Simbolu virkne ar garumu no 0 līdz 50 simboliem.
    + Atļautie simboli: Unikoda lielie burti (_Lu_), mazie burti (_Ll_), virsraksta burti (_Lt_), modifikatoru burti (_Lm_), citi burti (_Lo_), atstarpe, domuzīme, cipari.
  ],
) <IIDP21>

#parameter-table(
  "Maksājumu apstrādātāja identifikators",
  "IIDP22",
  "Maksājumu apstrādātāja izveidotais un izmantotais unikālais identifikators.",
  [
    + Simbolu virkne ar garumu 50.
    + Atļautie simboli: Unikoda lielie burti (_Lu_), mazie burti (_Ll_), atstarpe, cipari, pasvītra.
  ],
) <IIDP22>


=== Kopīgās procedūras

#indent-par([
  Apakšnodaļa ietver funkcijās izmantojamās procedūras, kas tiek izmantotas vairākās funkcijās, kas ietver nosaukumu, aprakstu, ievadi, apstrādi un izvadi.
  Procedūras ir aprakstītas atsevišķās tabulās (skat.
  #link(<KPR01>)[KPR01],
  #link(<KPR02>)[KPR02],
  #link(<KPR03>)[KPR03],
  #link(<KPR04>)[KPR04],
  #link(<KPR05>)[KPR05],
  #link(<KPR06>)[KPR06],
  #link(<KPR07>)[KPR07],
  #link(<KPR08>)[KPR08],
  #link(<KPR09>)[KPR09],
  #link(<KPR10>)[KPR10],
  #link(<KPR11>)[KPR11],
  #link(<KPR12>)[KPR12]).
])

#procedure-table(
  "Pārskata lappuses iegūšana",
  "KPR01",
  "Aprēķina pārskata lappuses ierakstu nobīdi pēc kura atgriež lappuses ierakstus.",
  [
    Obligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1;
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13]\;
    + Rezultātu skaits -- vesels nenegatīvs skaitlis.

    Neobligātie parametri:
    + Ierakstu skaits lappusē -- vesels pozitīvs skaitlis.
  ],
  [
    + Aprēķina lappušu skaitu ar formulu: $L = ceil(Q / Q_l)$, $Q$ -- rezultātu skaits, $Q_l$ -- ierakstu skaits vienā lappusē;
    + Ja lappuses numurs pārsniedz kopējo lappušu skaitu, tad turpmāk lappuses numurs ir 1;
    + Aprēķina ierakstu nobīdi ar formulu: $O = (N - 1) dot Q_l$, kur $O$ -- nobīde; $N$ -- lappuses numurs, $Q_l$ -- ierakstu skaits vienā lappusē;
    + Pievieno aprēķinātu nobīdi datubāzes pieprasījumam.
  ],
  [
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13]\;
    + Lappuses numurs -- vesels pozitīvs skaitlis;
    + Kopējs lappušu skaits -- vesels pozitīvs skaitlis.
  ],
) <KPR01>

#procedure-table(
  "Konkrētā istabas, spēlētāja, lietotāja atbilstības pārbaude",
  "KPR02",
  "Pārbauda vai datubāzē eksistē un savstarpēji saistīti lietotāja, spēlētāja un istabas ieraksti, i.e, pārbauda vai spēlētājs atrodas istabā un lietotājs ir šis spēlētājs.",
  [
    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Meklē istabas ierakstu pēc spēles istabas identifikatora;
      + Ja neatrod atgriež "nepatiess".
    + Meklē spēlētāju ierakstu pēc spēlētāja un spēles istabas identifikatora;
      + Ja neatrod, atgriež "nepatiess".
    + Meklē lietotāju ierakstu pēc spēlētāja un spēles istabas identifikatora;
      + Ja neatrod, atgriež "nepatiess".
    + Pārbauda, vai lietotāja un spēlētāja ieraksta attiecīgie identifikatori sakrīt;
      + Ja nesakrīt, atgriež "nepatiess".
    + Atgriež "patiess".
  ],
  [
    + Atbilstības karodziņš -- vai dotie identifikatori ir savā starpā saistīti.
  ],
) <KPR02>

#procedure-table(
  [
    Piederības pārbaude "Mafija" lomu grupai
  ],
  "KPR03",
  [
    Pārbauda, vai konkrētais spēlētājs pieder "Mafija" lomu grupai.
  ],
  [
    Obligātie parametri:
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Meklē spēlētāja lomu pēc spēlētāja identifikatora;
    + Ja lomas "Mafija" karodziņš parāda to, ka spēlētāja loma nepieder "Mafija" lomu grupai, tad atgriež "nepatiess" (vērtība 0), pretēji -- atgriež "patiess".
  ],
  [
    + Mafijas piederības karodziņš -- vai spēlētājs pieder mafijai.
  ],
) <KPR03>

#procedure-table(
  "Pieprasījuma filtru pievienošana",
  "KPR04",
  "Apstrādā datubāzes pieprasījumu, pievienojot atbilstošus filtra nosacījumus.",
  [
    Obligātie parametri:
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13]\;
    + Filtra atribūta nosaukums -- datubāzes identifikators.

    Neobligātie parametri:
    + Identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Pārbauda, vai katrs atribūts no filtra atribūtu saraksta ar tādu nosaukumu eksistē;
      + Ja kāds no tiem neeksistē, beidz apstrādi.
    + Katram filtra atribūtam pievieno filtru datubāzes pieprasījumu;
      + Ja identifikators ir iesniegts, pievieno filtrēšanu pēc šī identifikatora;
      + Ja nav, filtrē pēc karodziņa "patiess".
  ],
  [
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13].
  ],
) <KPR04>

#procedure-table(
  "Meklēšanas nosacījuma pievienošana",
  "KPR05",
  "Apstrādā datubāzes pieprasījumu, pievienojot atbilstošus meklēšanas nosacījumus.",
  [

    Obligātie parametri:
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13]\;
    + Meklēšanas atribūtu nosaukumu saraksts, kas sastāv no simbolu virknēm, kas atbilst #link(<IIDP12>)[IIDP12]\;
    + Meklēšanas uzvedne -- simbolu virkne, atbilst #link(<IIDP14>)[IIDP14], noklusētā vērtība -- "".
  ],
  [
    + Pārbauda, vai katrs atribūts no meklēšanas atribūtu saraksta ar tādu nosaukumu eksistē;
      + Ja neeksistē, beidz apstrādi.
    + Pievieno meklēšanas nosacījumu pieprasījumu ar meklēšanas saraksta atribūtiem.
  ],
  [
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13].
  ],
) <KPR05>

#procedure-table(
  "Kārtošanas nosacījuma pievienošana",
  "KPR06",
  "Apstrādā datubāzes pieprasījumu, pievienojot atbilstošus meklēšanas nosacījumus.",
  [

    Obligātie parametri:
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13]\;
    + Kārtošanas atribūta nosaukums, kas atbilst #link(<IIDP12>)[IIDP12]\;
    + Kārtošanas kods, kas atbilst #link(<IIDP11>)[IIDP11].
  ],
  [
    + Pārbauda, vai atribūts ar tādu nosaukumu eksistē;
      + Ja neeksistē, beidz apstrādi.
    + Pievieno kārtošanu attiecīgajam atribūtam attiecīgi kārtošanas kodam.
  ],
  [
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13].
  ],
) <KPR06>

#procedure-table(
  "Pārskata pieprasījuma sagatavošana",
  "KPR07",
  "Sagatavo pārskatu datubāzes pieprasījumu pievienojot neobligātu lappuses nobīdi, filtrēšanu un kārtošanu",
  [
    Obligātie parametri:
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13].

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1;
    + Meklēšanas uzvedne -- simbolu virkne, atbilst #link(<IIDP14>)[IIDP14], noklusētā vērtība -- "".
    + Kārtošanas vārdnīcu saraksts - atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
  ],
  [
    + Ja filtru vārdnīcu saraksts nav tukšs, katram saraksta elementam pievieno kārtošanu pieprasījumam ar attiecīgiem atribūtu nosaukumiem, filtra veidiem un vērtībām, izmantojot #link(<KPR04>)[KPR04]\;
    + Ja meklēšanas uzvedne ir iesniegta un nav tukša simbolu virkne, tad pieprasījumam pievieno meklēšanas nosacījumu meklēšanai pēc pilna vārda, segvārda un biogrāfijas, izmantojot #link(<KPR05>)[KPR05]\;
    + Ja kārtošanas vārdnīcu saraksts nav tukšs, katram saraksta elementam pievieno kārtošanu pieprasījumam ar attiecīgiem atribūtu nosaukumiem, kārtošanas kodiem, izmantojot #link(<KPR06>)[KPR06]\;
    + Ja lappuses numurs netika iesniegts, uzskata, ka lappuses numurs ir 1;
    + Pieprasa ierakstu saskaitīšanu, izmantojot sagatavoto pieprasījumu.
      + Ja rezultātu skaits ir lielāks par 0, iegūst lappuses ierakstu nobīdi, lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR01>)[KPR01] ar attiecīgo rezultātu skaitu, lappuses numuru, noklusēto ierakstu skaitu lappusē;
      + Ja rezultātu skaits ir 0, kopējo lappušu skaitu un lappuses numuru uzskata par 0.
  ],
  [
    + Datubāzes pieprasījums, kas atbilst #link(<IIDP13>)[IIDP13]\;
    + Lappuses numurs -- vesels pozitīvs skaitlis;
    + Kopējs lappušu skaits -- vesels pozitīvs skaitlis.
  ],
) <KPR07>

#procedure-table(
  "Lietotāja maksas abonementa aktīvuma pārbaude",
  "KPR08",
  "Pārbauda, vai lietotājam ir aktīvs maksas abonements.",
  [
    Obligātie parametri:

    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\.
  ],
  [
    + Iegūst lietotāja klienta identifikatoru no datubāzes.
      + Ja identifikators atbilst nulles vērtībai, izvada "nepatiess".
    + Pieprasa abonementu sarakstu no maksājumu apstrādātāja.
      + Ja pieprasījums neizdevās, izvada "nepatiess".
    + meklē pēdējo abonementu pēc izveidošanas laika.
    + Ja atbildē nav abonementu, izvada "nepatiess".
    + Ja pēdējais abonements ir aktīvs, izvada "patiess".
  ],
  [
    + Aktīva abonementa karodziņš -- vai dotam lietotājam ir aktīvs abonements.
  ],
) <KPR08>

#procedure-table(
  "Teksta sanitizācija",
  "KPR09",
  "Sanizizē ievadīto tekstu, i.e., noņem no teksta simbolus, kas varētu būt nozīmīgi simboli iezīmēšanas vai skriptu valodā.",
  [
    Obligātie parametri:
    + Teksts -- simbolu virkne.
  ],
  [
    + Ievades tekstā aizvieto sekojošos simbolus ar attiecīgiem izvairīšanās simboliem:
      + ampersandu (&);
      + mazāks par (<);
      + lielāks par (>);
      + dubultpēdiņu ("");
      + pēdiņu ('');
      + slīpsvītra (/).
  ],
  [
    + Sanitizēts teksts -- simbolu virkne.
  ],
) <KPR09>

#procedure-table(
  "E-pasta apstiprinājuma pieteikšana",
  "KPR10",
  "Uzstāda lietotāja apstiprinājuma datus lietotāja ierakstam.",
  [
    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\.
  ],
  [
    + Meklē lietotāju, izmantojot lietotāja identifikatoru.
      + Ja neadrot, izvada kodu, kas atbilst neveiksmei.
    + Ģenerē e-pasta apstiprinājuma marķieri, kas atbilst #link(<IIDP17>)[IIDP17].
    + Meklē lietotājus ar šo e-pasta apstiprinājuma marķieri;
      + Ja lietotājs tika atrasts, atkārto e-pasta apstiprinājuma ģenerēšanu un lietotāju meklēšanu līdz marķieris ir unikāls.
    + Aprēķina derīguma termiņu, pieskaitot tagadējam laikam noteiktu laiku.
    + Lietotāja ierakstam pievieno apstiprinājuma stāvokļa informāciju, marķieri un derīguma termiņu.
    + Ieraksta lietotāja e-pasta apstiprināšanas informāciju.
      + Ja tā netiek apstiprināta, izvada kodu, kas atbilst neveiksmei.
    + Izveido saiti apstiprinājumam, iekļaujot e-pasta apstiprinājuma marķieri;
    + Sagatavo e-pasta ziņas saturu no šablona, ievietojot tajā apstiprinājuma saiti;
    + Pieprasa e-pasta aizsūtīšanu.
      + Ja tā netiek apstiprināta, izvada kodu, kas atbilst neveiksmei.
  ],
  [
    + E-pasta apstiprinājuma pieteikuma stāvoklis -- skaitlisks kods.
  ],
) <KPR10>

#procedure-table(
  "Lietotāja maksas apstrādātāja identifikatora izveide",
  "KPR11",
  "Izveidot lietotājam maksas apstrādātāja unikālo identifikatoru.",
  [
    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    // https://stripe.com/docs/api/customers/create
    + Meklē lietotāju, izmantojot lietotāja identifikatoru.
      + Ja neatrod, izvada kodu, kas atbilst neveiksmei.
    + Sagatavo datus pieprasījumam, kas iekļauj lietotāja vārdu, uzvārdu un e-pastu. Pārveido to maksājuma apstrādātāja pieprasītā formātā, izmantojot maksājuma apstrādātāja API.
    + Ģenerē lietotāja maksājumu apstrādātāja identifikatoru, sazinoties ar maksājumu apstrādātāju.
  ],
  [
    + Lietotāja maksājuma apstrādātāja identifikators -- atbilst #link(<IIDP22>)[IIDP22].
  ],
) <KPR11>

#procedure-table(
  "Attēla validācija",
  "KPR12",
  "Parbauda, vai attēls (attēla datne) atbilst noteiktām prasībām.",
  [
    Obligātie parametri:
    + Attēls -- atbilst #link(<IIDP08>)[IIDP08].
  ],
  [
    // Image
    + Pārbauda, vai datne atbilst pieļaujamajiem datnes paplašinājumiem;
      + Ja neatbilst, atgriež kļūdu ar par nepieļaujamo datnes paplašinājumu: "Attēlam ir nepieļaujams paplašinājums: \[pieļaujamie paplašinājumi\]".
    + Pārbauda, vai datne nepārsniedz noteikto datnes lielumu;
      + Ja pārsniedz, atgriež kļūdu par pārsniegto datnes lielumu: "Attēls nedrīkst pārsniegt: \[noteiktais faila izmēra maksimums\]".
    + Ja iesniegtā attēla paplašinājums ir pieļaujams, bet nav PNG, tad datne tiek konvertēta šajā paplašinājumā.

    // Invokation
    //+ Ja tika iesniegts attēls, validē attēlu ar #link(<KPR12>)[KPR12].
    //  + Ja validācija ir neveiksmīga, parāda X. vai Z. paziņojumu, atkarībā no validācijas rezultāta.
  ],
  [
    Validācijas rezultāts veiksmes vai kļūdas kods, balstoties uz kuru lietotājam tiks parādīta attiecīga kļūda.
    + Validācijas rezultāts -- kļūdas paziņojums -- noteiktās kļūdas skaitlisks kods vai 1, ja validācija ir veiksmīga.
  ],
) <KPR12>

=== Reģistrācijas un pieteikšanās modulis

#indent-par([

  /*
                              TEMPLATE
                              Apakšnodaļa ietver [MODULE_NAME] moduļa funkcijas. Moduļa funkcionalitāte ir izmantota [KAM?]. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. [FIGURE_REFERENCE]).
                              */

  Apakšnodaļa ietver reģistrācijas un pieteikšanās moduļa funkcijas. Moduļa funkcionalitāte ir izmantota lietotāju reģistrācijai, pieteikšanās un citām darbībām, kas saistās ar lietotāja autentifikāciju un to kontu. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-auth).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<AMF01>)[AMF01],
  #link(<AMF02>)[AMF02],
  #link(<AMF03>)[AMF03],
  #link(<AMF04>)[AMF04],
  #link(<AMF05>)[AMF05],
  #link(<AMF06>)[AMF06],
  #link(<AMF07>)[AMF07]).
])

#figure(
  caption: "Reģistrācijas un pieteikšanās moduļa 2. līmeņa DPD",
  image("img/dpd2/ReģistrācijasPieteikšanāsModulis.svg"),
) <dpd-2-auth>

#pagebreak(weak: true)
#function-table(
  "Lietotāja reģistrācija",
  "AMF01",
  [
    Funkcijas mērķis ir reģistrēt lietotāja kontu sistēmā, autentifikācijas procesam un lietotāja darbību autorizācijai, un lietotāja informācijas uzglabāšanai. Apstrādes procesā ievades dati tiek pārbaudīti attiecīgi noteiktajām prasībām. Paroles šifrēšanas procesā tiek izmantota jaucējfunkcija ar papildus drošības metodiku -- "sāls pievienošanu" -- nejaušu simbolu virknes pievienošanu pirms šifrēšanas procesa uzsākšanas.
  ],
  [
    // Why remove 'veidlapa'
    Ievades dati tiek saņemti no nereģistrētiem lietotājiem.

    Obligātie parametri:
    + Vārds, uzvārds -- atbilst #link(<IIDP04>)[IIDP04]\;
    + Segvārds -- atbilst #link(<IIDP07>)[IIDP07]\;
    + E-pasta adrese -- atbilst #link(<IIDP05>)[IIDP05]\;
    + Parole -- atbilst #link(<IIDP06>)[IIDP06]\;
    + Paroles apstiprinājums -- simbolu virkne, kas atbilst #link(<IIDP06>)[IIDP06]\;
    + Dzimšanas datums -- atbilst #link(<IIDP01>)[IIDP01].

    Neobligātie parametri:
    + Profila attēls -- atbilst #link(<IIDP08>)[IIDP08], noklusētā vērtība -- noklusētā attēla adrese;
    + Biogrāfiskā informācija -- atbilst #link(<IIDP09>)[IIDP09], noklusētā vērtība -- "".
  ],
  [
    // Validation
    + Pārbauda, vai visi obligātie lauki ir iesniegti;
      + Ja tie nav, iegūst sarakstu ar neaizpildītajiem laukiem, parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai parole un paroles apstiprinājums sakrīt;
      + Ja nesakrīt, tad parāda 2. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai vārds un uzvārds, segvārds, e-pasta adrese, parole satur tikai pieļaujamos simbolus;
      + Ja nesatur, tad iegūst izmantotos neatļautos simbolus, tad parāda 3. paziņojumu ar attiecīgi laukiem un simboliem. Beidz apstrādi.
    + Pārbauda, vai vārds un uzvārds, segvārds, e-pasta adrese, biogrāfiskā informācija, parole nepārsniedz noteikto garumu;
      + Ja pārsniedz, tad iegūst pārsniegto garumu parametru sarakstu un parāda 4. paziņojumu ar attiecīgajiem laukiem un garumiem. Beidz apstrādi.
    + Pārbauda, vai parole atbilst noteiktiem drošības prasībām;
      + Ja tā tiem neatbilst, tad parāda 5. paziņojumu ar attiecīgām neizpildītajām prasībām. Beidz apstrādi.
    + Pārbauda, vai dzimšanas datums atbilst minimālam vecumam reģistrācijai;
      + Ja neatbilst, parāda 6. paziņojumu. Beidz apstrādi.

    // Trasnformation
    + Sanitizē biogrāfisko informāciju, izmantojot #link(<KPR09>)[KPR09]\.

      // Image
    + Ja tika iesniegts attēls, validē attēlu ar #link(<KPR12>)[KPR12] un uzstāda pievienošanas laiku uz tagadējo laiku.
      + Ja validācija ir neveiksmīga, parāda 8. paziņojumu ar attiecīgu validācijas kļūdu.

    + Meklē datubāzē lietotājus ar ievadīto e-pastu vai segvārdu;
      + Ja tāds(/-i) pastāv, tad parāda 9. paziņojumu ar attiecīgo aizņemto lauku. Beidz apstrādi.
      // Password
    + Ģenerē "sāls" simbolu virkni ar noteiktu algoritmu, to pievieno parolei.
    + Šifrē paroli ar jaucējfunkciju.
    + Uzstāda konta stāvokli uz vērtību, kas atbilst stāvoklim "aktīvs".

    // Construct user (+ fill the DB statuses etc.)
    + Uzstāda e-pasta apstiprinājuma karodziņa vērtību uz nepatiesu.
    + Uzstāda izveidošanas laiku uz tagadējo laiku.
    + Jauna lietotāja sagatavotie dati tiek ierakstīti datubāzē;
      + Ja ierakstīšana nenotiek, parādīt 10. paziņojumu. Beidz apstrādi.
      // USER is created

    // Add e-mail information to the DB and send an email
    + Piesaka konta apstiprinājumu, izmantojot #link(<KPR10>)[KRP10] procedūru.
      + Ja procedūra nav veiksmīga, parāda 12. paziņojumu.

  ],
  [
    Izvades datu mērķis ir noteikt, vai lietotājs tiks pāradresēts un uz kuru lapu lietotājs tiks pāradresēts. Lietotāja tiek parādīts 11. paziņojums.
    + Reģistrācijas apstiprinājuma stāvoklis -- skaitlisks kods.
  ],
  [
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!;
    + Parole un paroles apstiprinājums nesakrīt!;
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!;
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!;
    + Parolei ir jāsatur: [neizpildīto paroles prasību saraksts]!;
    + Minimālais vecums reģistrācijai: [noteikts minimālais vecums reģistrācijai]\;
    + Reģistrācija ir veiksmīga! Pagaidām nav iespējams aizsūtīt apstiprinājumu, mēģiniet vēlreiz!;
    + Šo attēlu nedrīkst izmantot: \[validācijas kļūda\]!;
    + Lietotājs ar tādu [aizņemtā lauka nosaukums] jau eksistē!;
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!;
    + Reģistrācija ir veiksmīga! Apstipriniet lietotāja kontu ar saiti, kas tiks izsūtīta tuvākā laikā, e-pastā.
  ],
) <AMF01>

#function-table(
  "Apstiprinājuma ziņas atkārtotās izsūtīšanas pieteikums",
  "AMF02",
  "Funkcijas mērķis ir izsūtīt e-pasta apstiprinājumu atkārtoti lietotājam, kas jau veica reģistrāciju vai reģistrācijas laikā, vai pēc e-pasta izmaiņas lietotāja kontā.",
  [
    Ievaddati tiek iegūti no darbības -- klikšķis uz attiecīgo apstiprinājuma pieteikuma pogu reģistrācijas laikā vai lietotāja konta rediģēšanas lapā. Ievades dati tiek iegūti no konteksta.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Meklē lietotāju datubāzē pēc ievades datu identifikatora parametra;
      + Ja tāds lietotājs neeksistē, parāda 1. paziņojumu. Beidz apstrādi.
    + Ja lietotāja e-pasts ir apstiprināts, parāda 4. paziņojumu.

    // Add e-mail information to the DB and send an email
    + Piesaka konta apstiprinājumu, izmantojot #link(<KPR10>)[KRP10] procedūru.
      + Ja procedūra nav veiksmīga, parāda 1. paziņojumu.
  ],
  [
    Izvades datu mērķis ir lietotāja informēšana par apstiprinājuma ziņojuma izsūtīšanas stāvokli. Lietotāja saskarnē parādās 3. paziņojums ar instrukciju par e-pasta apstiprināšanu.
    + E-pasta apstiprinājuma ziņas izsūtīšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Apstiprinājuma ziņa ir izsūtīta! Apstipriniet lietotāja kontu ar saiti, kas tiks izsūtīta tuvākā laikā, e-pastā.
    + Apstiprinājuma ziņa tiks izsūtīta 1-10 minūšu laikā;
    + E-pasts jau ir apstiprināts.
  ],
) <AMF02>

#function-table(
  "Paroles atjaunošanas pieteikums",
  "AMF03",
  "Funkcijas mērķis ir ļaut lietotājam atjaunot aizmirstu vai nedrošu paroli, nodrošinot drošu paroles maiņas procesu, kas ietver unikāla marķiera izveidi, tā nosūtīšanu lietotāja e-pastā un tā verifikāciju.",
  [
    Ievaddati tiek iegūti no veidlapas.

    Obligātie parametri:
    + E-pasta adrese -- atbilst #link(<IIDP05>)[IIDP05].
  ],
  [
    + Pārbauda, vai e-pasta adrese eksistē datubāzē, meklējot lietotāju ar sakrītošu e-pasta adresi.
      + Ja tāds lietotājs jau eksistē, parāda 1. paziņojumu. Beidz apstrādi.
    + Ģenerē unikālu marķieri paroles atjaunošanai, pārbaudot unikalitāti, meklējot lietotāju ar sakrītošu un derīgu marķieri, kas atbilst #link(<IIDP17>)[IIDP17].
      + Ja tāds lietotājs eksistē, atkārto ģenerāciju līdz iegūtais marķieris ir unikāls.
    + Ieraksta jaunu marķieri lietotāja, kas atjauno paroli, ierakstam, pievienojot tam noteikto derīguma laiku.
    + Izveido saiti paroles atjaunošanai, iekļaujot marķieri.
    + Pieprasa paroles atjaunošanas saites izsūtīšanu ar atbilstošo e-pasta saturu.
      + Ja izsūtīšana nav veiksmīga, parāda 5. paziņojumu.
  ],
  [
    Izvades datu mērķis ir lietotāja informēšana par paroles atjaunošanas pieteikuma ziņas izsūtīšanas stāvokli. Lietotāja saskarnē parādās 4. paziņojums.
    + Paroles atjaunošanas pieteikuma stāvoklis -- skaitlisks kods.
  ],
  [
    + E-pasta adrese jau ir reģistrēta!;
    + Saitei ir beidzies derīguma termiņš!;
    + Parolei ir jāsatur: [neizpildīto paroles prasību saraksts]!;
    + Apstiprinājuma ziņa ir izsūtīta! Apstipriniet lietotāja kontu ar saiti, kas tiks izsūtīta tuvākā laikā e-pastā.
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <AMF03>

#function-table(
  "Paroles atjaunošana",
  "AMF04",
  "Funkcijas mērķis ir ļaut lietotājam atjaunot aizmirstu vai nedrošu paroli, nodrošinot drošu paroles maiņas procesu, kas ietver unikāla marķiera izveidi, tā nosūtīšanu lietotāja e-pastā un tā pārbaudi.",
  [
    Ievaddati tiek iegūti no apstiprinājuma vietrādes parametriem ar kuru lietotājs piekļūst sistēmas funkcijai.

    Obligātie parametri:
    + Lietotāja paroles atjaunošanas marķieris -- atbilst #link(<IIDP17>)[IIDP17]\;
    + Lietotāja jaunā parole -- atbilst #link(<IIDP06>)[IIDP06]\;
    + Lietotāja jaunās parole apstiprinājums -- skaitlisks kods.
  ],
  [
    + Ja lietotāja paroles identifikatora atjaunošanas marķieris nav iesniegts, parāda 1. paziņojumu. Beidz apstrādi;
    + Meklē lietotāja ierakstu datubāzē, meklējot to pēc atjaunošanas marķiera;
    + Ja lietotāja ieraksts netika atrasts, parāda 2. paziņojumu. Beidz apstrādi;
      + Pārbauda, vai saitē iekļautais marķieris ir derīgs un nav novecojis. Ja tas ir nederīgs vai novecojis, parāda 2. paziņojumu. Beidz apstrādi.
      + Pārbauda, vai parole un paroles apstiprinājums ir iesniegts;
    + Ja kāds no laukiem nav iesniegts parāda 4. paziņojumu ar attiecīgo lauku nosaukumiem.
    + Pārbauda, vai jaunā parole atbilst drošības prasībām;
      + Ja nē, parāda 5. paziņojumu ar neizpildīto prasību sarastu. Beidz apstrādi.
    + Ģenerē "sāls" simbolu virkni ar noteiktu algoritmu, to pievieno parolei.
    + Šifrē paroli ar jaucējfunkciju.
    + Ieraksta marķiera derīguma termiņu pamaina uz tagadējo laiku;
    + Atjaunoto lietotāja ierakstu ieraksta datubāzē.
      + Ja ierakstīšana neizdevās, parāda 3. paziņojumu.
  ],
  [
    Izvades datu mērķis ir lietotāja informēšana par paroles atjaunošanas stāvokli. Lietotāja saskarnē parādās 6. paziņojums.
    + Paroles atjaunošanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Paroles atjaunošanas marķieris nav norādīts!
    + Paroles atjaunošanas marķieris nav derīgs!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + Parolei ir jāsatur: [neizpildīto paroles prasību saraksts]!
    + Paroles atjaunošana ir veiksmīga!
  ],
) <AMF04>

#function-table(
  "Lietotāja atteikšanās",
  "AMF05",
  "Funkcijas mērķis ir pārtraukt lietotāja pārlūkprogrammas sasaisti ar noteiktu lietotāju kontu.",
  [
    Ievades dati tiek saņemti no lietotāja -- klikšķis uz atteikšanās pogu.

    Obligātie parametri:
    + Lietotāja sesijas marķieris -- atbilst #link(<IIDP17>)[IIDP17]\.
  ],
  [
    + No lietotāja pārlūkprogrammas tiek iegūts sesijas marķieris;
    + Izdzēš lietotāja sesijas ierakstu datubāzē.
      + Ja lietotāja sesijas ieraksta izdzēšana neizdevās. Parāda 1. paziņojumu. Beidz apstrādi.
    + Ja sesijas marķieris eksistē, tas tiek izdzēsts. Lietotājs tiek pāradresēts uz mājaslapas sākuma lapu.
      + Ja marķiera izdzēšana nav veiksmīga. Parāda 1. paziņojumu. Beidz apstrādi.
  ],
  "Izvades datu funkcijai nav. Lietotājs tiek pāradresēts mājaslapas sākuma lapā.",
  [
    + Atteikšanās neizdevās! Mēģiniet pārlādēt lapu vai mēģiniet vēlāk!
  ],
) <AMF05>

#function-table(
  "Lietotāja pieteikšanās",
  "AMF06",
  "Autentificēt lietotāju, lai sistēma to uztver kā lietotāju ar konkrēto sistēmas lomu un atļauj turpmākās sistēmas lomas darbības sistēmā.",
  [
    Ievades dati tiek saņemti no pieteikšanās veidlapas.

    Obligātie parametri:
    + E-pasta adrese vai segvārds -- atbilst #link(<IIDP05>)[IIDP05]\;
      + Ja tā neatbilst, tad tai jāatbilst sekojošām prasībām: atbilst #link(<IIDP10>)[IIDP10].
    + Parole -- simbolu virkne, atbilst #link(<IIDP06>)[IIDP06].
  ],
  [
    + Pārbauda vai visi obligātie lauki ir aizpildīti.
      + Ja kāds no laukiem nav aizpildīts, tad parāda 1. paziņojumu ar attiecīgiem laukiem.
    + Pārbauda, vai e-pasta adrese vai segvārds un parole satur tikai pieļaujamos simbolus;
      + Ja satur, tad iegūst izmantotos neatļautos simbolus, tad parāda 2. paziņojumu ar laukiem un simboliem. Beidz apstrādi.
    + Pārbauda, vai e-pasta adrese vai un parole nepārsniedz noteikto garumu;
      + Ja satur, tad iegūst pārsniegto garumu parametru sarakstu un parāda 3. paziņojumu ar laukiem un garumiem. Beidz apstrādi.
    + Iegūst lietotāja autentifikācijas datus no datubāzes, meklējot lietotājus pēc segvārdu vai e-pasta adreses;
      + Ja tāds lietotājs netika atrasts, parāda 4. paziņojumu. Beidz apstrādi.
    + Pievieno ievades datu parolei sāls simbolu virkni;
    + Pārbauda, vai lietotāja sniegtā paroles jaucējfunkcijas rezultāts sakrīt ar datubāzē glabātu vērtību;
      + Ja paroles jaucējfunkcijas rezultāts nesakrīt ar datubāzē glabāto vērtību nesakrīt, parāda 5. paziņojumu. Beidz apstrādi.
    + Ja sakrīt, ģenerē lietotāja sesijas marķieri, kas atbilst #link(<IIDP17>)[IIDP17] prasībām. Saglabā marķieri kā sīkdatni lietotāja pārlūkprogrammas datu krātuvē un saglabā lietotāja sesiju datubāzē ar noteiktu derīgumu termiņu.
      + Ja saglabāšana neizdodas, parāda 6. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir noteikt, vai lietotājs tiks pāradresēts un kurā lapā lietotājs tiks pāradresēts. Lietotāja saskarnē lietotājs tiek pāradresēts uz autentificēto lietotāju sākuma lapu.
    + Paroles atjaunošanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!;
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!;
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!;
    + Lietotājs ar šādu segvārdu vai e-pastu netika atrasts vai parole nav pareiza!
    + Lietotājvārds, e-pasts vai parole nav korekti!
    + Atteikšanās neizdevās! Mēģiniet pārlādēt lapu vai mēģiniet vēlāk!
  ],
) <AMF06>

#function-table(
  "Lietotāja konta apstiprināšana",
  "AMF07",
  "Funkcijas mērķis ir apstiprināt lietotāja konta e-pasta adresi, i.e., apstiprināt to, ka lietotājam pieder norādītā e-pasta adrese.",
  [
    Ievaddati tiek iegūti no apstiprinājuma vietrādes parametriem, ar kuras lietotājs piekļūst funkcijai.

    Obligātie parametri:
    + E-pasta apstiprinājuma marķieris -- atbilst #link(<IIDP17>)[IIDP17].
  ],
  [
    + Pārbauda, vai ievades datos ir e-pasta apstiprinājuma marķieris;
      + Ja tā nav, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai e-pasta adreses apstiprinājuma marķieris atbilst sagaidāmam garumam;
      + Ja neatbilst, parāda 2. paziņojumu. Beidz apstrādi.
    + Meklē datubāzē lietotājus ar iesniegto marķieri;
      + Ja tāds lietotājs netiek atrasts, parāda 2. paziņojumu. Beidz apstrādi;
      + Ja datubāzē atrastā lietotāja e-pasta apstiprināšanas karodziņš apzīmē apstiprinātu e-pastu, parāda 3. paziņojumu. Beidz apstrādi.
    + Ierakstam pamaina e-pasta apstiprinājuma karodziņa stāvokli uz "patiess".
    + Atjaunoto lietotāja ierakstu ieraksta datubāzē.
      + Ja ierakstīšana neizdevās, parāda 5. paziņojumu.
  ],
  [
    Izvades datu mērķis ir lietotāja informēšana par konta apstiprināšanas stāvokli. Lietotājam tiek parādīts 4. paziņojums.
    + E-pasta adreses apstiprinājuma stāvoklis -- skaitlisks kods.
  ],
  [
    + Apstiprināšanas saite nav korekta: marķieris nav norādīts! Mēģiniet vēlreiz vai pieprasiet atkārtotu apstiprinājuma ziņas izsūtīšanu!;
    + Marķieris nav aktuāls vai nav korekts! Mēģiniet vēlreiz vai pieprasiet atkārtotu apstiprinājuma ziņas izsūtīšanu!;
    + E-pasts jau ir apstiprināts!;
    + E-pasts ir veiksmīgi apstiprināts!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!

  ],
) <AMF07>

=== Lietotāju kontu modulis

#indent-par([
  Apakšnodaļa ietver lietotāju konta moduļa funkcijas. Moduļa funkcionalitāte ir izmantota lietotāju kontu pārskatam un darbībām ar lietotāju kontiem. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-user).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<LKMF01>)[LKMF01],
  #link(<LKMF02>)[LKMF02],
  #link(<LKMF03>)[LKMF03],
  #link(<LKMF04>)[LKMF04],
  #link(<LKMF05>)[LKMF05]).
])

#figure(
  caption: "Lietotāju kontu moduļa 2. līmeņa DPD",
  image("img/dpd2/LietotājuKontuModulis.svg"),
) <dpd-2-user>

#pagebreak(weak: true)
#function-table(
  "Lietotāju profilu pārskats",
  "LKMF01",
  "Funkcijas mērķis ir lietotājiem sniegt citu lietotāju profilu publisku informāciju. Funkcijas ietvaros var tikt veikta neobligāta meklēšana pēc noteiktiem lietotāja profilu atribūtiem.",
  [
    Ievades datus iegūst no lietotāja neobligāti uzstādītiem filtriem, kārtošanas izvēles un lappuses numura un meklēšanas uzvednes. Parametri atbilst attiecīgām saitēm un ievades laukam lietotāja saskarnē un izvēlnēm pārskata lapās. Parametru vērtības tiek iegūtas no vietrādes parametriem.

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1;
    + Meklēšanas uzvedne -- simbolu virkne, atbilst #link(<IIDP14>)[IIDP14], noklusētā vērtība -- "".
    + Kārtošanas vārdnīcu saraksts - atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
  ],
  [
    + Sāk gatavot datubāzes pieprasījumu no lietotāju tabulas;
    + Sagatavo pārskata pieprasījumu un iegūst lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru, meklēšanas uzvedni, kārtošanas vārdnīcu sarakstu, filtru vārdnīcu sarakstu, šos parametrus iesniedzot, ja tie ir iesniegti funkcijā;
      + Ja lappušu skaits ir 0, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Veic sagatavoto pieprasījumu, iegūstot lietotāja segvārdu, lietotāja konta izveidošanas laiku (lietotāja pievienošanās laiku), lietotāja attēla datnes adresi;
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
    + Katram ierakstam no rezultāta, iegūst atrastais attēla datnes adresi no attēlu tabulas pēc attēla identifikatora.
      + Ja attēla datnes adrese neeksistē ierakstam, tad iegūst noklusētā attēla datnes adresi un samaina ieraksta datnes adresi izvades datos uz noklusētā datnes attēla adresi.
  ],
  [
    Izvades datu mērķis ir parādīt rezultāta pārskatu lietotāja saskarnē. Lietotāja saskarnē tiek prezentēti dati no sagatavotā saraksta.
    + Pārskata ierakstu saraksts, kas sastāv no vārdnīcām:
      + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Segvārds -- atbilst #link(<IIDP07>)[IIDP07];
      + Lietotāja konta izveidošanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Lietotāja attēls -- atbilst #link(<IIDP08>)[IIDP08]\.
    + Kārtošanas vārdnīcu saraksts -- atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
    + Kopējais lapu skaits -- vesels pozitīvs skaitlis;
    + Tekošā lappuse -- vesels pozitīvs skaitlis, kas ir mazāks vai vienāds par lapu skaitu;
  ],
  [
    + Netika atrasts neviens lietotājs!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <LKMF01>

#function-table(
  "Lietotāja konta detaļas",
  "LKMF02",
  "Funkcijas mērķis ir reģistrētiem lietotājiem saņemt informāciju par kontu -- gan publisko, gan privāto (atkarībā no lietotāja lomas un konta piederības). Administratoriem visa informācija ir iegūstama par jebkuru lietotāju.",
  [
    Ievades datus iegūst no vietrāža parametriem, caur kuru tiek piekļūts funkcijai. Alternatīvi, dati (lietotāja identifikators) tiek iegūti no konteksta.

    Neobligātie parametri:
    + Apskatāmo konta datu lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10], noklusētā vērtība -- no konteksta lietotāja (kas piekļūst funkciju) iegūtais identifikators.
  ],
  [
    + Sāk gatavot datubāzes pieprasījumu no lietotāju tabulas.
    + Sagatavo pieprasīto lauku sarakstu:
      + Vārds un uzvārds;
      + Segvārds;
      + Biogrāfijas informācija;
      + Dzimšanas datums;
      + Konta izveidošanas laiks;
      + Attēls (datnes adrese).
    + Autorizē administratora darbību. Ja darbība ir autorizēta, tad pie saraksta pievieno lietotāja konta stāvokli, vai lietotājs ir administrators.
    + Ja lietotājam pieder pieprasījuma konts vai administratora darbība tika autorizēta, sarakstam pievieno sekojošos atribūtus:
      + E-pasta adresi;
      + E-pasta apstiprinājuma stāvokli.
    + Veic sagatavoto pieprasījumu, pieprasot iepriekš sagatavoto lauku sarakstu, attēla datnes adreses;
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
      + Ja lietotājs netika atrasts, parāda 3. paziņojumu. Beidz apstrādi.
    + Ja attēla datnes adrese neeksistē, tad iegūst noklusētā attēla datnes adresi.
  ],
  [
    Izvades datu mērķis ir lietotāja konta datu parādīšana. Lietotāja saskarnē tiek prezentēti konta dati, kas atbilst lietotājam paredzamai datu kopai.

    Pamata vārdnīcas saturs:
    + Vārds un uzvārds -- atbilst #link(<IIDP04>)[IIDP04]\;
    + Segvārds -- atbilst #link(<IIDP07>)[IIDP07]\;
    + Biogrāfiskā informācija -- atbilst #link(<IIDP09>)[IIDP09]\;
    + Dzimšanas datums -- atbilst #link(<IIDP01>)[IIDP01]\;
    + Konta izveidošanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
    + Lietotāja profila attēls -- atbilst #link(<IIDP08>)[IIDP08].
    Papildus vārdnīcas dati, ja pieprasītājs lietotājs ir administrators vai konts pieder lietotājam:
    + E-pasta adrese -- atbilst #link(<IIDP05>)[IIDP05]\;
    + E-pasta apstiprinājuma stāvoklis -- karodziņš.
    Papildus vārdnīcas dati, ja pieprasītājs lietotājs ir administrators:
    + Konta stāvoklis -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Vai lietotājs ir administrators -- karodziņš.
  ],
  [
    + Darbība nav autorizēta!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Tāds lietotājs nav atrasts! Mēģiniet vēlreiz!
  ],
) <LKMF02>

#function-table(
  "Lietotāja konta bloķēšana",
  "LKMF03",
  "Funkcijas mērķis ir bloķēt lietotāja kontu, ja notikuši drošības pārkāpumi vai cita veida noteikumu pārkāpumi.",
  [
    Ievades datus iegūst no veicamās darbības -- klikšķis uz lietotāja bloķēšanas pogu.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Meklē lietotāja ierakstu datubāzē, meklējot to pēc identifikatora.
      + Ja lietotāja ieraksts netika atrasts, parāda 2. paziņojumu. Beidz apstrādi.
    + Autorizē administratora darbību.
      + Ja darbība netika autorizēta, parāda 2 paziņojumu. Beidz apstrādi.
    + Maina lietotāja konta stāvokli uz stāvokli, kas atbilst bloķētam lietotājam.
      + Ja ierakstīšana nav veiksmīga, parāda 4. paziņojumu.
  ],
  [
    Izvades mērķis ir atjaunot lietotāja stāvokli lietotāja saskarnē. Ja ierakstīšana ir veiksmīga, parāda 3. paziņojumu.
    + Konta bloķēšanas stāvoklis -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Lietotājs ar norādītu identifikatoru neeksistē!
    + Darbība nav autorizēta!
    + Konts veiksmīgi bloķēts!
    + Sistēmas iekšējā kļūda, konts nav bloķēts!
  ],
) <LKMF03>

#pagebreak(weak: true)
#function-table(
  "Lietotāja konta rediģēšana",
  "LKMF04",
  "Funkcijas mērķis ir rediģēt lietotāju konta datus, kas ir rediģējami. Administratoriem rediģēt dažus laukus, kuru rediģēšana nav pieejama lietotājiem, kas nav administratori.",
  [
    Ievades dati tiek saņemti no reģistrēto un autentificēto lietotāju pieejamās veidlapas.

    Obligātie parametri:
    + Pilns vārds -- atbilst #link(<IIDP04>)[IIDP04]\;
    + Segvārds -- atbilst #link(<IIDP07>)[IIDP07]\;
    + E-pasta adrese -- atbilst #link(<IIDP05>)[IIDP05]\;
    + Biogrāfiskā informācija -- atbilst #link(<IIDP09>)[IIDP09]\;
    + Dzimšanas datums -- atbilst #link(<IIDP01>)[IIDP01]\;.

    Administratoram specifiskie obligātie parametri:
    + Konta izveidošanas laiks -- datums, atbilst #link(<IIDP02>)[IIDP02]\.
    + E-pasta apstiprinājums -- karodziņš;
    + Konta stāvokļa kods -- atbilst #link(<IIDP10>)[IIDP10]\.
    // + Vai ir administrators -- karodziņš.

    Neobligātie parametri:
    + Konta datu lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10], noklusētā vērtība -- no konteksta lietotāja (kas piekļūst funkciju) iegūtais identifikators.
    + Vecā parole -- atbilst #link(<IIDP06>)[IIDP06], noklusētā vērtība -- "".
    + Jaunā parole -- atbilst #link(<IIDP06>)[IIDP06], noklusētā vērtība -- "".
    + Jaunās paroles apstiprinājums -- atbilst #link(<IIDP06>)[IIDP06], noklusētā vērtība -- "".
  ],
  [
    // Autorizācija
    + Ja lietotājs nav administrators un lietotāja identifikators nesakrīt ar pieprasītāja lietotāja identifikatoru, parādīt 1. paziņojumu. Beidz apstrādi.
    + Veido izmainīto datu sarakstu pēc turpmāk izmainītiem laukiem.

    // Datu validācija
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja tie nav, iegūst sarakstu ar neaizpildītajiem laukiem, parāda 2. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai pilns vārds, segvārds, e-pasta adrese, biogrāfiskā informācija satur tikai pieļaujamos simbolus.
      + Ja satur, tad iegūst izmantotos neatļautos simbolus, tad parāda 4. paziņojumu ar attiecīgi laukiem un simboliem. Beidz apstrādi.
    + Pārbauda, vai dzimšanas datumam ir korekts formāts.
      + Ja nav korekts, parāda 17. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai dzimšanas datums atbilst noteiktam minimālam lietotāja vecumam.
      + Ja neatbilst, parāda 7. paziņojumu.
    + Pārbauda, vai pilns vārds, segvārds, e-pasta adrese, biogrāfiskā informācija, parole nepārsniedz noteikto garumu.
      + Ja satur, tad iegūst pārsniegto garumu parametru sarakstu un parāda 5. paziņojumu ar attiecīgi laukiem un garumiem. Beidz apstrādi.
    + Pārbauda, vai parole un paroles apstiprinājums sakrīt.
      + Ja nesakrīt, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Pievieno atjaunoto atribūtu vērtības sarakstam.

    // Sanitizācija / Transformācija
    // Biogrāfiskā informācija
    + Sanitizē biogrāfisko informāciju, izmantojot #link(<KPR09>)[KPR09]\.

      // Paroles apstrāde
    + Ja jaunā parole tika iesniegta, pārbauda, vai parole atbilst noteiktām drošības prasībām.
      + Ja tā tiem neatbilst, tad parāda 6. paziņojumu ar attiecīgām neizpildītajām prasībām. Beidz apstrādi.
    + Ģenerē "sāls" simbolu virkni ar noteiktu algoritmu, to pievieno parolei.
    + Šifrē paroli ar jaucējfunkciju.

      // Image
    + Ja tika iesniegts attēls, validē attēlu ar #link(<KPR12>)[KPR12] un uzstāda pievienošanas laiku uz tagadējo laiku.
      + Ja validācija ir neveiksmīga, parāda 8. paziņojumu ar attiecīgu validācijas kļūdu.
    + Citādi saglabā vecā attēla datni, ja tāda ir.

    // Uniqueness check
    + Ja tika iesniegts atšķirīgs segvārds, mēģina meklēt datubāzē lietotājus ar ievadīto segvārdu.
      + Ja tāds (/-i) pastāv, tad parāda 10. paziņojumu ar attiecīgo aizņemto lauku. Beidz apstrādi. Beidz apstrādi.
    + Ja tika iesniegts atšķirīgs e-pasts, mēģina meklēt datubāzē lietotājus ar ievadīto e-pastu.
      + Ja tāds (/-i) pastāv, tad parāda 10. paziņojumu ar attiecīgo aizņemto lauku. Beidz apstrādi. Beidz apstrādi.

    // Admin specific
    + Autorizē administratora darbību. Ja darbība ir autorizēta, veic sekojošās darbības.
      + Pārbauda, vai izveidošanas laikam ir korekts formāts.
        + Ja nav, parāda 12. paziņojumu. Beidz apstrādi.
      + Pārbauda vai konta stāvokļa kods atbilst definētiem stāvokļa kodiem.
        + Ja neatbilst, parāda 12. paziņojumu. Beidz apstrādi.
      + Pārbauda, vai datums ir pagātnē vai tagad.
        + Ja datums ir nākotnē, parāda 17. paziņojumu. Beidz apstrādi.
      + Pārbauda vai e-pasta apstiprinājuma karodziņš ir korekts.
        + Ja neatbilst, parāda 8. paziņojumu. Beidz apstrādi.
      + Pievieno atjaunoto atribūtu vērtības sarakstam.
      /*+ Ja administratora karodziņš ir "patiess".
                                                                                                                          + No datubāzes noskaidro, vai lietotājs ir administrators.
                                                                                                                            + Ja lietotājs nav administrators, piešķir lietotājam administratora tiesības.
                                                                                                                        + Ja administratora karodziņš ir "nepatiess".
                                                                                                                          + No datubāzes noskaidro, vai lietotājs ir administrators.
                                                                                                                            + Ja lietotājs ir administrators, noņem lietotājam administratora tiesības.*/

    // Save
    + Lietotāja konta sagatavotie dati -- lauki, kas ir rediģēto lauku sarakstā, tiek ierakstīti datubāzē.
      + Ja ierakstīšana nenotiek, parādīt 11. paziņojumu. Beidz apstrādi.
    + Izdzēš veco attēlu ar saglabāto vecā attēla datni.
  ],
  [
    Izvades datu mērķis ir noteikt rediģēšanas konta stāvokli.
    + Konta rediģēšanas apstiprinājuma stāvoklis -- skaitlisks kods.
  ],
  [
    + Darbība nav autorizēta!
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + Parole un paroles apstiprinājums nesakrīt!
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!
    + Parolei ir jāsatur: [neizpildīto paroles prasību saraksts]!
    + Minimālais vecums reģistrācijai: [noteikts minimālais vecums reģistrācijai].
    + E-pasta apstiprinājuma karodziņš nav korekts!
    + Šo attēlu nedrīkst izmantot: [validācijas kļūda\]!
    + Lietotājs ar tādu [aizņemtā lauka nosaukums] jau eksistē!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Nekorekts laiks! Laika formāts: [nepieciešamais laika formāts].
    + Izveidošanas laiks nedrīkst būt nākotnē!
    + Lietotāja stāvokļa kods nav korekts!
    + Konta rediģēšana ir veiksmīga!
    + Tāds konta stāvoklis neeksistē!
    + Nekorekts datums! Datuma formāts: [nepieciešamais datuma formāts].
  ],
) <LKMF04>

#function-table(
  "Lietotāja konta dzēšana",
  "LKMF05",
  "Funkcijas mērķis ir dzēst lietotāju kontus, lai to konta informācija būtu neatgriezeniski izdzēsta.",
  [
    Ievades dati tiek saņemti no reģistrēto lietotāju pieejamās darbības. Alternatīvi, dati tiek iegūti no konteksta (autentificēta lietotāja identifikators).

    Neobligātie parametri:
    + Konta datu lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]. Noklusētā vērtība -- no konkrēta lietotāja (kas piekļūst funkciju) iegūtais identifikators.
  ],
  [
    + Autorizē administratora darbību.
      + Ja darbība ir autorizēta, parādīt 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai lietotājs ar tādu identifikatoru eksistē.
      + Ja neeksistē, parāda 2. paziņojumu. Beidz apstrādi.
    + Saglabā veco lietotāja attēla datnes adresi, ja tāda ir.
    + Lietotāja ierakstu izdzēš.
      + Ja izdzēšana nav veiksmīga, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja izdzēšana ir veiksmīga, parāda 4. paziņojumu. Beidz apstrādi.
    + Izdzēš lietotāja konta attēla datni.

  ],
  [
    Izvades datu mērķis ir noteikt, vai lietotājs tiks pāradresēts.
    + Lietotāja konta dzēšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Darbība nav autorizēta!
    + Tāds lietotājs nav atrasts!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Lietotāja deaktivizēšana ir veiksmīga!
  ],
) <LKMF05>

=== Maksas abonementu modulis

#indent-par([
  Apakšnodaļa ietver maksas abonementa moduļa funkcijas. Moduļa funkcionalitāte ir izmantota darbībām ar lietotāju maksas abonementiem. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-premium-user).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<MAMF01>)[MAMF01],
  #link(<MAMF02>)[MAMF02],
  #link(<MAMF03>)[MAMF03],
  #link(<MAMF04>)[MAMF04]).
])

#figure(
  caption: "Maksas abonementu moduļa 2. līmeņa DPD",
  image("img/dpd2/MaksasAbonementaModulis.svg"),
) <dpd-2-premium-user>

#function-table(
  "Abonementa pieteikums",
  "MAMF01",
  "Funkcijas mērķis ir izveidot maksājuma pieteikumu maksas abonementam, izveidojot maksas abonementa ierakstu datubāzē maksājuma apstiprināšanas gadījumā.",
  [
    Ievades dati tiek iegūti no lietotāja maksājuma pieteikuma veidlapas, apmaksājot abonementu.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Maksājuma plāna identifikators -- atbilst #link(<IIDP22>)[IIDP22].
    // + Kartes īpašnieka vārds. Simbolu virkne, kas var saturēt lielo un mazos burtus (a-z, A-Z) no ASCII simbolu kopas, atstarpes, defīzes, apostrofus. Maksimālais simbolu skaits ir 100 simboli.
    // + Kartes numurs. Simbolu virkne, kas sastāv no cipariem un ir 16 simbolus gara.
    // + Kartes derīguma termiņš -- datuma simbola virkne, kas sastāv no gada un mēneša. Pieļaujamas tikai termiņi, kas nav pirms tekošā mēneša.
    // + Kartes drošības kods -- simbolu virkne no 3 cipariem.
  ],
  [
    /*+ Pārbauda, vai datubāzē neeksistē aktīvs abonements, kas ir saistīts ar lietotāja identifikatora, kas veido maksājuma pieteikumu.
                                                                                  + Ja eksistē, parāda 9. paziņojumu.*/
    /*+ Pārbauda, vai visi obligātie lauki ir iesniegti.
                                                                                  + Ja tie nav, iegūst sarakstu ar neaizpildītajiem laukiem, parāda 1. paziņojumu. Beidz apstrādi.
                                                                                + Pārbauda, vai visi obligātie lauki satur tikai pieļaujamos simbolus.
                                                                                  + Ja satur, tad iegūst izmantotos neatļautos simbolus, tad parāda 2. paziņojumu ar attiecīgajiem laukiem un izmantotiem aizliegtiem simboliem. Beidz apstrādi.
                                                                                + Pārbauda, vai veidlapas visi obligātie lauki nepārsniedz noteikto garumu.
                                                                                  + Ja satur, tad iegūst pārsniegto garumu parametru sarakstu un parāda 3. paziņojumu ar attiecīgi laukiem un garumiem. Beidz apstrādi.
                                                                                + Pārbauda, vai kartes numura pirmie 4 cipari atbilst vienai no bankām, ko apstrādā maksājumu apstrādātājs.
                                                                                  + Ja neatbilst, parāda 4. paziņojumu. Beidz apstrādi.
                                                                                + Pārbauda, vai kartes derīguma termiņš ir pēc tekošā mēneša.
                                                                                  + Ja tas ir pirms, parāda 5. paziņojumu. Beidz apstrādi.
                                                                                + Datubāzē meklē aktuālo šodienas cenu par abonementu, izmantojot tagadējo laiku.
                                                                                  + Ja cena netika atrasta, iegūst noklusējuma cenu.*/

    // https://stripe.com/docs/api/subscriptions/create
    + Pārbauda, vai pieprasītais abonementa plāns eksistē, pieprasot abonementa plāna informāciju no maksas apstrādātāja.
      + Ja neeksistē, parāda 5. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai datubāzē lietotājam eksistē ārējā maksas pakalpojuma izveidots identifikators.
      + Ja eksistē, pārbauda vai identifikators ir saistīts ar aktīvu lietotāju maksas apstrādātāja sistēmā, pieprasot klienta informāciju.
        + Pārbauda vai klientam nav abonēts šis plāns. Ja ir abonēts, parāda 4. paziņojumu. Beidz apstrādi.
      + Ja neeksistē vai eksistē un nav saistīts ar aktīvu lietotāju maksas apstrādātāja sistēmā, tad identifikatoru izveido, izmantojot #link(<KPR11>)[KPR11]. Saglabā izveidoto identifikatoru datubāzē.
        + Ja izveidošana neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
    + Sagatavo datus pieprasījumam, kas iekļauj lietotāja ārējā maksas pakalpojuma identifikatoru un maksājuma plāna identifikatoru. Pārveido tos maksājuma apstrādātāja pieprasītā formātā, izmantojot maksājumu apstrādātāja API.
    + Pieprasa abonementa izveidošanu, sazinoties ar maksājumu apstrādātāju.
      + Ja atbildē izveidošana netiek apstiprināta, parāda 2. paziņojumu. Beidz apstrādi.
    /*+ Ja abonementa izveidošana ir apstiprināta, izveido ierakstu ar abonementa datiem datubāzē:
                                                                                  + Sākuma laiks -- tagadējais laiks, atbilst #link(<IIDP02>)[IIDP02]\;
                                                                                  + Maksājumu periods -- noteikts maksājuma periods;
                                                                                  + Maksas abonementa stāvoklis -- stāvoklis, kas atbilst stāvoklim "atbilst".
                                                                                  + Maksājuma apstrādātāja atbildē saņemto klienta identifikators.*/
  ],
  [
    Izvades datu mērķis ir informēt, vai lietotājs tiks pāradresēts. Lietotāja saskarnē parāda 3. paziņojumu.
    + Abonementa izveidošanas apstiprinājuma stāvoklis -- skaitlisks kods.
  ],
  [
    /*+ Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
                                                                                + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!
                                                                                + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!
                                                                                + Kartes numurs nav korekts!
                                                                                + Kartes derīguma termiņš ir beidzies!*/
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Abonementa apmaksa nav veiksmīga! Mēģiniet vēlreiz vai sazinieties ar tehniskās palīdzības speciālistu!
    + Abonēšana ir veiksmīga!
    + Jums jau ir aktīvs abonements ar Jūsu izvēlēto plānu!
    + Jūsu pieteiktais abonementa plāns neeksistē!
  ],
) <MAMF01>

#function-table(
  "Abonementu pārskats",
  "MAMF02",
  "Funkcijas mērķis ir lietotājiem rādīt informāciju par maskas esošiem un bijušiem maksas abonementiem. Šī pārskata dati tiek kārtoti un filtrēti neobligātā kārtā.",
  [
    Ievades dati tiek saņemti no vietrāža parametriem.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].

    Neobligātie parametri:
    + Lappuses numurs -- pozitīvs skaitlis.
    + Kārtošanas vārdnīcu saraksts -- atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
  ],
  [
    // https://stripe.com/docs/api/subscriptions/list
    // + Sāk gatavot datubāzes pieprasījumu no maksas abonementu tabulas.
    + Autorizē administratora darbību.
      + Ja darbība nav autorizēta un pieprasītais lietotāja identifikators nesakrīt ar lietotāja identifikatoru, parāda 4. paziņojumu. Beidz apstrādi.
    + Iegūst maksas apstrādātāja klienta identifikatoru no datubāzes.
      + Ja tā vērtība atbilst nulles vērtībai, parāda 4. paziņojumu. Beidz apstrādi.
    + Sagatavo pārskata pieprasījumu, lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru, kārtošanas vārdnīcu sarakstu, filtru vārdnīcu sarakstu, šos parametrus iesniedzot, ja tie ir iesniegti funkcijā. Pārveido tos maksājuma apstrādātāja pieprasītā formātā, izmantojot maksājumu apstrādātāja API.
      + Ja identifikators neeksistē, tad izveido to, #link(<KPR11>)[KPR11], un mēģina vēlreiz.
      + Ja lappušu skaits ir 0, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Pieprasa lietotāja abonementu sarakstu, sazinoties ar maksājumu apstrādātāju. Sarakstu pārveido vārdnīcu sarakstu ar sekojošām atslēgām:
      + Maksājuma plāna identifikators\;
      + Abonementa stāvoklis\;
      + Sākuma laiks\;
      + Beigu laiks\;
      + Atteikuma laiks\;
      + Pēdējais norēķina laiks\;
      + Nākamā norēķina laiks\;
      + Cena\;
      + Valūta\;
      + Apraksts\.
    + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir parādīt pārskatu, ņemot vērā filtrus un kārtošanu, ja tas tika pieprasīts. Kā arī izvadīt datus abonementa atcelšanai.
    Lietotāja saskarnē tiek prezentēti dati no sagatavotā saraksta.

    + Vārdnīcu saraksts:
      + Maksājuma plāna identifikators -- atbilst #link(<IIDP22>)[IIDP22]\;
      + Abonementa stāvoklis -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Sākuma laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Beigu laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Atteikuma laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Pēdējais norēķina laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Nākamā norēķina laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Cena -- atbilst #link(<IIDP15>)[IIDP15]\;
      + Valūta -- uzskatījums, atbilst ISO 4217 valūtas kodam;
      + Apraksts -- simbolu virkne.
    /* + Papildus vārdnīcu dati administratoriem:
                                                                                    + Maksājumu apstrādātāja klienta identifikators -- vesels pozitīvs skaitlis;*/

    + Lappušu skaits -- pozitīvs skaitlis.
    + Tekošā lappuse -- pozitīvs skaitlis, kas ir mazāks vai vienāds par lapu skaitu.
  ],
  [
    + Netika atrasts neviens abonements!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Darbība nav autorizēta!
    + Jums nav aktīva abonementa!
  ],
) <MAMF02>

#function-table(
  "Abonementa atcelšana",
  "MAMF03",
  "Funkcijas mērķis ir atcelt lietotājam, kam ir aktīvs maksas abonementi. Maksājuma apstrādātāja abonements tiks atcelts, kā rezultātā no lietotāja vairs nebūs iekasēti maksājumi. Abonementa stāvoklis sistēmā būs apzīmēts kā atcelts.",
  [
    Ievades dati tiek iegūti no darbības abonementu pārskatā.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    //+ Maksājuma apstrādātāja klienta identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Maksājuma plāna identifikators -- atbilst #link(<IIDP22>)[IIDP22].

    Neobligātie parametri:
    + Atcelšanas iemesls -- simbolu virkne.
  ],
  [
    /*+ Datubāzē meklē maksas abonementa ierakstu, pēc maksas apstrādātāja klienta identifikatora.
                                                                                  + Ja tāds neeksistē, parāda 1. paziņojumu. Beidz apstrādi.
                                                                                  + Ja lietotāja idendifikators neatbilst ieraksta identifikatoram, parāda 2. paziņojumu. Beidz apstrādi.
                                                                                  */

    + Iegūst maksas apstrādātāja klienta identifikatoru no datubāzes.
      + Ja tā vērtība atbilst nulles vērtībai, parāda 3. paziņojumu. Beidz apstrādi.
    + Sagatavo datus pieprasījumam, kas iekļauj lietotāja ārējā maksas pakalpojuma identifikatoru, maksājuma plāna identifikatoru un atcelšanas iemeslu. Pārveido tos maksājuma apstrādātāja pieprasītā formātā, izmantojot maksājumu apstrādātāja API.
    + Pieprasa abonementa atcelšanu, sazinoties ar maksājumu apstrādātāju.
      + Ja atbildē atcelšana netiek apstiprināta, parāda 1. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē lietotāja ierakstu.
      + Izdzēš klienta identifikatoru no lietotāja ieraksta.

    /*+ Izmantojot maksājumu apstrādātāja klienta identifikatoru, pieprasa abonementa atcelšanu, izmantojot maksājuma apstrādātāja API.
                                                                                  + Ja maksājuma apstrādāja atbilde norāda, ka atcelšana neizdevusies. Parāda 1. paziņojumu. Beidz apstrādi.
                                                                                + Ja maksājuma apstrādātāja atbilde norāda, ka abonementa atcelšana ir veiksmīga, attiecīgā datubāzes ieraksta stāvokli nomaina uz stāvokli, kas apzīmē atceltu abonementu. */
  ],
  [
    Izvades datu mērķis ir noteikt, vai abonementa atcelšana bija veiksmīga. Lietotāja saskarnē parāda 2. paziņojumu.
    + Abonementa atcelšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Neizdevās atcelt abonementu! Mēģiniet vēlreiz vai sazinieties ar tehniskās palīdzības speciālistu!
    + Abonements ir veiksmīgi atcelts!
    + Jums nav aktīva abonementa!
  ],
) <MAMF03>

#function-table(
  "Abonementu plānu pārskats",
  "MAMF04",
  "Funkcijas mērķis ir lietotājiem sniegt pārskatu par pieejamajiem abonementu plāniem.",
  [
    Neobligātie parametri:
    + Vai ir aktīva -- Bula mainīgais, noklusētā vērtība -- "patiess";
    + Izveides datums -- atbilst #link(<IIDP02>)[IIDP02], noklusētā vērtība -- 0;
    + Ierobežojums -- vesels pozitīvs skaitlis, no 1 līdz 100, noklusētā vērtība -- 10;
  ],
  [
    // https://stripe.com/docs/api/plans/list
    + Sagatavo datus pieprasījumam. Pārveido tos maksājuma apstrādātāja pieprasītā formātā, izmantojot maksājumu apstrādātāja API.
    + Pieprasa abonementa plānu sarakstu, sazinoties ar maksājumu apstrādātāju.
      + Ja pieprasījums neizdodas, parāda 1. paziņojumu. Beidz apstrādi.
    + Iegūto plānu sarakstu pārveido vārdnīcu sarakstā ar sekojošām atslēgām:
      + Maksājuma plāna identifikators\;
      + Izveidošanas laiks\;
      + Abonementa stāvoklis\;
      + Cena\;
      + Valūta\;
      + Maksāšanas periods\;
        + Diena;
        + Nedēļa;
        + Mēnesis;
        + Gads.
      + Plāna segvārds\;
      + Apraksts\.
  ],
  [
    Izvades datu mērķis ir parādīt abonementu plānu pārskatu.
    Lietotāja saskarnē tiek prezentēti dati no sagatavotā saraksta.

    + Vārdnīcu saraksts:
      + Maksājuma plāna identifikators -- atbilst #link(<IIDP22>)[IIDP22]\;
      + Izveidošanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Abonementa stāvoklis -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Cena -- atbilst #link(<IIDP15>)[IIDP15]\;
      + Valūta -- uzskatījums, atbilst ISO 4217 valūtas kodam;
      + Maksāšanas periods -- uzskaitījums ar vienu no vērtībām:
        + Diena;
        + Nedēļa;
        + Mēnesis;
        + Gads.
      + Plāna segvārds -- simbolu virkne; // Īss plāna apraksts, kas ir paslēpts no lietotājiem;
      + Apraksts -- simbolu virkne.
  ],
  [
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <MAMF04>

=== Tērzēšanas modulis

#indent-par([
  Apakšnodaļa ietver tērzēšanas moduļa funkcijas. Moduļa funkcionalitāte ir izmantota iekšspēles tērzēšanas nodrošināšanai. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-chat).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<TMF01>)[TMF01],
  #link(<TMF02>)[TMF02],
  #link(<TMF03>)[TMF03],
  #link(<TMF04>)[TMF04]).
])

#figure(
  caption: "Tēržēšanas moduļa 2. līmeņa DPD",
  image("img/dpd2/TerzēšanasModulis.svg"),
) <dpd-2-chat>

#function-table(
  "Jaunas sarakstes izveidošana",
  "TMF01",
  "Funkcijas mērķis ir dot iespēju rakstiskā veidā sazināties spēlētājam ar citiem klātesošajiem spēlētājiem vienas spēles istabas ietvaros.",
  [
    Ievade tiek saņemta no teksta ievades lauciņa spēlētāju tērzētavā.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Sarakstes teksts -- atbilst #link(<IIDP16>)[IIDP16]\;
    + Vai sarakste ir mafijas tērzētavā -- karodziņš.

    Neobligātie parametri:
    + Atbildes saņēmēja sarakstes identifikators - atbilst atbilst #link(<IIDP10>)[IIDP10]\;
  ],
  [
    + Pārbauda, vai sarakstes teksts nav tukša simbolu virkne.
      + Ja ir tukša, parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai sarakstes teksts nepārsniedz maksimālo simbolu skaitu.
      + Ja pārsniedz, parāda 2. paziņojumu ar attiecīgo maksimālo pieļauto garumu. Beidz apstrādi.
    + Izmantojot #link(<KPR02>)[KPR02] procedūru pārbauda, vai spēlētājs, lietotājs un spēles istaba eksistē un ir savstarpēji saistīti.
      + Ja nav, parāda 3. paziņojumu. Beidz apstrādi.
    + Ja spēlētais ir neaktīvs, izslēgts, vai kāds no atribūtiem, kas apzīmē spēles beigas spēlētājiem ir "patiess", parāda 6. paziņojumu. Beidz apstrādi.
    + Izmantojot #link(<KPR03>)[KPR03] procedūru pārbauda, vai spēlētājs pieder mafijai un ja "vai sarakste ir mafijas tērzētavā" karodziņš ir "patiess", uzstāda attiecīgo ieraksta karodziņa vērtību.
      + Ja spēlētājs nepieder mafijai, parāda 4. paziņojumi. Beidz apstrādi.
    + Ja atbildes sarakstes identifikators ir iesniegts, meklē atbildes sarakstes ar atbildes sarakstu identifikatoru.
      + Ja sarakste ierakstu neatrod, parāda 5. paziņojumu. Beidz apstrādi.
    + Sagatavoto sarakstes ierakstu.
    + Ieraksta saraksti datubāzē.
      + Ja ierakstīšana neizdevās, parāda 3. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir norādīt izveidotās ziņas stāvokli.
    + Ziņas sūtīšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Sarakste ir tukša!
    + Ziņas garums pārsniedz maksimāli atļauto garumu: [maksimāli atļautais garums]!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Jūsu loma neatļauj piedalīties mafijas tērzēšanā!
    + Atbildes sarakste netika atrasta!
    + Jūs nevarat izveidot jaunu saraksti!
  ],
) <TMF01>

#function-table(
  "Sarakstes izdzēšana",
  "TMF02",
  "Funkcija atbild par netīšām uzrakstītām ziņām, kuras spēlētāji vēlas izdzēst, pēc ziņu nosūtīšanas vai atbild par nekorektu vai neobjektīvi pareizu ziņu izdzēšanu.",
  [
    Ievade tiek iegūta no ziņas izdzēšanas darbības tērzētavā.
    + Sarakstes identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Meklē datubāzē sarakstes ierakstu, izmantojot sarakstes identifikatoru.
      + Ja tas netika atrasts, parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai lietotāja identifikators sakrīt ar sarakstes ieraksta lietotāja identifikatoru.
      + Ja tas nesakrīt, autentificē administratora darbību.
      + Ja darbības netika autentificēta, parāda 2. paziņojumu. Beidz apstrādi.
    + No datubāzes izdzēš sarakstes ierakstu.
      + Ja dzēšana ir veiksmīga, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja nav veiksmīga, parāda 4. paziņojumu. Beidz apstrādi.
  ],
  "Izdzēstā ziņa no sarakstes uzskaites ir pazudusi. Parādās par izdzēsto saraksti.",
  [
    + Dzēšamā sarakste netika atrasta!
    + Ir iespējams dzēst tikai savas sarakstes!
    + Ziņa ir veiksmīgi izdzēsta!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <TMF02>

#function-table(
  "Sarakstu pārskats",
  "TMF03",
  "Funkcija nepieciešama, lai uzskaitītu un parādītu visas uzrakstītās sarakstes visās tērzētavās (mafijas un parastās). Tā kā pieprasīto sarakstu skaits var atšķirties saskarnēs -- tas tiek noteikts ar papildus parametru.",
  [
    Ievade tiek saņemta no spēles istabas konteksta.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Pieprasīto ierakstu skaits -- vesels pozitīvs skaitlis;
    + Lappuses numurs -- vesels pozitīvs skaitlis;
    + Vai ir mafijas tērzētava -- karodziņš.

    Neobligātie parametri:
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10], noklusētā vērtība -- 0\;
  ],
  [
    + Izmantojot #link(<KPR02>)[KPR02] procedūru pārbauda, vai spēlētājs, lietotājs un spēles istaba eksistē un ir savstarpēji saistīti.
      + Ja nav saistīti, veic administratora darbības autorizāciju.
      + Ja darbība nav autorizēta, parāda 2. paziņojumu. Beidz apstrādi.
      + Ja darbība ir autorizēta, izlaiž apstrādes 2. soli.
    + Meklē spēlētāja ierakstu un ar to saistītu spēles lomas un spēles istabas ierakstu pēc attiecīgajiem identifikatoriem.
      + Ja kāds no ierakstiem netika atrasts, parāda 2. paziņojumu.
      + Ja spēlētāja stāvoklis neatbilst aktīvam, no spēles neizslēgtam spēlētājam, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja mafijas tērzēšanas karodziņš ir "patiess" un spēlētāja loma nepieder mafijai, parāda 2. paziņojumu.
    + Sāk gatavot datubāzes pieprasījumu no sarakstu tabulas.
    + Pievieno pieprasījumam atlasīšanu attiecīgi mafijas tērzēšanas parametra-karodziņa vērtībai.
    + Pieprasa rezultātu saskaitīšanu.
      + Ja pieprasījums neizdodas, parāda 1. paziņojumu.
    + Pievieno pieprasījumam nepieciešamo nobīdi lappusei, izmantojot #link(<KPR01>)[KPR01] procedūru ar pieprasīto ierakstu skaitu.
    + Veic sagatavoto pieprasījumu, iegūstot īsziņas tekstus, sarakstes adresāta identifikatorus.
      + Ja pieprasījums neizdodas, parāda 1. paziņojumu. Beidz apstrādi.
    + Meklē saraksti attēlošanas nepieciešamo spēlētāju segvārdus, meklējot attiecīgos lietotāju un spēlētāju ierakstus datubāzē, izmantojot attiecīgos spēlētāju un lietotāju identifikatorus.
      + Ja, kāds no nepieciešamiem ierakstiem netika atrasts, aizvieto neatrasto informāciju ar noklusētām vērtībām.
    + Katrai sarakstei ar atbildi meklē attiecīgo sarakstu un ar to saistītā lietotāja ierakstu, uz ko tā atbild datubāzē pēc attiecīgās sarakstes identifikatora, iegūstot sarakstes tekstus, atbildes lietotāju segvārdus un izmainīšanas karodziņus.
      + Ja kāda sarakste netika atrasta, sarakstes tekstu un identifikatoru aizvieto ar noklusētām vērtībām.
  ],
  [
    Izvades datu mērķis ir parādīt sarakstes noteiktā intervālā.
    Lietotāja saskarnē tiek prezentēti dati no sagatavotā saraksta.
    Sarakstes parādās noteiktās grupas (mafijas un parastā) tērzētavā.

    + Saraksts ar vārdnīcām:
      + Sūtītāja segvārds -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Sūtītāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Sarakstes teksts -- atbilst #link(<IIDP16>)[IIDP16]\;
      + Sarakstes sūtīšanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Atbildes sarakstes teksts -- atbilst #link(<IIDP16>)[IIDP16] vai ""\;
      + Atbildes sarakstes autora segvārds -- atbilst #link(<IIDP07>)[IIDP07] vai ""\;
      + Atbildes sarakstes autora identifikators -- atbilst #link(<IIDP10>)[IIDP10] vai 0\;
      + Izmainīšanas karodziņš.
  ],
  [
    + Neizdevās piekļūt tērzētavai!
    + Jums nav iespējams rakstīt šajā tērzētavā vai tērzētavas sadaļā!
    + Jūs nevarat piekļūt tērzētavai!
  ],
) <TMF03>

#function-table(
  "Savu sarakstu rediģēšana",
  "TMF04",
  [
    Funkcija nodrošina iespēju spēlētājam rediģēt jau izsūtītu ziņu tērzētavā. Spēlētājs nospiež pogu "Rediģēt" blakus vēlamajai ziņai. Parādās rakstīšanai pieejams ievades lauks ar esošās ziņas saturu. Spēlētājs rediģē tekstu un nosūta izmaiņas.
  ],
  [
    Ievades dati tiek iegūti no lietotāja darbības -- klikšķis uz pogas "Rediģēt" un ievadītās rediģējamās sarakstes ievades laukā ievadītā satura.

    Obligātie parametri:
    + Rediģējamās ziņas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Sarakstes rediģētais teksts -- atbilst #link(<IIDP16>)[IIDP16]\;
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Izmantojot #link(<KPR02>)[KPR02] procedūru pārbauda, vai spēlētājs, lietotājs un spēles istaba eksistē un ir savstarpēji saistīti.
      + Ja nav, parāda 2. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai sarakste pieder lietotājam, meklējot sarakstu datubāzē pēc lietotāja identifikatora.
      + Ja sarakste nav atrasta, parāda 1. paziņojumu. Beidz apstrādi.
      + Ja nepieder, parāda 3. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai spēlētājs piedalās spēlē.
      + Ja nepiedalās, parāda 6. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai sarakste rediģētais teksts nav tukša simbolu virkne.
      + Ja ir tukša, parāda 4. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai sarakstes teksts nepārsniedz maksimālo simbolu skaitu.
      + Ja pārsniedz, parāda 5. paziņojumu ar attiecīgo maksimālo pieļauto garumu. Beidz apstrādi.
    + Ieraksta atjaunoto sarakstes ierakstu datubāzē, samainot "izmainīts" karodziņa vērtību uz "patiess".
      + Ja ierakstīšana neizdevās, parāda 2. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir atjaunot rediģētās ziņas saturu lietotāja saskarnē.
    + Rediģētā ziņas saturs -- sarakstes teksts -- atbilst #link(<IIDP16>)[IIDP16].
  ],
  [
    + Sarakste nav atrasta!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Drīkst rediģēt tikai savas sarakstes!
    + Ziņa ir tukša!
    + Ziņas garums pārsniedz maksimāli atļauto garumu: [maksimāli atļautais garums]!
    + Jūs nevarat rediģēt sarakstes nepiedaloties spēlē!
  ],
) <TMF04>

=== Spēles istabu modulis

#indent-par([
  Apakšnodaļa ietver spēles istabas moduļa funkcijas. Moduļa funkcionalitāte ir izmantota darbībām saistībā ar spēles virtuālo istabu. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-game-room).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<SIMF01>)[SIMF01],
  #link(<SIMF02>)[SIMF02],
  #link(<SIMF03>)[SIMF03],
  #link(<SIMF04>)[SIMF04],
  #link(<SIMF05>)[SIMF05],
  #link(<SIMF06>)[SIMF06],
  #link(<SIMF07>)[SIMF07],
  #link(<SIMF08>)[SIMF08],
  #link(<SIMF09>)[SIMF09]).
])

#figure(
  caption: "Spēles istabu moduļa 2. līmeņa DPD",
  image("img/dpd2/SpēlesIstabasModulis.svg"),
) <dpd-2-game-room>

#function-table(
  "Spēles istabu pārskats",
  "SIMF01",
  "Funkcijas mērķis ir ļaut reģistrētiem lietotājiem apskatīt pieejamās spēles istabas.",
  [
    Ievades datus iegūst no lietotāja neobligāti uzstādītiem filtriem lietotāja saskarnē, kārtošanas izvēles un lappuses numura un meklēšanas uzvednes. Parametri atbilst attiecīgām saitēm un ievades laukam lietotāja saskarnē un izvēlnēm pārskata lapās. Parametru vērtības tiek iegūtas no vietrādes parametriem.

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1.
    + Meklēšanas uzvedne -- simbolu virkne, atbilst #link(<IIDP14>)[IIDP14], noklusētā vērtība -- "".
    + Kārtošanas vārdnīcu saraksts -- atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
  ],
  [
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 3. paziņojumu. Beidz apstrādi.
    + Sāk gatavot datubāzes pieprasījumu no spēles istabu tabulas.
    + Sagatavo pārskata pieprasījumu un iegūst lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru, meklēšanas uzvedni, kārtošanas vārdnīcu sarakstu, filtru vārdnīcu sarakstu, šos parametrus iesniedzot, ja tie ir iesniegti funkcijā. Izmantojot procedūru, pievieno filtru, lai pieprasījumā nebūtu spēles, kas ir atceltas vai jau beidzās.
      + Ja lappušu skaits ir 0, parāda 1. paziņojumu. Beidz apstrādi.
    + Veic sagatavoto pieprasījumu, iegūstot istabas nosaukumu, atbilstošo lietotāju skaits, stāvokli, izveidošanas laiku, piekļuves kodu.
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
    + Katram ierakstam no rezultāta, sekojošas manipulācijas:
      + Saskaita spēlētājus, kas gaida spēles sākšanu -- spēlētāji, kuru stāvoklis atbilst "aktīvs" vai "atslēdzies".
      + Meklē spēles uzstādījumu pēc identifikatora.
        + Ja tas netika atrasts, izņem spēles istabas vārdnīcu no saraksta.
        + Citādi pievieno spēles uzstādījuma nosaukumu vārdnīcai.
      + Ja spēles sākšanas laiks nav tukšs vai stāvoklis neatbilst neuzsāktās spēles stāvokļa kodam, izņem ārā vārdnīcu no rezultāta saraksta;
      + Aprēķina maksimālo spēlētāju skaitu, meklējot datubāzē ar spēles uzstādījumu saistītās spēles lomas un saskaitot kopā to skaitus.
        + Ja kāda no lomām netiek atrasta, izņem istabas vārdnīcu no saraksta.
      + Pievieno "privāts" karodziņu;
        + Ja piekļuves kods nav tukšs, "privāts" vērtība ir "patiess", citādi "nepatiess".
      + Izņem piekļuves kodu un spēles sākšanas laiku no vārdnīcas.
  ],
  [
    Izvades mērķis ir saskarnē tiek izvietots pārskatāms saraksts ar visām lietotājam pieejamajām spēles istabām un to raksturojošajiem parametriem, pielietojot filtrus un kārtošanu, ja tas tika pieprasīts.
    Lietotāja saskarnē tiek prezentēti dati no sagatavotā saraksta.

    + Saraksts ar vārdnīcām:
      + Nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      + Spēles uzstādījuma nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      + Izveidošanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Atbilstošo lietotāju skaits -- vesels skaitlis;
      + Maksimālais lietotāju skaits -- vesels skaitlis;
      + Privātuma karodziņš.
  ],
  [
    + Nav pieejamu istabu!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <SIMF01>

#function-table(
  "Pieslēgšanās spēles istabai",
  "SIMF02",
  "Funkcijas mērķis ir ļaut reģistrētiem lietotājiem pievienoties izvēlētajai spēles istabai.",
  [
    Ievades datus iegūst no veidlapas lietotāja saskarnē.
    Istabas piekļuves kods tiek iegūts no attiecīgā ieraksta sarakstā un no paroles dialoga lodziņa.

    Obligātie parametri:
    + Istabas identifikators -- atbilst #link(<IIDP06>)[IIDP07]\;
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\.

    Neobligātie parametri:
    + Istabas piekļuves kods -- atbilst #link(<IIDP06>)[IIDP06], noklusētā vērtība -- ""\.

    // ASK: Should we encrypt this password (code*). Decision: This field will not be encrypted

  ],
  [
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 6. paziņojumu. Beidz apstrādi.
    + Tiek meklēta spēles istaba spēles istabu tabulā spēles istabas identifikatora.
      + Ja istaba netika atrasta, parāda 4. paziņojumu. Beidz apstrādi.
    + Meklē spēlētāju, kas ir saistīts ar lietotāja identifikatoru.
      + Ja to atrod, pamaina spēlētāja stāvokli nomaina uz stāvokli, kas atbilst aktīvam spēlētājam. Ieraksta izmaiņas datubāzē. Beidz apstrādi.
        + Ja ierakstīšana neizdevās, parāda 3. paziņojumu. Beidz apstrādi.
    + Ja istabas lietotāju skaits ir sasniedzis maksimālo lietotāju skaitu, tad tiek parādīts 1. paziņojums. Beidz apstrādi.
    + Ja istaba ir atrasta un ja tās piekļuves kritēriji ietver paroli, i.e., istaba ietver paroli un istabas stāvoklis atbilst spēlei, kas vēl nav sākusies, tad tiek parādīts dialogs piekļuves kods iesniegšanai.
      + Ja istabas piekļuves kodu nesaņēma (kods netika iesniegts), parāda 5. paziņojumu. Beidz apstrādi.
      + Ja piekļuves kods nesakrīt ar istabas kodu, tad parāda 2. paziņojumu. Beidz apstrādi.
      + Ja istabas stāvoklis neatbilst, tad parāda 8. paziņojumu. Beidz apstrādi.
    + Izveido spēlētāja ierakstu, kas ir saistīts ar spēles istabu un lietotāja identifikatoru ar stāvokli, kas atbilst aktīvam spēlētājam.
    // ACTIVE PLAYER attribute? -> YES. Perhaps we can remove the active player, since it will be hard to keep track of it and just handle it with programmatic checks on whether the player exists or not (same user ID)
  ],
  [
    Izvades mērķis ir noteikt, vai lietotājs tiks pāradresēts istabas lapā - spēles vestibilā. Lietotājam parāda 7.paziņojumu.
    + Pieslēgšanās stāvoklis -- skaitlisks kods.
  ],
  [
    + Istabā nav brīvu vietu!
    + Nepareizs piekļuves kods!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Istaba netika atrasta!
    + Istaba ir aizsargāta ar paroli! Lūdzu, ievadiet paroli!
    + Nepieciešamie pieslēgšanās dati netika iesniegti.
    + Pievienošanās istabai ir veiksmīga!
    + Spēles istaba nav aktīva. Nav iespējas tai pievienoties!
  ],
) <SIMF02>

#function-table(
  "Atslēgšanās no spēles istabas",
  "SIMF03",
  "Funkcijas mērķis ir ļaut reģistrētiem lietotājiem atslēgties no pašreizējās spēles istabas.",
  [
    Dati tiek iegūti no konteksta (autentificēta lietotāja identifikators) un vietrādes parametriem (spēles istabas identifikators)

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Spēles istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 6. paziņojumu. Beidz apstrādi.
    + Izmantojot #link(<KPR02>)[KPR02] procedūru pārbauda, vai spēlētājs, lietotājs un spēles istaba eksistē un ir savstarpēji saistīti.
      + Ja nav, parāda 5. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles istabas ierakstu, izmantojot spēles istabas identifikatoru.
      + Ja nav, parāda 3. paziņojumu. Beidz apstrādi.
    + Meklē spēlētāja ierakstu, izmantojot spēlētāja identifikatoru.
      + Ja to neatrod, parāda 2. paziņojumu. Beidz apstrādi.
    + Spēlētāja stāvoklis tiek nomainīts uz "atslēdzies". Izmaiņas ieraksta datubāzē.
      + Ja ierakstīšana neizdodas, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja atslēgšanās ir veiksmīga, parāda 4. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir noteikt vai lietotājs tiks pāradresēts. Atslēdzoties, lietotājs tiek pāradresēts pieejamo istabu saraksta lapā.
    + Atslēgšanās stāvoklis -- skaitlisks kods.
  ],
  [
    + Spēles istaba nav atrasta! Mēģiniet vēlreiz.
    + Spēlētājs nav atrasts! Mēģiniet vēlreiz.
    + Sistēmas iekšēja kļūda. Mēģiniet vēlreiz!
    + Atslēgšanās no istabas ir veiksmīga!
    + Jūs neesat šajā istabā!
    + Nepieciešamie pieslēgšanās dati netika iesniegti.
  ],
) <SIMF03>

#pagebreak(weak: true)
#function-table(
  "Jaunas spēles istabas izveide",
  "SIMF04",
  "Maksas lietotājiem ļauj izveidot jaunu spēles istabu ar noteiktiem iestatījumiem",
  [
    Dati tiek iegūti no veidlapas lietotāja saskarnē. Lietotāja identifikators tiek iegūts no konteksta.

    Obligātie parametri:
    + Spēles istabas nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Spēles uzstādījuma identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    Neobligātie parametri:
    + Istabas piekļuves kods -- atbilst #link(<IIDP06>)[IIDP06], noklusētā vērtība -- ""\.
  ],
  [
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 4. paziņojumu. Beidz apstrādi.
    + Izmantojot #link(<KPR08>)[KPR08] procedūru, pārbauda, vai lietotājam ir aktīvs abonements.
      + Ja nav, tad parāda 2. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles uzstādījumu.
      + Ja tas netika atrasts, parāda 3. paziņojumu. Beidz apstrādi.
    + Sāk gatavot spēles istabas ierakstu.
    + Ja piekļuves kods tika iesniegts, pārbauda, vai tas atbilst prasībām.
      + Ja neatbilst, parāda 5. paziņojumu. Beidz apstrādi.
      + Citādi pievieno piekļuves kodu spēles istabas ierakstam.
    + Ja istabas nosaukums neatbilst prasībām. Parāda 6. paziņojumu. Beidz apstrādi.
    + Stāvokli uzstāda uz stāvokli, kas atbilst nesāktai spēlei.
    + Uzstāda izveidošanas laiku uz tagadējo laiku.
    + Pārējos laukus uzstāda uz noklusētām vērtībām.
    + Ieraksta istabas ierakstu datubāzē.
      + Ja ierakstīšana neizdevās, parāda 3. paziņojumu.
    + Izveido spēlētāja ierakstu, kas ir saistīta ar spēles istabu un lietotāju ar stāvokli, kas atbilst aktīva spēlētāja stāvoklim. Pārējos laukus uzstāda uz noklusētām vērtībām.
    + Ieraksta spēlētāja ierakstu datubāzē.
      + Ja ierakstīšana neizdevās, parāda 3. paziņojumu.
  ],
  [
    Izvades mērķis ir noteikt vai lietotājs tiks pāradresēts. Lietotājs tiek automātiski pievienots, tas ir pāradresēts, jaunizveidotajai istabai. Parāda 1. paziņojumu.
    + Atslēgšanās stāvoklis -- skaitlisks kods.
  ],
  [
    + Istaba ir veiksmīgi izveidota!
    + Darbība nav izdevusies! Jums nav aktīva abonementa.
    + Sistēmas iekšēja kļūda. Mēģiniet vēlreiz!
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + Piekļuves kods neatbilst prasībām: [prasības].
    + Nosaukums neatbilst prasībām: [prasības].

  ],
) <SIMF04>

#function-table(
  "Spēles sākuma pieteikums",
  "SIMF05",
  "Funkcijas mērķis ir istabas izveidotājam iesākt spēles procesu istabā, kuru ir izveidojis.",
  [
    Dati tiek iegūti no konteksta (autentificēta lietotāja identifikators) un darbības (istabas identifikators).

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
  ],
  [
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 3. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē istabas ierakstu.
      + Ja neatrod, parāda 3. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai lietotājs ir istabas izveidotājs, meklējot spēlētāja ierakstu datubāzē.
      + Ja spēlētāju neatrod, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja lietotājs nav istabas izveidotājs, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai spēles stāvoklis atbilst nesāktās spēles stāvoklim.
      + Ja neatbilst, parāda 4. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai istabā ir nepieciešamais spēlētāju skaits.
      + Ja nav, tad parāda 2. paziņojumu. Beidz apstrādi.
    + Pamaina istabas stāvokli uz stāvokli, kas atbilst spēlei procesā un uzstāda spēles sākšanas laiku uz tagadējo laiku.
    + Izveido spēles istabas sākuma notikumu.
    + Piešķir katram spēlētājam nejaušas lomas pieejamas spēles uzstādījumā.
    + Saglabā izmaiņas datubāzē.
      + Ja ierakstīšana neizdodas. Parāda 4. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir noteikt spēles sākšanas stāvokli. Veiksmīgas spēles sākšanas gadījumā, lietotājs tiek pāradresēts attiecīgās istabas spēles gaitas lapā. Spēles saskarnē parādās sākuma informācija par spēli.
    + Spēles sākšanas stāvoklis -- skaitlisks kods.

  ],
  [
    + Darbība nav izdevusies! Jūs neesat šīs istabas izveidotājs.
    + Uzsākt spēli nav iespējams, nepietiek dalībnieku.
    + Sistēmas iekšēja kļūda. Mēģiniet vēlreiz!
    + Spēle jau ir sākusies vai beidzās!

  ],
) <SIMF05>

#function-table(
  "Spēlētāja izslēgšana",
  "SIMF06",
  "Administrators var izslēgt spēlētāju no spēles istabas.",
  [
    Dati tiek iegūti no konteksta (autentificēta lietotāja identifikators) un darbības (istabas identifikators un spēlētāja identifikators).

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Izslēdzamā spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
  ],
  [
    + Autorizē administratora darbību.
      + Ja tā nav autorizēta, parāda 4. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēlētāja ierakstu.
      + Ja netiek atrasts, parāda 3. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles istabas ierakstu.
      + Ja netiek atrasta, parāda 2. paziņojumu. Beidz apstrādi.
    + Pamaina spēlētāja stāvokli uz stāvokli, kas atbilst izslēgta spēlētāja stāvoklim.
    // + Spēlētāja ierakstu izdzēš.
    // + Ja izdzēšana neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir noteikt izslēgšanas stāvokli, kas attiecīgi izraisa spēles saraksta atjaunošanu lietotāja saskarnē. Parāda 1. paziņojumu.
    + Spēlētāja izslēgšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Spēlētājs ir veiksmīgi izslēgts.
    + Spēlētāja izslēgšana ir neveiksmīga, mēģiniet vēlreiz.
    + Spēlētājs netika atrasts.
    + Darbība nav autorizēta.
  ],
) <SIMF06>

#function-table(
  "Spēlētāju pārskats",
  "SIMF07",
  "Funkcija ļauj lietotājiem iegūt pārskatu par visiem spēlētājiem noteiktā istabā.",
  [
    Obligātie parametri:
    + Spēles istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Datubāzē meklē spēles istabu.
      + Ja nav atrasta, parādā 1. paziņojumu. Beidz apstrādi.
    + Iegūst spēlētāju sarakstu no datubāzes, kas ir saistīti ar spēles istabu.
      + Ja neviens spēlētājs netika atrasts, parāda 3. paziņojumu. Beidz apstrādi.
    + Katram spēlētājam iegūst attiecīgā lietotāja ierakstu.
      + Ja kādam spēlētājam nevar atrakst lietotāju, parāda 2. paziņojumu. Beidz apstrādi.
    + Izveido spēlētāju vārdnīcu sarakstu:
      + lietotāja segvārds;
      + stāvoklis;
      + lietotāja profila attēls.
  ],
  [
    Izvades mērķis ir parādīt informāciju lietotāju par konkrētās istabas spēlētājiem. Lietotāja saskarnē tiek parādīts saraksts ar istabas spēlētājiem.

    + Vārdnīcu saraksts:
      + Lietotāja segvārds -- atbilst #link(<IIDP07>)[IIDP07]\;
      + Spēlētāja stāvoklis -- simbolu virkne.
      + Lietotāja profila attēls -- atbilst #link(<IIDP08>)[IIDP08];
  ],
  [
    + Spēles istaba nav atrasta!
    + Neizdevās iegūt spēlētāju sarakstu. Mēģiniet vēlreiz!
    + Istabā nav spēlētāju!
  ],
) <SIMF07>


#function-table(
  "Spēļu vēstures pārskats",
  "SIMF08",
  "Funkcija ļauj lietotājiem iegūt pārskatu par savām iepriekšējām spēlēm.",
  [
    Ievades dati tiek iegūti no konteksta (lietotāja identifikators) un neobligāto vietrādes meklēšanas parametra.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1;
  ],
  [
    + Sāk gatavot datubāzes pieprasījumu no spēlētāja tabulas.
    + Sagatavo pārskata pieprasījumu un iegūst lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru.
      + Ja lappušu skaits ir 0, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Veic sagatavoto pieprasījumu, iegūstot spēlētāja identifikatoru, pievienojot nosacījumu, ka spēles istabu stāvoklim jāatbilst pabeigtās spēles stāvoklim.
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
    + Katram ierakstam no rezultāta iegūst lomas nosaukumu no spēles lomas tabulas pēc spēles lomas identifikatora.
      + Ja spēles loma neeksistē, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja spēles loma eksistē, tad katram ierakstam, iegūst attēla datnes adresi no attēlu tabulas pēc attēla identifikatora.
        + Ja attēla datnes adrese neeksistē ierakstam, tad iegūst noklusētā attēla datnes adresi un pamaina ieraksta datnes adresi izvades datos uz noklusētā datnes attēla adresi.
    + Katram ierakstam no rezultāta iegūst istabas nosaukumu, spēles sākšanas un beigšanas laiku, stāvokli no istabas tabulas un saistīto spēles uzstādījuma nosaukumu pēc istabas identifikatora.
      + Ja istaba neeksistē, parāda 4. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir lietotāja spēļu saraksta datu izvadīšana. Lietotāja saskarnē parādās saraksts ar spēlēm.

    + Vārdnīcu saraksts:
      + Istabas nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      + Spēles sākšanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Spēles beigšanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
      + Istabas stāvoklis -- skaitlisks kods;
      + Spēles uzstādījuma nosaukums -- atbilst #link(<IIDP21>)[IIDP21].
  ],
  [
    + Neviena spēle netika atrasta!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Nezināma spēles loma!
    + Nezināma spēles istaba!
  ],
) <SIMF08>

#function-table(
  "Spēles atcelšana",
  "SIMF09",
  "Funkcijas mērķis ir atcelt spēli. Atcelt spēli var maksas lietotājs, ja viņš ir spēles izveidotājs, vai administrators, neatkarīgi no spēles statusa.",
  [
    Dati tiek iegūti no konteksta (autentificēta lietotāja identifikators) un darbības (spēles identifikators).

    Obligātie parametri:
    + Lietotāja identifikators –- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēles identifikators –- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 4. paziņojumu. Beidz apstrādi.
    + Pārbauda lietotāja lomu un tiesības atcelt spēli.
      + Ja lietotājs nav administrators un nav spēles izveidotājs, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles ierakstu.
      + Ja spēli neatrod, parāda 2. paziņojumu. Beidz apstrādi.
    + Maina spēles stāvokli uz atceltu.
    + Maina visu ar spēli saistīto spēlētāju "aktīvs" lauku uz "nepatiess".
    + Saglabā izmaiņas datubāzē.
      + Ja neizdodas saglabāt izmaiņas, parāda 1. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir informēt lietotāju par veiksmīgu spēles atcelšanu vai kļūdu procesā.
    + Spēles atcelšanas stāvoklis –- karodziņš.
  ],
  [
    + Spēles statusa maiņa neizdevās, mēģiniet vēlreiz.
    + Spēle ar šādu identifikatoru netika atrasta.
    + Jums nav tiesību atcelt šo spēli.
    + Nepieciešamie dati nav pilnībā iesniegti.
  ],
) <SIMF09>


=== Spēles gaitas modulis

#indent-par([
  Apakšnodaļa ietver spēles gaitas moduļa funkcijas. Moduļa funkcionalitāte ir izmantota spēles procesa realizēšanai. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-game-progress).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<SGMF01>)[SGMF01],
  #link(<SGMF02>)[SGMF02],
  #link(<SGMF03>)[SGMF03],
  #link(<SGMF04>)[SGMF04]).
])

#figure(
  caption: "Spēles gaitas moduļa 2. līmeņa DPD",
  image("img/dpd2/SpēlesGaitasModulis.svg"),
) <dpd-2-game-progress>

#function-table(
  "Spēles darbības veikšana",
  "SGMF01",
  "Funkcijas mērķis ir veikt spēles darbību lietotājiem, kas atrodas spēles istabā, saglabājot darbību kā notikuma ierakstu.",
  [
    Ievade tiek iegūta no darbības spēles laikā. Lietotājs uzspiež uz darbības pogu, kas ir saistīta ar konkrētu darbības ierakstu datubāzē.

    Obligātie parametri:
    + Veicēja lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Darbības identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Spēles istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].

    Neobligātie parametri:
    + Mērķa spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    // Pārbauda istabas un darbības eksistenci un atbilstību aktīvam stāvoklim
    + Datubāzē meklē spēles istabu, izmantojot darbības identifikatoru.
      + Ja spēles istaba netiek atrasta parāda 2. paziņojumu. Beidz apstrādi.
      + Ja spēles istabas stāvoklis neatbilst stāvoklim spēlei procesā, tad parāda 1. paziņojumu. Beidz apstrādi.
    // Pārbauda lietotāja, spēlētāja un spēles istabas atbilstību
    + Izmantojot #link(<KPR02>)[KPR02] procedūru pārbauda, vai spēlētājs, lietotājs un spēles istaba eksistē un ir savstarpēji saistīti.
      + Ja nav, parāda 2. paziņojumu. Beidz apstrādi.
    // Pārbauda darbības un lomas eksistenci, darbības saistību ar spēlētāja lomu
    + Iegūst lomas identifikatoru no atrastā ieraksta. Meklē lomu, izmantojot identifikatoru.
      + Ja loma netiek atrasta, parāda 2. paziņojumu. Beidz apstrādi.
    + Meklē lomas darbību attiecīgā tabulā, izmantojot darbības identifikatoru.
      + Ja darbība netiek atrasta parāda 2. paziņojumu. Beidz apstrādi.
      + Ja mērķa spēlētāju saraksts nav tukšs, meklē spēlētāju attiecīgajā tabulā, izmantot spēlētāja identifikatorus.
    + Pārbauda, vai darbība ir ar spēlētāja lomu saistīta darbība, meklējot saistību ar darbību pēc lomas identifikatora.
      + Ja tā nav, parāda 3. paziņojumu. Beidz apstrādi.
    // Pārbauda vai darbība ir aizliegta vai atļauta (atļaujošie/aizliedzošie notikumi)
    + Iegūstot spēles notikumus datubāzē, noskaidro, vai darbība ir atļauta vai aizliegta.
      + Pēdējais notikums, kas atļauj vai aizliedz šo darbību, šo notikumu aizliedz vai atļauj.
      + Ja tādu notikumu nav, tad darbība ir aizliegta. Ja pēdējais nav atļaujošais notikums, darbība ir aizliegta.
      + Ja darbība ir aizliegta, parāda 4. paziņojumu. Beidz apstrādi.
    // Izveido notikuma saistību datubāzē
    + Izveido jaunu darbības ierakstu ar attiecīgu spēlētāja identifikatoru, darbības identifikatoru un lomas darbību. Ja darbībai ir kāds mērķa spēlētājs, tad izveido atsevišķu ierakstu, kur vai pilda ir stāvoklī "patiess".
      + Ja ieraksta veikšana neizdevās. Parāda 2. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades mērķis ir parādīt ar izpildīto darbību saistīto informāciju. Stāvoklis izraisa izmaiņas spēles gaitas saskarnē.
    + Darbības stāvokļa kods -- skaitlisks kods.
  ],
  [
    + Spēle ir beigusies, nevar veikt darbību!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Darbība nav atļauta jūsu lomai!
    + Darbība nav atļauta šajā spēles fāzē!
  ],
) <SGMF01>

#function-table(
  "Spēles notikumu izveidošana",
  "SGMF02",
  [
    Funkcijas mērķis ir izveidot visiem konkrētās istabas spēlētājiem aktuālu spēles notikumu. Notikumiem ir sekojoši cēloņi: fāzes maiņa, spēlētāja darbība, darbības aizliegums vai atļauja, taimera sākums, spēles sākums, spēles beigas.
    Notikums var sevī ietvert noteiktu ietekmi uz spēles stāvokli, kas tiek izmainīts funkcijas ietvaros. Katram notikumam ir noteikts nosaukums, kas tiek darināts no veidnes. Piemēram "Fāze mainās uz \[fāzes nosaukums\]".
  ],
  [
    Ievades dati tiek iegūti no esošās spēles gaitas konteksta.

    Obligātie parametri:
    + Spēlēs istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    // Pārbauda istabas eksistenci un atbilstību aktīvam stāvoklim.
    + Meklē spēles istabu attiecīgā tabulā, izmantojot darbības identifikatoru.
      + Ja spēles istaba netiek atrasta parāda 1. paziņojumu. Beidz apstrādi.
      + Ja spēles istabas stāvoklis neatbilst aktīvam stāvoklim, parāda 2. paziņojumu.
    // Vai pastāv aktīvs taimeris
    + Iegūst no datubāzes notikumus ar taimera veidu.
      + Ja tāds notikums ir un taimeris ir aktīvs (nav pagājis laika periods), tad parāda. Beidz apstrādi.
    // // Nav validācijas, jo tā ir sistēma
    // // Sāk fāzes fāzes pāreju:

    + Katram turpmāk izveidotam notikumam, izveido nosaukumu, darinot to no attiecīgās veidnes. Izveidošanas laiku norāda kā tagadējo laiku. Pārējos atribūtus norāda atkarībā no notikuma specifikas.

    // Iegūst spēles fāzi un spēlētāju stāvokļus un notikumus.
    //+ No datubāzes iegūst vēlāko nakts maiņas notikumu datubāzē.
    //   + Ja netika atrasts neviens nakts maiņas notikums, tad pieņem, ka ir 0-tā nakts (neviena nakts vel nav notikusi).
    + No datubāzes iegūst spēlētāju stāvokļus.

    // Nosaka pēdējo fāzes maiņu
    + No datubāzes iegūst pēdējo spēles fāzes maiņas notikumu.

    + Ja pēdējā fāzes maiņa ir no dienas vai balsošanas uz nakts, veic sekojošas darbības:
      + Izslēdz no spēles neaktīvus spēlētājus, kam bija jāizvēlas darbība.
      + Aizliedz darbības.
      + Apstrādā darbības, veicot izmaiņas spēles un spēlētāju stāvoklī un izveidojot dažādu veidu notikumus, iekļaujot tajā attiecīgās saistības ar darbībām, lietotājiem, ja attiecināms.
      + Pārbauda spēles beigu nosacījumus un ja tie ir apmierināti, izveido spēles beigu notikumu, izmaina istabas stāvokli un beidz apstrādi.
      + Izveido notikumu fāzes maiņai uz nakti, ja ir pirmā diena vai uz balsošanu, ja nav pirmā diena.
    + Citādi, ja pēdējā fāzes maiņa ir no dienas uz balsošanu vai pāreja no pirmās dienas uz nakti, veic sekojošas darbības:
      + Iegūst balsošanas darbības no dzīviem spēlētājiem.
      + Izslēdz izbalsoto spēlētāju, pamainot spēlētāja stāvokli (atbilstošs atribūts).
      + Pārbauda spēles beigu nosacījumus un ja tie ir apmierināti, izveido spēles beigu notikumu, izmaina istabas stāvokli un beidz apstrādi.
      + Izveido nakts darbību atļaujošus notikumus.
      + Izveido notikumu fāzes maiņai uz nakti.
    + Citādi, veic sekojošas darbības:
      + Izveido balsošanas atļaujošu notikumu.
      + Izveido notikumu fāzes maiņai uz balsošanu.
    + Izveido taimera notikumu nākamai fāzei uz noteiktu laiku periodu.
    + Izmaina spēles istabas stāvokli uz stāvokli, kas atbilst pabeigtai spēlei un norāda beigšanas laiku uz tagadējo laiku.
    + Ieraksta datubāze sagatavotos notikumus un izmaiņas spēlētāju stāvokļos un spēles istabas izmaiņas.
      + Ja ierakstīšana neizdodas parāda 3. paziņojumu.
        // ASK: Some of the actions / functions are crucial for functioning. Should robustness be specified within the functions, e.g., reschedule the action if it fails in event creation.  ],
  ],
  [
    Izvades mērķis ir noteikt notikumu izveidošanas rezultāta stāvokli.
    + Notikumu izveidošanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Spēles istaba ar identifikatoru [istabas identifikators] netika atrasta!
    + Spēle nav procesā!
    + Notikumu izveidošana neizdevās!
  ],
) <SGMF02>

#function-table(
  "Spēles notikumu pārskats",
  "SGMF03",
  "Funkcijas mērķis ir iegūt informāciju par spēles notikumiem.",
  [
    Ievades dati tiek iegūti no attiecīgās lietotāja darbības vai vietrāža un konteksta.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10];
    + Spēles istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Paslēptā informācija -- karodziņš.

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1.
  ],
  [
    + Veic sistēmas vai administratora darbības autorizāciju.
      + Ja darbība nav autorizēta ir pieprasīta paslēptā informācija un spēles istabas stāvoklis neapzīmē pabeigtu spēli, parāda 2. paziņojumu. Beidz apstrādi.
    + Meklē spēles istabu attiecīgā tabulā, izmantojot darbības identifikatoru.
      + Ja spēles istaba netiek atrasta parāda 1. paziņojumu. Beidz apstrādi.
    + Sāk gatavot datubāzes pieprasījumu no spēles notikumu tabulas.
    + Ja ir iesniegts lappuses numurs, sagatavo pārskata pieprasījumu un iegūst lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru.
      + Ja lappušu skaits ir 0, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Sāk veidot sarakstu ar notikumu vārdnīcām.
    + Veic sagatavoto pieprasījumu, iegūstot nosaukumu, izveidošanas laiku, nakts numuru, veidu, vai ir nakts.
      + Ja pieprasījums neizdodas, parāda 4. paziņojumu. Beidz apstrādi.
      + Ja paslēptās informācijas karodziņš ir "patiess", tad vārdnīcai pievieno atbilstošā spēlētāja, tā lomas identifikatoru un tā darbības identifikatoru, ja tas ir attiecināms, meklējot to datubāzē.
        + Ja pieprasījums datubāzei neizdodas, parāda 4. paziņojumu.
      + Ja notikuma redzamības spēles procesā karodziņš ir "patiess" un ja paslēptās informācijas karodziņš ir "patiess", notikumu pievieno sarakstam, citādi notikumu sarakstam nepievieno.
      + Ja notikuma veids atbilst taimera notikumam, sarakstam pievieno taimera laiku.
      + Citādi taimera laiks ir 0.
  ],
  [
    Izvades mērķis ir par notikumiem nepieciešamās informācijas apkopošana vārdnīcu sarakstā atkarībā no paslēptās informācijas ievades karodziņa.

    Ja netiek parādīta paslēptā informācija, saraksts sastāvēs no vārdnīcām:
    + Notikuma nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Izveidošanas laiks -- atbilst #link(<IIDP02>)[IIDP21]\;
    + Nakts numurs -- vesels skaitlis;
    + Veids -- atbilst #link(<IIDP03>)[IIDP03];
    + Vai ir nakts -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Taimera laiks -- skaitlis vai 0\.
    Ja netiek parādīta paslēptā informācija, tad vārdnīcām papildus ir:
    + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Darbības identifikators -- atbilst #link(<IIDP10>)[IIDP10]\.

  ],
  [
    + Spēles istaba ar identifikatoru [istabas identifikators] netika atrasta!
    + Notikumu detalizēts pārskats nav pieejams spēles laikā!
    + Nav neviena spēles notikuma!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <SGMF03>

#pagebreak(weak: true)
#function-table(
  "Spēles stāvokļa detaļas",
  "SGMF04",
  "Funkcijas mērķis par spēles tagadējo stāvokli, kas ietver spēlētāju stāvokli, nakts numuru un atļautās darbības.",
  [
    Ievades dati tiek iegūti no attiecīgās lietotāja darbības vai vietrāža un konteksta.
    Paslēptā informācija nosaka, vai izvade saturēs lomu datus par spēlētājiem.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēles istabas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
    + Paslēptā informācija -- karodziņš.
  ],
  [
    + Veic sistēmas vai administratora darbības autorizāciju.
      + Ja darbība nav autorizēta ir pieprasīta paslēptā informācija un spēles istabas stāvoklis neapzīmē pabeigtu spēli, parāda 3. paziņojumu. Beidz apstrādi.
      + Ja darbība nav autorizēta, izmantojot #link(<KPR02>)[KPR02] procedūru pārbauda, vai spēlētājs, lietotājs un spēles istaba eksistē un ir savstarpēji saistīti.
        + Ja nav, parāda 3. paziņojumu. Beidz apstrādi.
    + Meklē spēles istabu attiecīgā tabulā, izmantojot darbības identifikatoru.
      + Ja spēles istaba netiek atrasta parāda 1. paziņojumu. Beidz apstrādi.
    + Iesāk stāvokļa vārdnīcas gatavošanu ar noteiktu informāciju. Vārdnīcai pievieno sekojošus datus:
      + Spēles istabas stāvoklis;
      + Spēles sākšanas laiks;
      + Mafijas sakaru redzamība -- ja spēlētājam ir mafijai piederoša loma;
      + Vispārīgo sakaru redzamība -- ja spēlētāja stāvoklis atbilst aktīvam, neizslēgtam no spēles spēlētājam;
      + Nakts numurs.
    + Iegūst spēlētāju identifikatoru sarakstu no datubāzes, kas ir saistītas ar spēles istabu.
    + Katram identifikatoram no iegūtā saraksta veic sekojošas darbības:
      + Meklē spēlētāju datubāzē, izmantojot spēlētāja identifikatoru.
        + Ja spēlētāja ieraksts netika atrasts, parāda 4. paziņojumu. Beidz apstrādi.
      + Sagatavo spēlētāja lietotāja profila attēlu:
        + Ja profila attēls nav tukšs, to uzskata par noteikto noklusēto attēlu.
      + Pievieno vārdnīcu sarakstam vārdnīcu ar sekojošiem datiem:
        + Spēlētāja identifikators;
        + Lietotāja lietotājvārds;
        + Dzīvības stāvoklis;
        + Lietotāja profila attēls.
      + Ja paslēptās informācijas karodziņš ir "patiess" vai spēles stāvoklis atbilst izbeigtās spēles stāvoklim, vārdnīcai pievieno sekojošus datus:
        + Lomas identifikators.
  ],
  [
    Izvades mērķis nepieciešamās spēles stāvokļa informācijas parādīšana lietotāja saskarnē.

    + Spēles istabas stāvoklis -- atbilst #link(<IIDP03>)[IIDP03]\;
    + Spēles sākšanas laiks -- atbilst #link(<IIDP02>)[IIDP02]\;
    + Mafijas sakaru redzamība -- karodziņš;
    + Vispārīgo sakaru redzamība -- karodziņš;
    + Nakts numurs -- vesels pozitīvs skaitlis.
    + Spēlētāju vārdnīcu saraksts. Katra spēlētāja vārdnīca, kuras atslēgas ir:
      + Spēlētāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Lietotāja lietotājvārds -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Dzīvības stāvoklis -- karodziņš;
      + Lietotāja profila attēls -- atbilst #link(<IIDP08>)[IIDP08]\;
    Ja paslēptā informācija tiek izvadīta, tad spēlētāju vārdnīca saturēs arī:
    + Lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
  ],
  [
    + Spēles istaba ar identifikatoru [istabas identifikators] netika atrasta!
    + Spēlētāju ar identifikatoru: [spēlētāju identifikatori] netika atrasti!
    + Darbība nav autorizēta!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <SGMF04>


=== Spēles lomu uzstādījumu modulis

#indent-par([
  Apakšnodaļa ietver spēles lomu uzstādījumu moduļa funkcijas. Moduļa funkcionalitāte ir izmantota darbībām saistībā ar lomām. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-game-role).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<SLMF01>)[SLMF01],
  #link(<SLMF02>)[SLMF02],
  #link(<SLMF03>)[SLMF03],
  #link(<SLMF04>)[SLMF04],
  #link(<SLMF05>)[SLMF05],
  #link(<SLMF06>)[SLMF06]).
])

#figure(
  caption: "Spēles lomu uzstādījumu moduļa 2. līmeņa DPD",
  image("img/dpd2/SpēlesLomuModulis.svg"),
) <dpd-2-game-role>

#function-table(
  "Lomas detaļas",
  "SLMF01",
  "Funkcijas mērķis ir izvadīt pieprasītās lomas detaļas, kas neietver lomas darbības (tam ir domāta atsevišķa funkcija).",
  [
    Ievades dati tiek iegūti no vietrāža vai lietotāja darbības.

    Obligātie parametri:
    + Spēles lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Sagatavo datubāzes pieprasījumu no spēles lomu tabulas.
    + Pieprasījumam pievieno atlasīšanu pēc spēles lomas identifikatora.
    + Sagatavo pieprasījuma lauku sarakstu. Saraksta pamatā ir identifikators, nosaukums, apraksts, vai ir pamata, vai pieder mafijas grupai.
    + Veic sagatavoto pieprasījumu, pieprasot iepriekš sagatavoto lauku sarakstu.
      + Ja pieprasījums neizdotas, parāda 1. paziņojumu. Beidz apstrādi.
      + Ja spēles loma netika atrasta, parāda 2. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir spēles lomas datu izvadīšana. Lietotāja saskarnē tiek prezentētas pieprasītās lomas detaļas.
    + Vārdnīca
      + Lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Nosaukums -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Apraksts -- simbolu virkne;
      // + Maksimāli pieļaujamais skaits spēlē -- nenegatīvs skaitlis;
      // + Vai var tikt mafijas noslepkavots -- karodziņš;
      + Vai ir pamata -- karodziņš.
      + Vai pieder mafijas grupai -- karodziņš.
  ],
  [
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Tāda spēles lomas nav atrasta! Mēģiniet vēlreiz!
  ],
) <SLMF01>

#function-table(
  "Lomu pārskats",
  "SLMF02",
  "Funkcijas mērķis ir izvadīt sarakstu ar visām pieejamajām lomām, to nosaukumiem.",
  [
    Ievades datus iegūst no veicamās darbības un neobligāto vietrādes meklēšanas parametra.

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1.
    + Meklēšanas uzvedne -- simbolu virkne, atbilst #link(<IIDP14>)[IIDP14], noklusētā vērtība -- "".
    + Kārtošanas vārdnīcu saraksts -- atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
  ],
  [
    + Sāk gatavot datubāzes pieprasījumu no spēles lomu tabulas.
    + Sagatavo pārskata pieprasījumu un iegūst lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru, meklēšanas uzvedni, kārtošanas vārdnīcu sarakstu, filtru vārdnīcu sarakstu, šos parametrus iesniedzot, ja tie ir iesniegti funkcijā.
      + Ja lappušu skaits ir 0, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Veic sagatavoto pieprasījumu, iegūstot lomas nosaukumu, vai ir pamata, aprakstu, piederību mafijai.
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
    + Katram ierakstam no rezultāta iegūst attēla datnes adresi no attēlu tabulas pēc attēla identifikatora.
      + Ja attēla datnes adrese neeksistē ierakstam, tad iegūst noklusētā attēla datnes adresi un pamaina ieraksta datnes adresi izvades datos uz noklusētā datnes attēla adresi.
  ],
  [
    Izvades datu mērķis ir spēles lomu saraksta datu izvadīšana. Lietotāja saskarnē parādās saraksts ar lomām.

    + Vārdnīcu saraksts:
      + Lomas nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      // + Maksimāls spēlējošo skaits -- vesels pozitīvs skaitlis;
      + Lomas apraksts -- atbilst #link(<IIDP09>)[IIDP09]\;
      + Vai ir pamata -- karodziņš;
      // + Vai var tikt mafijas noslepkavots -- karodziņš;
      + Lomas attēla adrese -- atbilst #link(<IIDP08>)[IIDP08]\;
      + Piederība mafijas grupai -- karodziņš.
  ],
  [
    + Neviena spēles loma netika atrasta!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Tāda spēles lomas nav atrasta! Mēģiniet vēlreiz!
  ],
) <SLMF02>

#function-table(
  "Lomas darbību pārskats",
  "SLMF03",
  "Funkcijas mērķis ir izvadīt visas darbības, kuras var izpildīt attiecīgā loma.",
  [
    Ievades dati tiek iegūti no vietrāža vai lietotāja darbības.

    Obligātie parametri:
    + Spēles lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Sagatavo datubāzes pieprasījumu lomas darbību meklēšanai pēc lomas identifikatora.
    + Veic sagatavoto pieprasījumu, iegūstot aprakstu, lomas nosaukumu, lomas darbības nosaukumu.
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
      + Ja spēles loma netika atrasta, parāda 3. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir spēles lomas darbības datu izvadīšana. Lietotāja saskarnē parādās informācija par konkrētās lomas darbībām.

    + Vārdnīca:
      + Darbības apraksts -- atbilst #link(<IIDP09>)[IIDP09]\;
      + Lomas nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      + Lomas darbības nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      // + Vai lomas darbība ir tūlītēja -- karodziņš.
  ],
  [
    + Sistēmas iekšēja kļūda! Mēģiniet vēlreiz!
    + Tāda spēles lomas nav atrasta! Mēģiniet vēlreiz!
  ],
) <SLMF03>

#function-table(
  "Jaunas lomas izveidošana",
  "SLMF04",
  "Funkcijas mērķis ir izveidot spēles lomu.",
  [
    Ievades dati tiek saņemti no maksas lietotājiem un administratoriem pieejamās veidlapas.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Apraksts -- atbilst #link(<IIDP09>)[IIDP09]\;
    + Lomas darbību identifikatoru saraksts -- saraksts no identifikatoriem, kas atbilst #link(<IIDP10>)[IIDP10]\;
    + Vai pieder mafijas grupai -- karodziņš;

    Neobligātie parametri:
    + Vai ir pamata -- karodziņš, noklusētā vērtība -- nepatiess.
    + Attēls -- atbilst #link(<IIDP08>)[IIDP08], noklusētā vērtība -- noklusētā attēla datnes adrese.
  ],
  [
    + Veic maksas lietotāja darbības autorizāciju, izmantojot #link(<KPR08>)[KPR08] procedūru, vai administratora darbības autorizāciju.
      + Ja darbība nav autorizēta, parāda 10. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai apraksts un lomas nosaukums ir ievadīts.
      + Ja ievadīts, pārbauda, vai nepārsniedz noteikto garumu.
      + Ja pārsniedz, tad iegūst pārsniegto garumu parametru sarakstu un parāda 2. paziņojumu ar attiecīgajiem laukiem un garumiem. Beidz apstrādi.
      + Ja ievadīts, pārbauda, vai satur tikai pieļaujamos simbolus.
      + Ja nesatur, tad iegūst izmantotos neatļautos simbolus, tad parāda 7. paziņojumu ar attiecīgiem laukiem un simboliem. Beidz apstrādi.
    + Ja "vai ir pamata" karodziņš ir stāvoklī "patiess", autorizē administratora darbību.
      + Ja tā netiek autorizēta, parāda 8. paziņojumu. Beidz apstrādi.
    + Mēģina atrast datubāzē spēles lomu ar ievadīto nosaukumu.
      + Ja tāds pastāv, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Ja ir ievadīts lomas darbību identifikatoru saraksts, tad katram saraksta identifikatoram izveidot saistības ierakstu starp spēles lomas un spēles darbības ierakstu, pirms tam pārbaudot darbību eksistenci datubāzē.
      + Ja kāda no darbībām neeksistē, parāda 9. paziņojumu. Beidz apstrādi.

      // Image
    + Ja tika iesniegts attēls, validē attēlu ar #link(<KPR12>)[KPR12] un uzstāda pievienošanas laiku uz tagadējo laiku.
      + Ja validācija ir neveiksmīga, parāda 11. paziņojumu ar attiecīgu validācijas kļūdu.
    + Citādi saglabā vecā attēla datni, ja tāda ir.

    + Jaunas spēles lomas dati -- nosaukums, apraksts un karodziņi -- tiek ierakstīti datubāzē.
      + Ja kāda ierakstīšana nenotiek, parāda 5. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir noteikt, vai spēles loma ir veiksmīgi saglabāta. Lietotāja saskarnē parāda 4. paziņojumu. Lietotājs tiek pāradresēts lomu pārskata lapā.
    + Lomas izveidošanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!
    + Loma ar tādu nosaukumu jau eksistē! Samainiet nosaukumu un mēģiniet vēlreiz!
    + Loma veiksmīgi izveidota!
    + Sistēmas iekšēja kļūda! Mēģiniet vēlreiz!
    + Skaitlim jābūt nenegatīvam! Mēģiniet vēlreiz!
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!
    + Darbība nav autorizēta: Jūs nevarat veidot pamata lomas!
    + Viena vai vairākas darbības, ko Jūs izvēlējāties, neeksistē!
    + Darbība nav autorizēta: Jūs nevarat veidot lomas!
    + Šo attēlu nedrīkst izmantot: [validācijas kļūda\]!
  ],
) <SLMF04>

#function-table(
  "Lomas rediģēšana",
  "SLMF05",
  "Funkcijas mērķis ir rediģēt spēles lomas.",
  [
    Ievades dati tiek saņemti no maksas lietotājiem un administratoriem pieejamās veidlapas.

    Obligātie parametri:
    + Spēles lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10];
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Apraksts -- atbilst #link(<IIDP09>)[IIDP09]\;
    + Lomas darbību identifikatoru saraksts -- saraksts no identifikatoriem, kas atbilst #link(<IIDP10>)[IIDP10]\;
    + Vai pieder mafijas grupai -- karodziņš.

    Neobligātie parametri:
    + Vai ir pamata -- karodziņš;
    + Attēls -- atbilst #link(<IIDP08>)[IIDP08], noklusētā vērtība -- noklusētā attēla datnes adrese.
  ],
  [
    + Veic maksas lietotāja darbības autorizāciju, izmantojot #link(<KPR08>)[KPR08] procedūru, vai administratora darbības autorizāciju.
      + Ja darbība nav autorizēta, parāda 10. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles lomas ierakstu.
      + Ja tā netiek atrasta, parāda 9. paziņojumu. Beidz apstrādi.
    + Ja ar spēles lomu saistīts lietotāja identifikators nesakrīt ar lietotāja identifikatoru, kurš izveidoja doto spēles lomu, veic administratora darbības autorizāciju.
      + Ja tā netiek autorizēta parādīt 6. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai nosaukums un apraksts nepārsniedz noteikto garumu.
      + Ja pārsniedz, parāda 2. paziņojumu ar attiecīgajiem laukiem un garumiem. Beidz apstrādi.
    + Pārbauda, vai nosaukums un darbības nosaukums, ja ievadīts, satur tikai pieļaujamos simbolus.
      + Ja nesatur, tad iegūst izmantotos neatļautos simbolus, tad parāda 8. paziņojumu ar attiecīgajiem laukiem un simboliem. Beidz apstrādi.
    + Veido izmainīto datu sarakstu pēc turpmāk izmainītajiem laukiem.
    + Ja tika iesniegts atšķirīgs nosaukums, mēģina datubāzē atrast lomu ar ievadīto nosaukumu. Ja tāda pastāv, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Katram identifikatoram spēles lomas darbību identifikatoru sarakstā meklē darbību datubāzē.
      + Ja kāda no darbībām netika atrasta, parāda 11. paziņojumu. Beidz apstrādi.

    // Image
    + Ja tika iesniegts attēls, validē attēlu ar #link(<KPR12>)[KPR12] un uzstāda pievienošanas laiku uz tagadējo laiku.
      + Ja validācija ir neveiksmīga, parāda 12. paziņojumu ar attiecīgu validācijas kļūdu.
    + Citādi saglabā vecā attēla datni, ja tāda ir.

    + Iepriekš izmainītos laukus pievieno izmainīto lauku sarakstam un atjauno darbību saistības ar lomu. Spēles uzstādījumu sagatavotie dati -- lauki, kas ir rediģēto lauku sarakstā, tiek ierakstīti datubāzē.
      + Ja ierakstīšana nenotiek, parādīt 5. paziņojumu. Beidz apstrādi.
    + Izdzēš vecā attēla datni.
  ],
  [
    Izvades datu mērķis ir noteikt, vai spēles loma ir veiksmīgi rediģēta. Lietotāja saskarnē parāda 4. paziņojumu. Lietotājs tiek pāradresēts lomu pārskata lapā.
    + Lomas rediģēšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!
    + Loma ar tādu nosaukumu jau eksistē! Samainiet nosaukumu un mēģiniet vēlreiz!
    + Loma veiksmīgi rediģēta!
    + Lomas rediģēšana nav veiksmīga!
    + Darbība nav autorizēta: jums nepieder šī loma!
    + Skaitlim jābūt nenegatīvam! Mēģiniet vēlreiz!
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!
    + Loma netika atrasta!
    + Darbība nav autorizēta: Jūs nevarat rediģēt lomas!
    + Viena vai vairākas darbības, ko Jūs izvēlējāties, neeksistē!
    + Šo attēlu nedrīkst izmantot: [validācijas kļūda\]!
  ],
) <SLMF05>

#function-table(
  "Lomas dzēšana",
  "SLMF06",
  "Funkcijas mērķis ir neatgriezeniski dzēst spēles lomu.",
  [
    Ievades dati tiek saņemti no maksas lietotājiem un administratoriem pieejamās darbības lomu sarakstā vai lomu rediģēšanas lapā.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēles lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Veic maksas lietotāja darbības autorizāciju, izmantojot #link(<KPR08>)[KPR08] procedūru, vai administratora darbības autorizāciju.
      + Ja darbība nav autorizēta, parāda 1. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles lomas ierakstu.
      + Ja tā netiek atrasta, parāda 2. paziņojumu. Beidz apstrādi.
    + Ja ar spēles lomu saistīts lietotāja identifikators nesakrīt ar lietotāja identifikatoru, kurš izveidoja doto spēles lomu, veic administratora darbības autorizāciju.
      + Ja tā netiek autorizēta parādīt 5. paziņojumu. Beidz apstrādi.
    + Visas spēles lomas un lomas darbības daudz pret daudz starptabulas izdzēš.
      + Ja izdzēšana nav veiksmīga, parāda 4. paziņojumu. Beidz apstrādi.
    + Saglabā veco lomas datnes adresi, ja tāda ir.
    + Spēles lomas ierakstu izdzēš.
      + Ja izdzēšana nav veiksmīga, parāda 4. paziņojumu. Beidz apstrādi.
    + Izdzēš veco lomas attēlu.
  ],
  [
    Izvades datu mērķis ir noteikt spēles lomas dzēšanas stāvokli. Lietotāja saskarnē parāda 3. paziņojumu. Lietotājs ir pāradresēts uz lomu pārskata lapu, ja nepieciešams.
    + Spēles lomas dzēšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Darbība nav autorizēta: Jūs nevarat dzēst lomas!
    + Tāda loma nav atrasta!
    + Loma ir veiksmīgi izdzēsta!
    + Sistēmas iekšēja kļūda! Mēģiniet vēlreiz!
    + Darbība nav autorizēta: dzēšamā loma nav Jūsu loma!
  ],
) <SLMF06>

=== Spēles uzstādījumu modulis

#indent-par([
  Apakšnodaļa ietver spēles uzstādījumu moduļa funkcijas. Moduļa funkcionalitāte ir izmantota darbībām saistībā ar spēles uzstādījumiem. Moduļa funkciju datu plūsmas ir parādītas 2. līmeņa datu plūsmas diagrammā (skat. @fig:dpd-2-game-setup).
  Funkcijas ir aprakstītas atsevišķās tabulās (skat.
  #link(<SUMF01>)[SUMF01],
  #link(<SUMF02>)[SUMF02],
  #link(<SUMF03>)[SUMF03],
  #link(<SUMF04>)[SUMF04],
  #link(<SUMF05>)[SUMF05]).
])

#figure(
  caption: "Spēles uzstādījumu moduļa 2. līmeņa DPD",
  image("img/dpd2/SpēlesUzstādījumuModulis.svg"),
) <dpd-2-game-setup>

#function-table(
  "Spēles uzstādījumu pārskats",
  "SUMF01",
  "Funkcijas mērķis ir sniegt pārskatu par spēles uzstādījumiem.",
  [
    Ievades dati tiek iegūti no vietrāža.

    Neobligātie parametri:
    + Lappuses numurs -- vesels pozitīvs skaitlis, noklusētā vērtība -- 1.
    + Meklēšanas uzvedne -- simbolu virkne, atbilst #link(<IIDP14>)[IIDP14], noklusētā vērtība -- "".
    + Kārtošanas vārdnīcu saraksts - atbilst #link(<IIDP20>)[IIDP20], noklusētā vērtība -- tukšs saraksts.
    + Filtru vārdnīcu saraksts -- atbilst #link(<IIDP19>)[IIDP19], noklusētā vērtība -- tukšs saraksts.
  ],
  [
    + Sāk gatavot datubāzes pieprasījumu no spēles uzstādījumu tabulas.
    + Sagatavo pārskata pieprasījumu un iegūst lappuses numuru un kopējo lappušu skaitu, izmantojot #link(<KPR07>)[KPR07] ar lappuses numuru, meklēšanas uzvedni, kārtošanas vārdnīcu sarakstu, filtru vārdnīcu sarakstu, šos parametrus iesniedzot, ja tie ir iesniegti funkcijā.
      + Ja lappušu skaits ir 0, tad parāda 1. paziņojumu. Beidz apstrādi.
    + Veic sagatavoto pieprasījumu, iegūstot spēles uzstādījuma nosaukumu, aprakstu, vai tas ir pamata un izveidošanas laiku.
      + Ja pieprasījums neizdodas, parāda 2. paziņojumu. Beidz apstrādi.
    + Pie rezultāta vārdnīcai aktīvuma karodziņu -- meklē spēles istabas tekošās spēles stāvoklī un ja atrod vismaz vienu tādu istabu, tad spēles uzstādījums ir aktīvs.
    + Aprēķina maksimālo spēlētāju skaitu, meklējot datubāzē ar spēles uzstādījumu saistītās spēles lomas un saskaitot kopā to skaitus katram uzstādījumam.
      + Ja kāda no lomām netiek atrasta, izņem spēles uzstādījumu no saraksta.

  ],
  [
    Izvades datu mērķis ir spēles virtuālās istabas uzstādījumu datu izvadīšana. Lietotāja saskarnē parādās saraksts ar informāciju par spēles uzstādījumiem.

    + Vārdnīcu saraksts:
      + Nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\.
      + Apraksts -- atbilst #link(<IIDP09>)[IIDP09]\;
      + Vai ir pamata -- karodziņš;
      + Vai ir aktīvs -- karodziņš;
      + Nepieciešamo spēlētāju skaits -- vesels pozitīvs skaitlis\;
      + Izveidošanas laiks -- atbilst #link(<IIDP02>)[IIDP02].
  ],
  [
    + Neviens spēles uzstādījums nav atrasts!
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
  ],
) <SUMF01>

#function-table(
  "Spēles uzstādījuma lomu pārskats",
  "SUMF02",
  "Funkcijas mērķis ir sniegt pārskatu ar daļēju informāciju par spēles uzstādījumu lomām.",
  [
    Ievades dati tiek iegūti no vietrāža.

    Obligātie parametri:
    + Spēles uzstādījumu identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Sagatavo datubāzes pieprasījumu no spēles uzstādījumu tabulas.
    + Pieprasījumam pievieno atlasīšanu pēc spēles uzstādījuma identifikatora.
    + Sagatavo pieprasījumu lauku sarakstu: lomu identifikatori, nosaukumi, attēli, piederība mafijai.
    + Veic sagatavoto pieprasījumu, pieprasot iepriekš sagatavoto lauku sarakstu.
      + Ja pieprasījums neizdodas, parāda 1. paziņojumu. Beidz apstrādi.
      + Ja spēles uzstādījums netika atrasts, parāda 2. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir spēles virtuālās istabas uzstādījumu datu izvadīšana. Lietotāja saskarnē parādās saraksts ar konkrēta spēles uzstādījuma lomu informācija.

    + Vārdnīca:
      + Lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Lomas nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
      + Vai pieder mafijai -- karodziņš;
      + Lomas attēls -- atbilst #link(<IIDP08>)[IIDP08].
  ],
  [
    + Sistēmas iekšējā kļūda! Mēģiniet vēlreiz!
    + Tāds spēles uzstādījums nav atrasts! Mēģiniet vēlreiz
  ],
) <SUMF02>

#function-table(
  "Jauna spēles uzstādījuma izveidošana",
  "SUMF03",
  "Funkcijas mērķis ir izveidot spēles uzstādījumu, turpmākai izmantošanai spēlē.",
  [
    Ievades dati tiek saņemti no maksas lietotājiem un administratoriem pieejamās veidlapas.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Apraksts -- atbilst #link(<IIDP09>)[IIDP09].
    + Lomu datu vārdnīcu saraksts -- saraksts ar vārdnīcām;
      + Lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Skaits - vesels pozitīvs skaitlis.

    Neobligātie parametri:
    + Vai ir pamata -- karodziņš.

  ],
  [
    + Veic maksas lietotāja darbības autorizāciju, izmantojot #link(<KPR08>)[KPR08] procedūru, vai administratora darbības autorizāciju.
      + Ja darbība nav autorizēta, parāda 9. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, parāda 1. paziņojumu ar attiecīgajiem laukiem. Beidz apstrādi.
    + Pārbauda, vai nosaukums un darbības nosaukums, ja ievadīts, satur tikai pieļaujamos simbolus.
      + Ja nesatur, parāda 6. paziņojumu ar attiecīgi laukiem un simboliem. Beidz apstrādi.
    + Pārbauda, vai nosaukums un apraksts nepārsniedz noteikto garumu.
      + Ja pārsniedz, parāda 2. paziņojumu ar attiecīgajiem laukiem un garumiem. Beidz apstrādi.
    + Mēģina atrast datubāzē uzstādījumus ar ievadīto nosaukumu.
      + Ja tāds pastāv, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Katrai vārdnīcai no lomu datu vārdnīcu saraksta veic sekojošas manipulācijas.
      + Meklē lomu datubāzē.
        + Ja tā neeksistē, parāda 10. paziņojumu. Beidz apstrādi.
      + Ja skaits nav pozitīvs, parāda 7. paziņojumu. Beidz apstrādi.
      + Lomas skaitu pieskaita pie skaita summas.
    + Ieraksta izveidošanas laiku uzstāda uz tagadējo laiku.
    + Pārbauda, vai lomu kopējais skaits (skaitu summa) atbilst noteiktai skaita robežai.
      + Ja neatbilst, parāda 8. paziņojumu. Beidz apstrādi.
    + Jaunas spēles uzstādījuma dati -- apraksts, nosaukums, karodziņš -- un attiecīgas lomu saistības tiek ierakstītas datubāzē.
      + Ja ierakstīšana nenotiek parāda 5. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir noteikt, vai spēles uzstādījumi ir veiksmīgi saglabāti. Lietotāja saskarnē parāda 7. paziņojumu. Lietotāju pāradresē lomu pārskata lapā.
    + Uzstādījumu izveidošanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!
    + Spēles uzstādījums ar tādu nosaukumu jau eksistē! Samainiet nosaukumu un mēģiniet vēlreiz!
    + Spēles uzstādījums ir veiksmīgi izveidots!
    + Sistēmas iekšēja kļūda! Mēģiniet vēlreiz!
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!
    + Lomas skaitam jābūt pozitīvam skaitlim!
    + Lomu skaitam jābūt [lomas skaita robežas]!
    + Darbība nav autorizēta: Jūs nevarat izveidot jaunu spēles uzstādījumu!
    + Viena vai vairākas no Jūsu izvēlētām lomām neeksistē!
  ],
) <SUMF03>

#function-table(
  "Spēles uzstādījuma rediģēšana",
  "SUMF04",
  "Funkcijas mērķis ir rediģēt spēles uzstādījumu.",
  [
    Ievades dati tiek saņemti no maksas lietotājiem un administratoriem pieejamās veidlapas.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēles uzstādījuma identifikators -- atbilst #link(<IIDP10>)[IIDP10]. Noklusētā vērtība -- no konteksta spēles uzstādījumu, kas tiek rediģēts, iegūtais identifikators.
    + Apraksts -- atbilst #link(<IIDP09>)[IIDP09]\;
    + Nosaukums -- atbilst #link(<IIDP21>)[IIDP21]\;
    + Lomu datu vārdnīcu saraksts -- saraksts ar vārdnīcām;
      + Lomas identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
      + Skaits - vesels pozitīvs skaitlis.

    Administratoram specifiskie ievaddati:
    + Vai ir pamata -- karodziņš, noklusētā vērtība -- nepatiess.
    + Izveidošanas laiks -- datums formatēts kā simbolu virkne, noklusētā vērtība -- tagadējais laiks.

  ],
  [
    + Veic maksas lietotāja darbības autorizāciju, izmantojot #link(<KPR08>)[KPR08] procedūru, vai administratora darbības autorizāciju.
      + Ja darbība netiek autorizēta, parādīt 11. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles uzstādījumu.
      + Ja tas netiek atrasts. Parāda 11. paziņojumu. Beidz apstrādi.
    + Ja ar spēles uzstādījumu saistīts lietotāja identifikators nesakrīt ar lietotāja identifikatoru, veic administratora darbības autorizāciju.
      + Ja darbība nav autorizēta. Parāda 6. paziņojumu.
    + Veido izmainīto datu sarakstu pēc turpmāk izmainītajiem laukiem.
    + Pārbauda, vai visi obligātie lauki ir iesniegti.
      + Ja nav, iegūst sarakstu ar neaizpildītajiem laukiem un parāda 1. paziņojumu. Beidz apstrādi.
    + Pārbauda, vai nosaukums un darbības nosaukums, ja ievadīts, satur tikai pieļaujamos simbolus.
      + Ja nesatur, tad iegūst izmantotos neatļautos simbolus, tad parāda 9. paziņojumu ar attiecīgi laukiem un simboliem. Beidz apstrādi.
    + Pārbauda, vai nosaukums un apraksts nepārsniedz noteikto garumu.
      + Ja pārsniedz, tad iegūst pārsniegto garumu parametru sarakstu un parāda 2. paziņojumu ar attiecīgajiem laukiem un garumiem. Beidz apstrādi.
      + Ja tika iesniegts atšķirīgs nosaukums, mēģina datubāzē atrast uzstādījumus ar ievadīto nosaukumu.
      + Ja tāds pastāv, tad parāda 3. paziņojumu. Beidz apstrādi.
    + Iepriekš izmainītos laukus pievieno izmainīto lauku sarakstam.
    + Autorizē administratora darbību. Ja darbība ir autorizēta, veic sekojošās darbības.
      + Pārbauda, vai datumam ir korekts formāts.
        + Ja nav, parāda 7. paziņojumu. Beidz apstrādi.
      + Pārbauda, vai datums ir pagātnē vai tagad. Beidz apstrādi.
      + Ja datums ir nākotnē, parāda 8. paziņojumu. Beidz apstrādi.
      + Sagatavotiem datiem pievieno administratoriem specifiskās. Beidz apstrādi.
    + Katrai vārdnīcai no lomu datu vārdnīcu saraksta veic sekojošas manipulācijas.
      + Meklē lomu datubāzē.
        + Ja tā neeksistē, parāda 13. paziņojumu. Beidz apstrādi.
      + Ja skaits nav pozitīvs, parāda 4. paziņojumu. Beidz apstrādi.
      + Lomas skaitu pieskaita pie skaita summas.
    + Pārbauda, vai lomu kopējais skaits (skaitu summa) atbilst noteiktam skaita robežai.
      + Ja neatbilst, parāda 8. paziņojumu. Beidz apstrādi.
    + Spēles uzstādījumu sagatavotie dati -- lauki, kas ir rediģēto lauku sarakstā -- tiek ierakstīti un lomu jaunās saistības datubāzē.
      + Ja ierakstīšana nenotiek, parādīt 5. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir noteikt spēles uzstādījumu rediģēšanas stāvokli. Lietotāja saskarnē parāda 10. paziņojumu. Lietotājs tiek pāradresēts uz spēles uzstādījumu pārskata lapu.
    + Spēles uzstādījumu rediģēšanas apstiprinājuma stāvoklis -- skaitlisks kods.
  ],
  [
    + Lauks: [neaizpildīto lauku saraksts] netika aizpildīts (/-i)!
    + [Parametra nosaukums] nedrīkst pārsniegt [noteikto parametra maksimālo simbolu skaits]!
    + Spēles uzstādījums ar tādu nosaukumu jau eksistē! Samainiet nosaukumu un mēģiniet vēlreiz!
    + Lomas skaitam jābūt pozitīvam skaitlim!
    + Spēles uzstādījuma rediģēšana nav veiksmīga!
    + Darbība nav autorizēta: Jums nepieder šis spēles uzstādījums!
    + Nekorekts datums! Datuma formāts: [nepieciešamais datuma formāts].
    + Izveidošanas datums nedrīkst būt nākotnē!
    + [Parametra nosaukums] nedrīkst saturēt: [izmantoto parametra neatļauto simbolu saraksts]!
    + Spēles uzstādījums ir veiksmīgi rediģēts!
    + Tāds spēles uzstādījums netika atrasts!
    + Darbība nav autorizēta: Jūs nevarat rediģēt spēles uzstādījumus!
    + Viena vai vairākas no Jūsu izvēlētām lomām neeksistē!
  ],
) <SUMF04>

#function-table(
  "Spēles uzstādījuma dzēšana",
  "SUMF05",
  "Funkcijas mērķis ir neatgriezeniski dzēst spēles virtuālās istabas uzstādījumus.",
  [
    Ievades dati tiek saņemti no maksas lietotājiem un administratoriem pieejamās darbības spēles uzstādījumu sarakstā vai spēles uzstādījumu lapā.

    Obligātie parametri:
    + Lietotāja identifikators -- atbilst #link(<IIDP10>)[IIDP10]\;
    + Spēles uzstādījuma identifikators -- atbilst #link(<IIDP10>)[IIDP10].
  ],
  [
    + Veic maksas lietotāja darbības autorizāciju, izmantojot #link(<KPR08>)[KPR08] procedūru, vai administratora darbības autorizāciju.
      + Ja darbība netiek autorizēta, parādīt 1. paziņojumu. Beidz apstrādi.
    + Datubāzē meklē spēles uzstādījumu.
      + Ja tas netiek atrasts. Parāda 6. paziņojumu. Beidz apstrādi.
    + Ja ar spēles uzstādījumu saistīts lietotāja identifikators nesakrīt ar lietotāja identifikatoru, veic administratora darbības autorizāciju.
      + Ja darbība nav autorizēta. Parāda 7. paziņojumu.
    + Pārbauda, vai uzstādījums pašlaik ir aktīvs, meklējot datubāzē aktīvas spēles istabas, kas izmanto spēles uzstādījumu.
      + Ja tādas ir, parāda 3. paziņojumu. Beidz apstrādi.
    + Uzstādījumu ierakstu izdzēš.
      + Ja izdzēšana nav veiksmīga, parāda 5. paziņojumu. Beidz apstrādi.
  ],
  [
    Izvades datu mērķis ir noteikt spēles uzstādījumu dzēšanas stāvokli. Lietotāja saskarnē parāda 4. paziņojumu. Lietotājs tiek pāradresēts spēles uzstādījumu pārskata lapā, ja nepieciešams.

    + Spēles uzstādījumu dzēšanas stāvoklis -- skaitlisks kods.
  ],
  [
    + Darbība nav autorizēta: Jūs nevarat dzēst spēles uzstādījumus!
    + Tāds spēles uzstādījums nav atrasts! Mēģiniet vēlreiz!
    + Spēles uzstādījumi pašlaik tiek izmantoti. Mēģiniet vēlreiz vēlāk.
    + Spēles uzstādījums ir veiksmīgi izdzēsts!
    + Sistēmas iekšēja kļūda! Mēģiniet vēlreiz!
    + Spēles uzstādījums netika atrasts!
    + Darbība nav autorizēta: Jūs nevarat dzēst šo spēles uzstādījumu!
  ],
) <SUMF05>


== Nefunkcionālās prasības
=== Veiktspējas prasības
==== Statiskā veiktspēja

#indent-par([
  Uz statisko veiktspēju ir sekojošas prasības:
])

- Normāla sistēmas darbība vismaz 500 lietotājiem paralēli.
- Normāla sistēmas darbība ar vismaz 40 paralēlām spēles instancēm.

==== Dinamiskā veiktspēja

#indent-par([
  Uz dinamisko veiktspēju ir sekojošas prasības:
])

// CHANGE !
- Sistēmai ir jānodrošina, ka 95% no dienā veiktajiem pieprasījumiem tiek izpildīti uz servera ne ilgāk kā 3 sekundēs un 95% no dienā veiktam darbībām spēles procesā jāizpildās ne ilgāk kā 4 sekundēs.
- Darbspējas laiks ir vismaz 99% no visa laika.

=== Atribūti
==== Izmantojamība

#indent-par([
  Uz sistēmas izmantojamību ir sekojošas prasības:
])

- 90% jaunu lietotāju jāspēj lietot visas tiem pieejamās funkcijas bez palīdzības.
- Sistēmai jāatbalsta reaģējošs noformējums -- jāpielāgojas dažādiem ekrānu izmēriem.
- Saskarnēm jābūt adaptētām gan priekš ainavas, gan portreta orientācijas.
- Teksta fonta izmēram datoru ekrāniem jābūt vismaz 14 pikseļiem, labas salasāmības nodrošināšanai.
- Visām funkcijām palīdzības ziņojumi pieejami angļu un latviešu valodā.
- Sistēmai ir jānodrošina, ka lietotājam pirms datu dzēšanas tiek pieprasīts darbību apstiprināt.
- Izveidota piekļuves programmsaskarnes (API) integrācija ar ārējiem pakalpojumiem: maksājumu apstrādātāja un mākoņa balstīts e-pasta pakalpojumu sniedzējs.
- Lapas kodējumā jāizmanto funkcijas un tehnoloģijas, kas tiek atbalstītas visās izplatītajās tīmekļa pārlūkprogrammās, nodrošinot piekļuvi sistēmai no dažādām operētājsistēmām.

==== Mērogojamība

#indent-par([
  Sistēmai jābūt paredzētai gan vertikālai, gan horizontālai mērogošanai. Inkrementālai slodzes izmaiņai ir pielietojama vertikāla mērogošana. Savukārt, kardinālai slodzes izmaiņai ir pielietojama horizontālā mērogošana. Horizontālās mērogošanas vienkāršošanai funkcionalitāte tiks sadalījuma pakalpojumu komponentēs.
])

==== Drošība

#indent-par([
  Sistēmas drošības atribūti ir kategorizēti sarakstā:
])

- Autentifikācija:
  - Paroles tiek glabātas šifrētā formātā, pirms šifrēšanas, tām pievieno sāli.
  - Sāls tiek saglabāts teksta formātā pie lietotāja ieraksta.
  - Paroles atiestatīšanai tiek izmantots marķieris ar derīguma termiņu, ģenerēts ar jaucējfunkciju.
- Autorizācija:
  - Sistēmā ir jārealizē uz lomu bāzēta piekļuve, kas nosaka noteiktās darbības noteiktām sistēmas lietotāju grupām.
  - Autorizācijas pārbaude gan priekšgala saskarnē, gan aizmugursistēmā.
- Datu aizsardzība:
  - Paroles, maksājuma informācijas un citu ierobežotas piekļuves datu šifrēšana, tos glabājot un sūtot.
  - Sistēmai nav jāglabā dati, kas nav nepieciešami sistēmas darbībai.
- Sesiju pārvalde:
  - Izmanto tikai HTTP sīkdatnes.
  - Sesijas noildzes izmantošana.
  - Sesijas atpazīšana tiek realizēta, izmantojot sīkdatnes.
- Ievades pārbaude un dezinficēšana:
  - Aizsardzība pret SQL injekcijām, komandu injekcijām un citiem injekciju veidiem.
  - Visu ārējo pieprasījumu dati ir validēti un sanitizēti, ja nepieciešams.
  - Ieviesiet pareizu validāciju visiem lietotāja ievadītajiem datiem un visiem datiem, kas saņemti no ārējām sistēmām.
- Aizsardzība pret tīmekļa apdraudējumiem:
  - Aizsardzība pret CSRF) uzbrukumiem ar CSRF marķiera izmantošanu.
  - Aizsardzība pret starpvietņu-skriptošanas (XSS) uzbrukumiem.
- Kļūdu apstrāde:
  - Kļūdu paziņojumi neatklāj ierobežotas piekļuves informāciju.
  - Kļūdu paziņojumi ir pielāgoti lietotāju grupai - sistēmas lietotāji, kas nepieder administratoru grupai, neredz ar sistēmas iekšējiem komponentiem saistīto informāciju, piemēram, datubāzes kļūmes.
- API:
  - API marķieru izmantošana, izņemot publiski pieejamos API galapunktos.
  - API pieprasījumu ierobežojums laikā (vienam lietotājam un vienai IP adresei).
  - Visu API pieprasījumu ievades validācija un sanitizēšana, ja nepieciešams.
- Datņu augšuplādēšana:
  - Datnes, kas tiek augšuplādētas, tiek analizētas pret ļaunatūru pirms uzglabāšanas.
  - Datņu lielums un datu tips tiek validēts.
- Rezerves kopēšana:
  - Rezerves kopijas izveidošanai jānotiek noteiktā laika periodā automātiski lokālā glabātuvē.
  - Automatizēta procedūra sistēmas datu atjaunošanai, datu zaudēšanas vai bojājumu gadījumā.
- Darbību žurnāls:
  - Darbību žurnāla uzturēšana.
  - Darbību žurnāls nesatur ierobežotas piekļuves informāciju.
  - Darbību žurnāla rezerves kopēšana atsevišķi no pamata rezerves kopijām.


==== Uzturamība

#indent-par([
  Pret sistēmas izstrādājamo programmatūras uzturamību tiek izvirzītas sekojošās prasības:
])

// - Ciklomātiskā sarežģītība nepārsniedz 10.
- API dokumentācijas pārklājumam jābūt vismaz 80%.
- Koda testēšanas pārklājumam jābūt vismaz 70%.
// - Moduļu fan-out metriks (ārējo moduļu izsaukuma izskaušanas skaits šī moduļa ietvaros) nepārniedz 7.
// - Moduļu fan-out metriks (ārējo moduļu izsaukuma skaits ārpus šī moduļa ietvariem) jābūt nepārniedz 11.
- Programmatūrā ir realizēta automātiska vairs nevajadzīgo datu izdzēšana diska vietas atbrīvošanai, piemēram, darbības spēlēs, kas notikušas pirms 840 stundām (5 nedēļām).

==== Pārnesamība

#indent-par([
  Sistēmas programmatūrā ir jārealizē migrācijas skripti, kas nodrošina
  strukturētu datu glabāšanu pārnešanas laikā, datu dublēšanu un ģenerē
  kontrolsummas datu integritātei. Pēc sistēmas migrācijas ir jābūt realizētiem
  datu pārbaudes skriptiem, datu integritātes pārbaudei.
])

=== Projekta ierobežojumi

==== Intelektuālā īpašuma tiesības

#indent-par([
  Projektā jāievēro autortiesību un preču zīmju likumi. Lai izvairītos no
  juridiskām problēmām, ir jāsaņem atbilstošas atļaujas un licences par spēļu
  aktīviem (assets).
])

/*
==== Atbilstība standartiem

#indent-par([
Šajā sadaļā ir izklāstīti galvenie standarti, kā prasībām sistēmai ir
jāatbilst, lai nodrošinātu robustumu, uzticamību un lietotāju tiesību un
cerību ievērošanu.
])

===== Datu privātuma atbilstība

#indent-par([
Sistēmai ir jāatbilst datu aizsardzības noteikumiem, tostarp
vispārīgajai datu aizsardzības regulai (GDPR - General Data Protection
Regulation). Ir būtiski noteikt visaptverošu datu apstrādes praksi, lai
nodrošinātu lietotāju datu konfidencialitāti un drošību.
])

===== Pieejamības standarti

#indent-par([
Lai nodrošinātu vienlīdzīgu piekļuvi visiem lietotājiem, sistēmai
jāatbilst tīmekļa satura pieejamības vadlīnijām (WCAG - Web Content
Accessibility Guidelines) attiecībā uz tīmekļa pieejamību. Jāapsver
lokalizācijas un iekļaušanas iespējas, lai pielāgotos dažādām
auditorijām.
])

===== Drošības standarti

#indent-par([
Jāievieš stingri drošības pasākumi, ievērojot nozares paraugpraksi,
piemēram, atvērto lietojumprogrammu drošības projektu visā pasaulē
(OWASP - Open Worldwide Application Security Project), lai pasargātu no
bieži sastopamām tīmekļa ievainojamībām. Datu aizsardzībai jāizmanto
šifrēšanas protokoli.
])
*/

==== Aparatūras ierobežojumi

===== Atbalstītās ierīces

#indent-par([
  Sistēmai jābūt saderīgai ar dažādām ierīcēm, tostarp galddatoriem,
  klēpjdatoriem, viedtālruņiem un planšetdatoriem. Lai nodrošinātu
  netraucētu spēlēšanu, jānosaka minimālās aparatūras prasības.
])

===== Serveris un mitināšana

#indent-par([
  Uz servera, kurā tiek mitināta sistēma, jābūt pieejamam Docker
  programmatūras atbalstam, lai standartizētu programmatūras izvietošanu
  ražošanas vidē un ražošanas vides simulēšanai un atvieglotai
  tehnoloģiju versiju sinhronizācijai ar izstrādes vidi.
])

=== Ārējās saskarnes prasības

==== Lietotāja saskarne

#indent-par([
  Sistēmas "Mafija" vietne piedāvā atbalstu plašam spektram ekrāna formātu un izmēriem, nodrošinot elastīgu un reaktīvu dizainu, kas pielāgojas lietotāja ierīces un ekrāna izmēram. Tas ietver, bet nav ierobežots ar sekojošiem prasītajiem ekrāna formātiem un attiecībām:
])

- Atbalstāmās ekrāna attiecības (platums:augstums): 16:9; 4:3; 1:1; 3:2; 21:9;
- Atbalstāmie ekrānu izmēri (Mobilās ierīces):
  - Mazie mobilie ekrāni (maksimāli 360 pikseļu plati): Piemēram, iPhone 5 un līdzīgi.
  - Parastie mobilie ekrāni (maksimāli 414 pikseļu plati): Piemēram, iPhone 6/7/8 un daudzi Android telefoni.
  - Plašie mobilie ekrāni (maksimāli 768 pikseļu plati): Piemēram, daži planšetdatori un lieli mobilo ierīču ekrāni.
- Atbalstāmie ekrānu izmēri (Planšetdatori):
  - Mazie planšetdatoru ekrāni (maksimāli 768 pikseļu plats): Piemēram, 7 collu planšetdatori.
  - Parastie planšetdatoru ekrāni (maksimāli 1024 pikseļu plats): Piemēram, 10 collu planšetdatori.
- Atbalstāmie ekrānu izmēri (Datori):
  - Mazie datoru ekrāni (maksimāli 1280 pikseļu plats): Piemēram, daži nelieli datoru ekrāni.
  - Parastie datoru ekrāni (maksimāli 1440 pikseļu plats): Parastie datoru ekrāni ar vidēju izšķirtspēju.
  - Lielie datoru ekrāni (maksimāli 1920 pikseļu plats): Plaši lietoti augstas izšķirtspējas datoru ekrāni.
  - Ļoti lielie datoru ekrāni (lielāki par 1920 pikseļiem): Piemēram, 4K ekrāni un daudzi datoru monitori.

#indent-par([
  Grafiskā izkārtojuma pielāgošanai paredzēts izmantot sekojošos ekrāna izmēra precizējumu punktus:
])

- 360px -- maziem mobilajiem ekrāniem.
- 768px -- plašiem mobilajiem ekrāniem un maziem planšetdatoru ekrāniem.
- 1024px -- parastiem planšetdatoriem un maziem datoru ekrāniem.
- 1440px -- lieliem datoru ekrāniem.
- 1920px -- ļoti lieliem un augstas izšķirtspējas datoru ekrāniem.

#indent-par([
  Lietotāja saskarne piedāvā pielāgotu izkārtojumu un saturu, kas pilnībā atbilst konkrētam ekrāna formātam un izmēram.
  Teksta izvietojums ir optimizēts atbilstoši ekrāna izmēram, izmantojot precīzi pielāgojamu fonta izmēru un stilu, lai nodrošinātu ērtu lasīšanu.
  Lietotne var iekļaut teksta formatējuma klāstā, bet nav ierobežota ar aprakstītiem teksta elementu noformējumiem (skat. @tbl:font-size tab.).
])

#pagebreak(weak: true)
#figure(
  caption: "Teksta elementu noformējuma specifikācija",
  kind: table,
  tablex(
    columns: 5,

    [*Teksta elementa klase*],
    [*Izmērs*],
    [*Svars*],
    [*Stils*],
    [*Cits*],

    [H1:\ Galvenais virsraksts],
    "vismaz 64pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Var izmantot atšķirīgu krāsu, lai izceltu no citiem virsrakstiem.",
    [H2:\ Apakšvirsraksti],
    "vismaz 24pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Var izmantot atšķirīgu krāsu, lai izceltu no pamata teksta.",
    [H3:\ Sekundārie virsraksti],
    "36pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Var izmantot atšķirīgu krāsu.",
    [H4:\ Apakšvirsraksti],
    "18pt",
    "Medium (vidējs treknraksts)",
    "Regulārs",
    "Izcelt ar atšķirīgu krāsu.",
    "H5",
    "16pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "H6",
    "14pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "Pamatteksts",
    "12pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "Saturteksts",
    "14pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Var izmantot slīprakstu, lai akcentētu citātus vai īpaši teksta fragmentus.",
    "Citāti un īpaši akcentēti teksti",
    "16pt",
    "Regulārs (parasts)",
    "Italics (slīpraksts)",
    "Lai iezīmētu citātus vai īpaši akcentētu tekstus var izmantot slīprakstu.",
    "Sarunas un komentāri",
    "18pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Var izmantot atšķirīgu krāsu, lai nošķirtu saturiskās daļas",
    "Standarta saites",
    "12pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Izmantot krāsas un pasvītrojumu, lai izceltu saites.",
    "Apmeklētās un neapmeklētās saites",
    "12pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Izmantot krāsas un pasvītrojumu, lai atšķirtu apmeklētās un neapmeklētās saites.",
    "Numurētās un nenumurētās saraksta vienības",
    "16pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Izmantot atzīmes (bullets) vai numurēšanas stilu.",
    "Atzīmes (bullets)",
    "12pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "Tabulu teksts un tabulu virsraksti",
    "14pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "Ievades lauki",
    "16pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "Izvēles rūtiņas un radio pogas",
    "12pt",
    "Regulārs (parasts)",
    "Regulārs",
    "Var izmantot atšķirīgu krāsu.",
    "Ievades lauku kļūdu ziņojumi",
    "10pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
    "Galvenās navigācijas saites",
    "18pt",
    "Bold (treknraksts)",
    "Regulārs",
    "",
    "Sānu paneļa navigācijas saites",
    "10pt",
    "Regulārs (parasts)",
    "Regulārs",
    "",
  ),
) <font-size>

// ==== Apratūras saskarne
// ==== Programmatūras saskarne

==== Sakaru saskarne

#indent-par([
  Visas iekšējās komponentes (pakalpojumi) komunicē, izmantojot HTTPS (drošu HTTP).
  Komunikācija ar ārējo pakalpojumu sniedzēju API notiek, izmantojot HTTPS.
])


#pagebreak(weak: true)
= Programmatūras projektējuma apraksts

== Datu bāzes projektējums

/* Loģiskais un fiziskais DB modelis + apraksta pāreju no konceptuālā uz loģisko un pēc tam uz fizisko (ja sistēma vienkārša, loģisko var izlaist) */

=== Datu bāzes loģiskais ER modelis

#indent-par([
  Loģiskajā modelī datubāze tika normalizēta uz BCNF, tāpēc bija nepieciešams izveidot atsevišķas tabulas katram daudzvērtību atribūtam, kā parādīts @fig:logical-erd attēlā.
])

#figure(
  caption: "Datu bāzes loģiskais ER modelis",
  image("img/erd/LogiskaisERDModelis.svg"),
) <logical-erd>

=== Datu bāzes fiziskais ER modelis

#indent-par([
  Fiziskajā modelī, salīdzinot ar loģisko modeli, nav redzamas pamanāmas izmaiņas, kā parādīts @fig:logical-erd un @fig:physical-erd attēlā.
])

#figure(
  caption: "Datu bāzes fiziskais ER modelis",
  image("img/erd/FiziskaisERDModelis.png"),
) <physical-erd>

=== Datu bāzes tabulu apraksts


#indent-par([
  Datubāzes tabulu lauku, datu tipi, lauka atribūti -- obligātums, noklusētās vērtības, primārā atslēga, unikalitāte -- ir aprakstītas atsevišķās tabulās (skat.
  @tbl:entity-role-action tab.,
  @tbl:entity-image tab.,
  @tbl:entity-session tab.,
  @tbl:entity-password-recovery tab.,
  @tbl:entity-email-confirmation tab.,
  @tbl:entity-game-role tab.,
  @tbl:entity-account-status tab.,
  @tbl:entity-room-status tab.,
  @tbl:entity-player-status tab.,
  @tbl:entity-user tab.,
  @tbl:entity-game-setup tab.,
  @tbl:entity-room tab.,
  @tbl:entity-game-event tab.,
  @tbl:entity-player tab.,
  @tbl:entity-message tab.
  @tbl:entity-player-action tab.
  @tbl:entity-player-causes-event tab.
  @tbl:entity-player-influences-event tab.
  @tbl:entity-game-setup-roles tab.
  @tbl:entity-event-actions tab.
  @tbl:entity-game-role-events tab.
  @tbl:entity-answer tab.)
  Visām tabulām `VARCHAR` un `TEXT` laukiem tiek lietot UTF8 kodējums.
])

Saliktā atslēga tiek izmantota kā primārā atslēga daudziem pret daudziem entitātem (skat.
@tbl:entity-player-action tab.
@tbl:entity-player-causes-event tab.
@tbl:entity-player-influences-event tab.
@tbl:entity-game-setup-roles tab.
@tbl:entity-event-actions tab.
@tbl:entity-game-role-events tab.)

#entity-table(
  caption: "LomasDarbiba",
  "nosaukums",
  "varchar(255)",
  "unique, not null",
  "Lomas darbības nosaukums",
  "apraksts",
  "text",
  "default '', not null",
  "Lomas darbības apraksts",
) <entity-role-action>

#entity-table(
  caption: "Attels",
  "datnes_adrese",
  "varchar(255)",
  "unique, not null",
  "Saglabātā attēla adrese operētājsistēmā",
  "pievienosanas_laiks",
  "timestamp",
  "default current_timestamp, not null",
  "Laiks, kad tika izveidots/saglabāts dotais attēls datubāzē",
) <entity-image>

#entity-table(
  caption: "Sesija",
  "markieris",
  "varchar(255)",
  "unique, not null",
  "Ģenerēts marķieris lietotāja sesijas",
  "deriguma_termins",
  "timestamp",
  "not null",
  "Laiks, līdz kuram sesija ir aktīva",
) <entity-session>

#entity-table(
  caption: "ParolesAtjaunosana",
  "markieris",
  "varchar(255)",
  "unique, not null",
  "Ģenerēts marķieris paroles atjaunošanai",
  "deriguma_termins",
  "timestamp",
  "not null",
  "Laiks, līdz kuram paroles atjaunošana ir iespējama",
) <entity-password-recovery>

#entity-table(
  caption: "EpastaApstiprinajums",
  "markieris",
  "varchar(255)",
  "unique, not null",
  "Ģenerēts marķieris e-pasta lietotāja apstiprināšanai",
  "deriguma_termins",
  "timestamp",
  "not null",
  "Laiks, līdz kuram e-pasta apstiprināšana ir iespējama",
) <entity-email-confirmation>

#entity-table(
  caption: "SpelesLoma",
  "nosaukums",
  "varchar(255)",
  "unique, not null",
  "Lomas nosaukums",
  "apraksts",
  "text",
  "default '', not null",
  "Lomas apraksts",
  "ir_pamata",
  "bool",
  "default false, not null",
  "Vai loma ir spēles pamatā vai lietotāju izveidots?",
  "ir_mafija",
  "bool",
  "default false, not null",
  "Vai loma ir mafija?",
  "attels",
  "int8",
  "",
  [Lomas attēls, `FOREING KEY`, uz #link(<entity-image>)[Attels] tabulas id kolonnu],
  "autors",
  "int8",
  "",
  [Lomas izveides autors, `FOREING KEY`, uz #link(<entity-user>)[Lietotajs] tabulas id kolonnu],
) <entity-game-role>

#entity-table(
  caption: "KontaStavoklis",
  "birka",
  "varchar(255)",
  "unique, not null",
  "Konta stāvokļa apraksts",
) <entity-account-status>

#entity-table(
  caption: "IstabasStavoklis",
  "birka",
  "varchar(255)",
  "unique, not null",
  "Istabas stāvokļa apraksts",
) <entity-room-status>

#entity-table(
  caption: "SpeletajaStavoklis",
  "birka",
  "varchar(255)",
  "unique, not null",
  "Speletaja stāvokļa apraksts",
) <entity-player-status>

#entity-table(
  caption: "Lietotajs",
  "segvards",
  "varchar(255)",
  "unique, not null",
  "Lietotājvārds",
  "epasts",
  "varchar(255)",
  "unique, not null",
  "Lietotāja e-pasts",
  "parole",
  "varchar(255)",
  "not null",
  "Šifrēšanas algoritms, sāls un šifrēta lietotāja parole",
  "vards",
  "varchar(255)",
  "default '', not null",
  "Lietotāja vārds",
  "uzvards",
  "varchar(255)",
  "default '', not null",
  "Lietotāja uzvārds",
  "dzimsanas_datums",
  "date",
  "",
  "Lietotāja dzimšanas datums",
  "bio_info",
  "text",
  "default ''",
  "Lietotāja apraksts par sevi",
  "izveidosanas_laiks",
  "timestamp",
  "default current_timestamp, not null",
  "Laiks, kad tika izveidots/saglabāts dotais lietotājs datubāzē",
  "ir_apstiprinats_ epasts",
  "bool",
  "default false, not null",
  "Vai lietoājs ir apsiprinājis savu e-pastu?",
  "stripe_id",
  "varchar(50)",
  "unique",
  [Unikālais lietotāja identifikators, kas tiek iegūts no maksājuma apstrādātāja klienta -- #link("https://stripe.com")[Stripe]],
  "ir_administrators",
  "bool",
  "default false, not null",
  [Vai lietotājam ir administratora privilēģijas?],
  "attels",
  "int8",
  "",
  [Lietotāja profila attēls, `FOREING KEY` uz #link(<entity-image>)[Attels] tabulas id kolonnu],
  "konta_stavoklis",
  "int8",
  "not null",
  [Lietotāja konta stāvoklis, `FOREING KEY` uz #link(<entity-account-status>)[KontaStavoklis] tabulas id kolonnu],
  "sesija",
  "int8",
  "unique",
  [Lietotāja sesija, `FOREING KEY` uz #link(<entity-session>)[Sesija] tabulas id kolonnu],
  "epasta_ apstiprinajums",
  "int8",
  "unique",
  [Lietotāja e-pasta apstiprinājums, `FOREING KEY` uz #link(<entity-email-confirmation>)[EpastaApstiprinajums] tabulas id kolonnu],
  "paroles_ atjaunosana",
  "int8",
  "unique",
  [Lietotāja paroles atjaunošana, `FOREING KEY` uz #link(<entity-password-recovery>)[ParolesAtjaunojana] tabulas id kolonnu],
) <entity-user>

#entity-table(
  caption: "SpelesUzstadijums",
  "nosaukums",
  "varchar(255)",
  "unique, not null",
  "Uzstādījuma nosaukums",
  "apraksts",
  "text",
  "default '', not null",
  "Uzstādījuma apraksts",
  "ir_pamata",
  "bool",
  "default false, not null",
  "Vai spēles uzstādījums ir spēles pamatā vai lietotāju izveidots",
  "izveidosanas_laiks",
  "timestamp",
  "default current_timestamp, not null",
  "Laiks, kad dotais uzstādījums tika izveidots/saglabāts datubāzē",
  "autors",
  "int8",
  "not null",
  [Uzstādījuma autors, `FOREING KEY` uz #link(<entity-user>)[Lietotajs] tabulas id kolonnu],
) <entity-game-setup>

#entity-table(
  caption: "Istaba",
  "nosaukums",
  "varchar(255)",
  "unique, not null",
  "Istabas Nosaukums",
  "speles_saksanas_ laiks",
  "timestamp",
  "",
  "Laiks, kad spēle sākas",
  "speles_beigsanas_ laiks",
  "timestamp",
  "",
  "Laiks, kad spēle beidzas",
  "stavoklis",
  "int8",
  "not null",
  [Pašreizējais spēles stāvoklis, `FOREING KEY` uz #link(<entity-room-status>)[IstabasStavoklis] tabulas id kolonnu],
  "piekluves_kods",
  "char(6)",
  "unique, not null",
  "Unikāls istabas piekļuves kods, 6 lielie burtcipari",
  "izveidosanas_laiks",
  "timestamp",
  "default current_timestamp, not null",
  "Laiks, kad dotā spēles istaba tika izveidota/saglabāta datubāzē",
  "speles_uzstadijums",
  "int8",
  "not null",
  [Spēles uzstādījumi, kurus izmanto dotā istaba, `FOREING KEY` uz #link(<entity-game-setup>)[SpelesUzstādījums] tabulas id kolonnu],
) <entity-room>

#entity-table(
  caption: "SpelesNotikums",
  "nosaukums",
  "varchar(255)",
  "unique, not null",
  "Notikuma nosaukums",
  "nakts_pk",
  "int2",
  "default 0, not null, check (nakts_pk >= 0)",
  "Spēles nakts pēc kārtas",
  "ir_redzams",
  "bool",
  "default false, not null",
  "Vai notikums ir redzams spēlētājiem procesa laikā?",
  "izveidosanas_laiks",
  "timestamp",
  "default current_timestamp, not null",
  "Laiks, kad dotais spēles notikums tika izveidots/saglabāts datubāzē",
  "taimeris",
  "interval",
  "",
  "Laika intervāls taimera notikumiem spēles gaitā",
  "lomas_darbiba",
  "int8",
  "not null",
  [Lomas darbība, `FOREING KEY` uz #link(<entity-game-role>)[LomasDarbiba] tabulas id kolonnu],
) <entity-game-event>

#entity-table(
  caption: "Speletajs",
  "nosaukums",
  "varchar(255)",
  "unique, not null",
  "Notikuma nosaukums",
  "ir_noslepkavots",
  "bool",
  "default false, not null",
  "Vai dotais spēlētājs ir noslepkavots?",
  "ir_izbalsots",
  "bool",
  "default false, not null",
  "Vai dotais spēlētājs ir izbalsots?",
  "stavoklis",
  "int8",
  "not null",
  [Spēlētāja stāvoklis, `FOREING KEY` uz #link(<entity-player-status>)[SpeletajaStavoklis] tabulas id kolonnu],
  "istaba",
  "int8",
  "",
  [Istaba, kurā spēlē dotais spēlētājs, `FOREING KEY` uz #link(<entity-room>)[Istaba] tabulas id kolonnu],
  "speles_loma",
  "int8",
  "not null",
  [Loma, kuru spēlē dotais spēlētājs, `FOREING KEY` uz #link(<entity-game-role>)[SpelesLoma] tabulas id kolonnu],
) <entity-player>


#entity-table(
  caption: "Sarakste",
  "teksts",
  "text",
  "not null",
  "Sarakstes teksts",
  "if_mafijas_sarakste",
  "bool",
  "default false, not null",
  "Vai sarakstes sūtītājs ir mafija?",
  "ir_izmainita",
  "bool",
  "default false, not null",
  "Vai sarakstes saturs ir izmainīts?",
  "autors",
  "int8",
  "not null",
  [Sarakstes sūtītājs, `FOREING KEY` uz #link(<entity-player>)[Speletajs] tabulas id kolonnu],
) <entity-message>

#entity-table(
  caption: "SpeletajaDarbibas",
  id: (
    "speletajs",
    "int8",
    "primary key, not null",
    [Spēlētājs, `FOREING KEY` uz #link(<entity-player>)[Speletajs] tabulas id kolonnu],
  ),
  "lomas_darbiba",
  "int8",
  "primary key, not null",
  [Lomas darbība, `FOREING KEY` uz #link(<entity-game-role>)[LomasDarbiba] tabulas id kolonnu],
  "vai_pilda",
  "bool",
  "default true, not null",
  [Vai spēlētājs ir darbības izraisītājs?],
) <entity-player-action>

#entity-table(
  caption: "SpeletajsIzraisaNotikumu",
  id: (
    "speletajs",
    "int8",
    "primary key, not null",
    [Spēlētājs, `FOREING KEY` uz #link(<entity-player>)[Speletajs] tabulas id kolonnu],
  ),
  "speles_notikums",
  "int8",
  "primary key, not null",
  [Spēles notikums, `FOREING KEY` uz #link(<entity-game-event>)[SpelesNotikums] tabulas id kolonnu],
) <entity-player-causes-event>


#pagebreak(weak: true)
#entity-table(
  caption: "SpeletajsIetekmeNotikumu",
  id: (
    "speletajs",
    "int8",
    "primary key, not null",
    [Spēlētājs, `FOREING KEY` uz #link(<entity-player>)[Speletajs] tabulas id kolonnu],
  ),
  "speles_notikums",
  "int8",
  "primary key, not null",
  [Spēles notikums, `FOREING KEY` uz #link(<entity-game-event>)[SpelesNotikums] tabulas id kolonnu],
) <entity-player-influences-event>


#entity-table(
  caption: "SpelesUzstatijumuLomas",
  id: (
    "speles_uzstadijums",
    "int8",
    "primary key, not null",
    [Spēles uzstādījums, `FOREING KEY` uz #link(<entity-game-setup>)[SpelesUzstadijums] tabulas id kolonnu],
  ),
  "speles_loma",
  "int8",
  "primary key, not null",
  [Spēles loma, `FOREING KEY` uz #link(<entity-game-role>)[SpelesLoma] tabulas id kolonnu],
  "skaits",
  "int2",
  "default 1, not null, check (skaits >= 1)",
  "Spēlē izmantojamo lomu skaits",
) <entity-game-setup-roles>

#entity-table(
  caption: "NotikumsAizliedzAtlaujDarbibu",
  id: (
    "lomas_darbiba",
    "int8",
    "primary key, not null",
    [Lomas darbība, `FOREING KEY` uz #link(<entity-role-action>)[LomasDarbiba] tabulas id kolonnu],
  ),
  "speles_notikums",
  "int8",
  "primary key, not null",
  [Spēles notikums, `FOREING KEY` uz #link(<entity-game-event>)[SpelesNotikums] tabulas id kolonnu],
  "ir_atlauts",
  "bool",
  "default true, not null",
  [Apzīmē, vai notikums atļauj vai aizliedz darbību],
) <entity-event-actions>


#pagebreak(weak: true)
#entity-table(
  caption: "SpelesLomasDarbiba",
  id: (
    "speles_loma",
    "int8",
    "primary key, not null",
    [Spēles loma, `FOREING KEY` uz #link(<entity-game-role>)[SpelesLoma] tabulas id kolonnu],
  ),
  "lomas_darbiba",
  "int8",
  "primary key, not null",
  [Lomas darbība, `FOREING KEY` uz #link(<entity-role-action>)[LomasDarbiba] tabulas id kolonnu],
) <entity-game-role-events>

#entity-table(
  caption: "Atbilde",
  "raksta",
  "int8",
  "not null",
  [Lietotājs, kas atbild uz saraksti, `FORERING KEY` uz #link(<entity-message>)[Sarakste] tabulas id kolonnu],
  "atbild",
  "int8",
  "not null",
  [Lietotājs, uz kura saraksti atbild, `FORERING KEY` uz #link(<entity-message>)[Sarakste] tabulas id kolonnu],
) <entity-answer>


== Daļējs funkciju projektējums

#indent-par([
  Spēles notikumu izveidošanas algoritma aktivitātes diagramma (@fig:PD02-1 att.) apraksta spēles notikumu izveidošanu, ko veic sistēma. Ja fāzes taimeris nav aktīvs, tiek izveidoti nepieciešamie spēles notikumi nākamai fāzei, tiek mainīti spēlētāju stāvokļi. Dažu fāžu ietvaros tiek pārbaudīti spēles beigu nosacījumi, kuriem izpildoties, spēles istabas stāvoklis ir mainīts uz pabeigtu spēli.
])

Diagrammā ir iekļauta apakšaktivitāte spēlētāju stāvokļa izmaiņai atkarībā no darbībām, kas ir aprakstīta atsevišķi (skat. @fig:PD02-2 att.) Tajā tiek apstrādātas darbības un aprēķināta darbību ietekme uz spēles stāvokli, izveidojot jaunus notikumus.

#figure(
  caption: "Spēles notikumu izveidošanas algoritms",
  image("img/uml/EventCreationActivityDiagram-01.svg", height: 80%),
) <PD02-1>

#figure(
  caption: "Izmaiņas spēlētāju stāvoklī (apakšaktivitāte)",
  image("img/uml/EventCreationActivityDiagram-02.svg"),
) <PD02-2>

#pagebreak(weak: true)
#indent-par([
  Lietotāja spēles darbības veikšanas funkcijas projektējuma peldceliņu diagramma (@fig:PD01 att.) apraksta spēlētāja darbības izveidošanas procesu. Funkcija ietver darbības korektuma pārbaudi, spēles istabas un spēlētāja saistību, darbības autorizēšanu spēles ietvaros un darbības ieraksta izveidošanu.
])

#figure(
  caption: "Spēles darbības peldceliņu diagramma",
  image("img/uml/GameActionSwimlaneChart.svg", height: 80%),
) <PD01>


#indent-par([
  Iespējamie spēles istabas stāvokļi un to pārejas ir aprakstīti stāvokļu pārejas diagrammā (skat. @fig:PD03 att.).
])

#figure(
  caption: "Spēles istabas stāvokļu diagramma",
  image("img/uml/GameRoomStateDiagram.svg"),
) <PD03>

#pagebreak(weak: true)
#indent-par([
  Abonementa pieteikuma process ir aprakstīts secību diagrammā (skat. @fig:PD04 att.). Process iekļauj aktīva abonementa pārbaudi, klienta konta izveidošanu, ja tāds neeksistē, apmaksas sesijas izveidi un apstiprinājumu.
])

#figure(
  caption: "Abonementa pieteikuma secību diagramma",
  image("img/uml/SubscriptionFunctionSequenceDiagram.svg"),
) <PD04>

#pagebreak(weak: true)
#indent-par([
  Sistēmas izvietojuma diagramma (skat. @fig:PD05 att.) apraksta sistēmas izvietojuma -- programmatūras izvietojumu ierīcēs, uz kuras tiks darbināta sistēmas programmatūra.
])

#figure(
  caption: "Sistēmas izvietojuma diagramma",
  image("img/uml/ManifiestationDiagram.svg"),
) <PD05>

/* Apraksta svarīgākās, sarežģītākās funkcijas vai sistēmas darbības aspektus; obligāti  jālieto vismaz 4 dažādi diagrammu veidi, izņemot DPD un lietošanas piemēru (use case) diagrammas */
== Daļējs lietotāju saskarņu projektējums
/* 5-7 lietotāja saskarnes un to apraksts */

=== Navigācija

#indent-par([
  Navigācijas shēma visām lietotāju grupām ir attēlota ekrānskatu plūsmas diagrammā (skat. @fig:view-flow-diagram att.) Diagrammā ir apvienoti visi skati, kas ieskaita gan parasta lietotāja pusi, gan administratora pusi. Diagrammā redzami visi pieejamie skati katram lietotāja veidam. Katru sadalīto skatu zonu manto lietotājs ar lielākām tiesībām par otru. Administratoram ir pieejami visi skati, maksas lietotājiem ir pieejama apakškopa no ekrānskatiem, reģistrētam lietotājam un nereģistrētam lietotājiem analoģiski ir pieejamas apakškopas. Šī hierarhija ir redzama diagrammas kreisā apakšējā stūrī. Pastāv ekrānskati, kas pieejami tikai neautentificētam lietotājam un nav pieejami nevienam citam. Tāpēc ir izdalīta atsevišķa grupa, kas netiek iekļauta citās grupās.
])


#figure(
  caption: "Ekrānskatu plūsmas diagramma",
  image("img/EkrānskatuPlūsmasDiagramma.svg"),
) <view-flow-diagram>
#indent-par([
  Saskarnes projektējuma ekrānskatos izmantotās funkcijas ir apkopotas @tbl:interface-views tabulā.
])
// For self check (sorta) and traceability
#figure(
  caption: "Funkciju atbilstība ekrānskatiem",
  kind: table,
  tablex(
    columns: 3,

    /* --- header --- */
    [*Ekrānskata nosaukums*], [*Ekrānskata identifikators*], [*Atbilstošās funkcijas*],
    /* -------------- */

    [Galvenā lapa], [#link(<SS01>)[SS01]], [Statiska lapa#footnote[Statiskas lapas saturs mainās reti, tās saturs tiek atjaunots manuāli.]],
    [Pieteikšanās], [SS02], [#link(<AMF06>)[AMF06]],
    [Atkārtotā apstiprinājuma pieteikšana], [SS03], [#link(<AMF02>)[AMF02]],
    [Paroles atjaunošanas pieteikums], [SS04], [#link(<AMF03>)[AMF03]],
    [Paroles atjaunošana], [SS05], [#link(<AMF04>)[AMF04]],
    [E-pasta apstiprināšana], [SS06], [#link(<AMF07>)[AMF07]],
    [Reģistrācija], [#link(<SS07>)[SS07]], [#link(<AMF01>)[AMF01]],
    [Spēles notikumu pārskats], [SS08], [#link(<SGMF03>)[SGMF03]],
    [Spēļu vēstures pārskats], [SS09], [#link(<SIMF08>)[SIMF08]],
    [Spēles istabu pārskats], [SS10], [#link(<SIMF01>)[SIMF01], #link(<SIMF03>)[SIMF03], #link(<AMF06>)[AMF06], #link(<AMF04>)[AMF04]],
    [Atteikšanās], [SS11], [#link(<AMF05>)[AMF05]],
    [Lietotāju pārskats], [SS12], [#link(<LKMF01>)[LKMF01]],
    [Konta detaļas], [SS13], [#link(<LKMF02>)[LKMF02]],
    [Konta rediģēšana], [SS14], [#link(<LKMF04>)[LKMF04]],
    [Konta dzēšana], [SS15], [#link(<LKMF05>)[LKMF05]],
    [Abonementa pieteikšana], [SS16], [#link(<MAMF01>)[MAMF01]],
    [Abonementu pārskats], [SS17], [#link(<MAMF02>)[MAMF02]],
    [Abonementa atcelšana], [SS18], [#link(<MAMF03>)[MAMF03]],
    [Abonementu plānu pārskats], [SS19], [#link(<MAMF04>)[MAMF04]],

    [Lomas detaļas], [SS20], [#link(<SLMF01>)[SLMF01]],
    [Lomu pārskats], [SS21], [#link(<SLMF02>)[SLMF02]],
    [Lomas darbību pārskats], [SS22], [#link(<SLMF03>)[SLMF03]],
    [Lomas izveidošana], [SS23], [#link(<SLMF04>)[SLMF04]],
    [Lomas rediģēšana], [SS24], [#link(<SLMF05>)[SLMF05]],
    [Lomas dzēšana], [SS25], [#link(<SLMF06>)[SLMF06]],
    [Spēles uzstādījumu pārskats], [#link(<SS26>)[SS26]], [#link(<SUMF01>)[SUMF01]],
    [Spēles uzstādījuma lomu pārskats], [SS27], [#link(<SUMF02>)[SUMF02]],
    [Spēles uzstādījuma izveidošana], [SS28], [#link(<SUMF03>)[SUMF03]],
    [Spēles uzstādījuma rediģēšana], [SS29], [#link(<SUMF04>)[SUMF04]],
    [Spēles uzstādījuma dzēšana], [SS30], [#link(<SUMF05>)[SUMF05]],
    [Spēles istabas izveidošana], [SS31], [#link(<SIMF04>)[SIMF04]],
    [Pievienošanās spēlei], [SS32], [#link(<SIMF02>)[SIMF02]],
    [Pirmsspēles vestibils], [#link(<SS33>)[SS33]], [#link(<SIMF07>)[SIMF07], #link(<SIMF05>)[SIMF05], #link(<SUMF02>)[SUMF02], #link(<SIMF09>)[SIMF09], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    [Spēles sākums], [SS34], [#link(<SGMF04>)[SGMF04], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    [Spēles skats], [#link(<SS35>)[SS35]], [#link(<SGMF04>)[SGMF04], #link(<SLMF03>)[SMLF03], #link(<SLMF01>)[SLMF01], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    [Spēles darbība], [#link(<SS36>)[SS36]], [#link(<SGMF01>)[SGMF01], #link(<SLMF03>)[SLMF03], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    [Spēles fāzes maiņa], [#link(<SS37>)[SS37]], [#link(<SGMF04>)[SGMF04], #link(<SGMF03>)[SGMF03], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    // [Atslēgšanās no spēles istabas], [SS38], [#link(<SIMF03>)[SIMF03]],
    [Spēles beigas], [SS38], [#link(<SGMF04>)[SGMF04], #link(<SGMF03>)[SGMF03], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
   // [Spēles uzstādījuma detaļas], [SS40], [#link(<SUMF01>)[SUMF02]],
    [Spēles notikumu pārskats], [#link(<SS39>)[SS39]], [#link(<SGMF04>)[SGMF04], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    [Spēles novērošana], [SS40], [#link(<SGMF04>)[SGMF04], #link(<SIMF07>)[SIMF07], #link(<TMF01>)[TMF01], #link(<TMF02>)[TMF02], #link(<TMF03>)[TMF03], #link(<TMF04>)[TMF04]],
    [Spēles iestatījumi], [SS41], [Lietotāju saskarnes iestatījumi],
    [Lietotāja konta bloķēšana], [SS42], [#link(<LKMF03>)[LKMF03]],
    [Spēlētāja izslēgšana], [SS43], [#link(<SIMF07>)[SIMF07], #link(<SIMF06>)[SIMF06]],
  ),
) <interface-views>

#pagebreak(weak: true)
=== Ekrānskati

// UPDATED: 2024-01-18 17:37

#indent-par([
  Galvenās lapas ekrānskats (SS01; @fig:SS01 att.) parāda informāciju nereģistrētiem lietotājiem, kas ietver statistiku par mājaslapu un saiti uz reģistrāciju vai pieteikšanos un citu aktuālu informāciju. Informācija, kas tiek parādīta, ir statiska.
])

#figure(
  caption: "Galvenās lapas ekrānskats",
  image("img/ui/desktop/landingpage.png"),
) <SS01>

#pagebreak(weak: true)
#indent-par([
  Reģistrācijas ekrānskats (SS07; @fig:SS07 att.) satur reģistrācijas veidlapu. Jāievada reģistrācijai nepieciešamie dati. Paziņojumi par ievades datu validācijas neveiksmēm parādās pie attiecīgajiem ievades laukiem. Nospiežot reģistrācijas pogu lietotājs apstiprina mājaslapas noteikumiem un saistītām politikām.
])

#figure(
  caption: "Reģistrācijas ekrānskats",
  image("img/ui/desktop/register.png"),
) <SS07>

#pagebreak(weak: true)
#indent-par([
  Spēles istabu pārskata ekrānskats (SS26; @fig:SS26 att.) ir pirmais ekrānskats, kurā lietotājs iekļūst, veiksmīgi piesakoties sistēmā. Tas satur pieejamās spēles istabas ar informāciju par konkrētām istabām ar meklēšanas, filtru un kārtošanas iespēju. Pieejamām spēles istabām ir pieslēgšanās poga. Skatā ir iespēja arī nokļūt uz sava reģistrētā konta pārskatu. Ekrānskats satur papildus aktuālu informāciju. Papildus informācija ir statiska, informācija par abonementa iegādi un blogs. Maksas lietotājam ir redzama istabu izveidošanas poga.
])

#figure(
  caption: "Spēles istabu pārskata ekrānskats",
  image("img/ui/desktop/available-game-room-list.png"),
) <SS26>

#pagebreak(weak: true)
#indent-par([
  Pirmsspēles vestibila ekrānskats (SS33; @fig:SS33 att.) parāda informāciju par spēles istabu, kas ir aktuāla pirms spēle sākas. Tas iekļauj spēlētājus istabā un informāciju par spēles uzstādījumu un tajā iekļautām spēles lomām.
])

#figure(
  caption: "Spēles vestibila ekrānskats",
  image("img/ui/mobile/lobby.png", height: 80%),
) <SS33>

#pagebreak(weak: true)
#indent-par([
  Ekrānskats "Spēles skats" (SS35; @fig:SS35 att.) parāda būtiskāko informāciju spēles procesā. Ir iespēja apskatīt visus spēlētājus, kas ir pieslēgušies spēlei. Pie katra spēlētāja ar noteiktu krāsu tiek parādīts vai spēlētājs ir dzīvs vai nē. Oranža krāsa nozīmē, ka ir dzīvs, melns -- nē. Kā arī savu lomu un lomas aprakstu, kas tika piešķirta spēlētājam, spēles sākumā, šajā skatā mediķis. Skatā ir iespēja izmantot tērzētavu, sarunājoties ar citiem spēles dalībniekiem. Pieejams arī spēles pārskats, kurā ir redzama spēles fāze, dzīvo spēlētāju skaitu un diena. No šī skata ir iespējams nokļūt uz notikumu pārskata skatu.
])

#figure(
  caption: "Spēles skata ekrānskats",
  image("img/ui/desktop/game-screen.png"),
) <SS35>


#pagebreak(weak: true)
#indent-par([
  Spēles notikumu pārskata ekrānskats (SS39; @fig:SS39 att.) attēlo spēles notikumu pārskatu. Tas ir līdzīgs spēles skatam (SS35; @fig:SS35 att.) ar savām dažām atšķirībām. Informācija sniedz pārskatu par svarīgiem spēles notikumiem atsevišķās spēles fāzēs – naktī un dienā. Spēles laikā ir notikuši konkrēti notikumi, piemēram, kāds spēlētājs ir nogalināts vai izglābts. Notikumi ir izmantoti, lai saprastu nesenos notikumus spēlē un plānotu nākamās darbības, balstoties uz spēles gaitu un citu spēlētāju lēmumiem.
])

#figure(
  caption: "Spēles notikumu pārskata ekrānskats",
  image("img/ui/desktop/game-event-overview.png"),
) <SS39>

#pagebreak(weak: true)
#indent-par([
  Ekrānskats "Spēles darbība" (SS36; @fig:SS36 att.) parāda darbības izvēli, noteiktajai spēlētāja lomai, šajā gadījumā mediķim, kas ietekmē nākamos spēles soļus. Šis skats parādās katrā darbību momentā naktī. Katrai noteiktajai spēlētāja lomai šis skats ir nedaudz atšķirīgs. Mafijas gadījumā parādās saraksts ar vēl dzīvajiem spēlētājiem, kur jāizvēlas viens. Iedzīvotāja gadījumā nav nevienas darbības, kas jādara, tie vienkārši sagaida nākamo dienu.
])

#figure(
  caption: "Spēles darbības ekrānskats",
  image("img/ui/desktop/game-action.png"),
) <SS36>


#pagebreak(weak: true)
#indent-par([
  Ekrānskats "Fāzes maiņa" (SS37; @fig:SS37 att.) demonstrē fāzes maiņas momentu, atspoguļojot pāreju no dienas uz nakti vai otrādi. Ekrānā dominē grafiskais uzraksts "Trešā diena", kas simbolizē spēles iekšējo ciklu maiņu un pavada spēlētājus uz nākamo darbību sēriju. Fāzes maiņa informē spēlētājus par svarīgu spēles posmu notikumiem, šajā gadījumā par Jaunzemnieka slepkavību.
])

#figure(
  caption: "Fāzes maiņas ekrānskats",
  image("img/ui/tablet/game-phase-change.png", height: 60%),
) <SS37>


#pagebreak(weak: true)
#heading(numbering: none, "Izmantotā literatūra un avoti")

+ #hyperlink-source(
    "Eiropas Parlaments.",
    "Vispārēja datu aizsardzības regula (angl. GDPR). 2016, aprīlis.",
    "https://eur-lex.europa.eu/legal-content/LV/TXT/PDF/?uri=CELEX:32016R0679",
    datetime(
      year: 2023,
      month: 11,
      day: 20,
    ),
  )

+ #hyperlink-source(
    "International standard organisation (Starptautiska standartu organizācija).",
    [ISO/DIS 8601-1. Data elements and interchange formats -- Information interchange -- Representation of dates and times -- Part 1: Basic rules.],
    "https://web.archive.org/web/20171019211402/https://www.loc.gov/standards/datetime/ISO_DIS%208601-1.pdf",
    datetime(
      year: 2023,
      month: 11,
      day: 20,
    ),
  )

+ #hyperlink-source(
    "International standard organisation.",
    "ISO 4217. Currency codes. 2015.",
    "https://www.iso.org/iso-4217-currency-codes.html",
    datetime(
      year: 2023,
      month: 12,
      day: 16,
    ),
  )

+ #hyperlink-source(
    "Internet Engineering Task Force (IETF).",
    "RFC 7519. JSON Web Token (JWT). 2015, maijs.",
    "https://web.archive.org/web/20171019211402/https://www.loc.gov/standards/datetime/ISO_DIS%208601-1.pdf",
    datetime(
      year: 2023,
      month: 11,
      day: 20,
    ),
  )


+ #hyperlink-source(
    [Institūcija "Latvijas standarts".],
    [LVS 68:1996 "Programmatūras prasību specifikācijas ceļvedis". 1996, marts.],
    "",
    datetime(
      year: 2023,
      month: 11,
      day: 20,
    ),
  )

+ #hyperlink-source(
    [Institūcija "Latvijas standarts".],
    [LVS 72:1996 PPS "Ieteicamā prakse programmatūras projektējuma aprakstīšanai". 1996, marts.],
    "",
    datetime(
      year: 2023,
      month: 11,
      day: 20,
    ),
  )

+ #hyperlink-source(
    "QUALCOMM Incorporated.",
    "RFC2822. Internet Message Format (Interneta ziņojumu formāts). 2001, aprīlis.",
    "https://datatracker.ietf.org/doc/html/rfc2822",
    datetime(
      year: 2023,
      month: 11,
      day: 20,
    ),
  )


+ #hyperlink-source(
    "Maksas apstrādātāja lietošanas dokumentācija.",
    "Stripe API Reference.",
    "https://stripe.com/docs/api",
    datetime(
      year: 2023,
      month: 12,
      day: 17,
    ),
  )

/*+ #hyperlink-source(
  "W3C.",
  "Web Content Accessibility Guidelines (WCAG, Tīmekļa satura pieejamības vadlīnijas) 2.1. 2023, septembris.",
  "https://www.w3.org/TR/WCAG21/",
  datetime(
    year: 2023,
    month: 11,
    day: 20,
  ),
)*/

// Hyperlink example
/*
#hyperlink-source(
  "Kļaviņš, K. Baltijas vāciešu un latviešu kopīgā pagātne.",
  "Diena, 2003, 19. marts, 15. lpp.",
  "http://www.historia.lv/publikacijas/piblicist/kljavins01.htm",
  datetime(
    year: 2023,
    month: 1,
    day: 2,
  ),
)
*/

#pagebreak(weak: true)
#let vspace = 1fr
#heading(numbering: none, outlined: false, "Dokumentārā lapa")
#v(vspace)

#indent-par([Praktiskais darbs programminžinierijā "Tiešsaistes spēles sistēma "Mafija"" izstrādāts LU Datorikas fakultātē.])

#v(vspace)
Šī darba autori apliecina, ka darbs ir veikts patstāvīgi, un ir izmantoti tikai tajā norādītie informācijas avoti.

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Darba autori:",
    [
      + Alens Aleksandrs Čerņa, ac22065,
      + Kristiāns Francis Cagulis, kc22015,
      + Ernests Gustavs Dane, eg22086,
      + Miķelis Kukainis, mk22092,
      + Jorens Štekeļs, js21283,
    ],
  ),
)

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Darba vadītāja:",
    "prof. Dr. sc. comp. Laila Niedrīte",
  ),
)

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Darba galīgā versija izgatavota:",
    "18.01.2024.",
  ),
)

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Darba iesniegšanas datums:",
    "18.01.2024.",
  ),
)

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Darba aizstāvēšanas datums:",
    "22.01.2024.",
  ),
)

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Komisijas vērtējums:",
    line(length: 100%, start: (0pt, 10pt)),
  ),
)

#v(vspace)
#figure(
  tablex(
    stroke: none,
    columns: (1fr, 1fr),
    "Komisijas sastāvs:",
    [
      #line(length: 100%, start: (0pt, 10pt))
      #line(length: 100%, start: (0pt, 30pt))
      #line(length: 100%, start: (0pt, 50pt))
    ],
  ),
)



/*Dokumentārā lapa
Dokumentārajā lapā (sk. 5. pielikumu) ietver:
•darba nosaukumu, fakultātes nosaukumu;
•autora apliecinājumu, ka darbs veikts patstāvīgi, ka darbā izmantoti tikai tajā norādītie
informācijas avoti un ka darba elektroniskā kopija atbilst izdrukai;
•vadītāja atzinumu, vai darbs ir rekomendējams aizstāvēšanai;
•atbildīgās personas atzīmi par darba saņemšanu;
•recenzenta-/u datus (vārds, uzvārds, amats, zinātniskais grāds);
•noslēguma pārbaudījuma komisijas sēdes datumu un protokola numuru.*/
