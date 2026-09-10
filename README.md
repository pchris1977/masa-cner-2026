# Masa copiilor CNER – pagina părinților

Pagină informativă pentru părinții ciclului primar, Colegiul Național „Emil Racoviță” Cluj-Napoca:
selecția firmei de catering (ședința din 10 septembrie 2026, ofertele primite, degustarea din 11 septembrie, start luni 14 septembrie).

## Fișiere

| Fișier | Rol |
|---|---|
| `index.html` | Pagina publicată (aceasta se vede pe GitHub Pages) |
| `template.html` | Sursa paginii; `index.html` se generează din ea |
| `Caiet_de_sarcini_Catering_CNER_Cluj.pdf` | Caietul de sarcini, legat din pagină |
| `observatii.csv` | Șablon pentru tabelul de observații (coloane gata de importat în Google Sheets) |

## Publicare pe GitHub Pages (o singură dată, ~5 minute)

1. Creați un repository nou pe github.com (de exemplu `masa-cner`), public, gol (fără README).
2. În acest folder, rulați:

```bash
git add . && git commit -m "Pagina parintilor: selectie catering CNER" && git branch -M main && git remote add origin https://github.com/UTILIZATOR/masa-cner.git && git push -u origin main
```

3. Pe GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a branch → Branch: main / (root) → Save**.
4. După 1–2 minute pagina este publică la `https://UTILIZATOR.github.io/masa-cner/`.

Orice modificare ulterioară: editați `index.html` (sau `template.html` și regenerați), apoi `git add . && git commit -m "..." && git push`.

## Legarea formularului de observații (Google Forms → Google Sheets)

1. Creați un Google Form cu întrebările: Nume (opțional), Clasa, Categorie (alergii / firme / servire / altele), Observația.
2. În Form: **Răspunsuri → pictograma Sheets** – răspunsurile ajung automat într-un Google Sheet, de unde se exportă oricând în XLSX sau CSV.
3. Copiați linkul „Trimite” al formularului și înlocuiți `__FORM_URL__` în `template.html` și `index.html` cu el.
4. Opțional, pentru formular încorporat în pagină: din **Trimite → <> (embed)** copiați valoarea `src` a iframe-ului și înlocuiți `__FORM_EMBED__`.

Până la înlocuirea `__FORM_URL__`, butonul este ascuns automat și pagina afișează un mesaj că formularul se activează în curând.
