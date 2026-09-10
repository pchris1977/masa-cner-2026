#!/bin/sh
# Genereaza index.html (GitHub Pages) si copia pentru artifact din template.html
cd "$(dirname "$0")"
B="https://pchris1977.github.io/masa-cner-2026"
OUT="${1:-index.html}"
{ printf '<!doctype html>\n<html lang="ro">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n'
  sed -e 's#__PDF_URL__#Caiet_de_sarcini_Catering_CNER_Cluj.pdf#g' -e 's#__CAMIGO_URL__#Oferta_Camigo_2026-2027.pdf#g' -e 's#__BSE_URL__#Oferta_Black_Swan_2026-2027.pdf#g' -e 's#__CAMIGO_GO__#Deschide ↗#g' template.html | sed -e '0,/^<style>/s##</head>\n<body>\n<style>#'
  printf '\n</body>\n</html>\n'; } > index.html
if [ -n "$ARTIFACT" ]; then
  sed -e "s#__PDF_URL__#$B/Caiet_de_sarcini_Catering_CNER_Cluj.pdf#g" -e "s#__CAMIGO_URL__#$B/Oferta_Camigo_2026-2027.pdf#g" -e "s#__BSE_URL__#$B/Oferta_Black_Swan_2026-2027.pdf#g" -e 's#__CAMIGO_GO__#Deschide ↗#g' template.html > "$ARTIFACT"
fi
