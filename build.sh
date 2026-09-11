#!/bin/sh
# Genereaza index.html (GitHub Pages) si copia pentru artifact din template.html
cd "$(dirname "$0")"
B="https://pchris1977.github.io/masa-cner-2026"
LOGO="data:image/png;base64,$(base64 -w0 logo-cner.png)"
{ printf '<!doctype html>\n<html lang="ro">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1">\n'
  sed -e 's#__PDF_URL__#Caiet_de_sarcini_Catering_CNER_Cluj.pdf#g' -e 's#__CAMIGO_URL__#Oferta_Camigo_2026-2027.pdf#g' -e 's#__BSE_URL__#Oferta_Black_Swan_2026-2027.pdf#g' -e 's#__VIBES_JPG__#Oferta_Vibes_Bistro_2026-2027.jpeg#g' -e 's#__VIBES_XLSX__#Oferta_Vibes_Bistro_meniu_2026-2027.xlsx#g' -e 's#__RAFINATO_URL__#Oferta_Rafinato_Events_2026-2027.pdf#g' -e 's#__POZE__#poze/#g' -e "s#__LOGO__#$LOGO#g" -e 's#__CAMIGO_GO__#Deschide ↗#g' template.html | sed -e '0,/^<style>/s##</head>\n<body>\n<style>#'
  printf '\n</body>\n</html>\n'; } > index.html
if [ -n "$ARTIFACT" ]; then
  sed -e "s#__PDF_URL__#$B/Caiet_de_sarcini_Catering_CNER_Cluj.pdf#g" -e "s#__CAMIGO_URL__#$B/Oferta_Camigo_2026-2027.pdf#g" -e "s#__BSE_URL__#$B/Oferta_Black_Swan_2026-2027.pdf#g" -e "s#__VIBES_JPG__#$B/Oferta_Vibes_Bistro_2026-2027.jpeg#g" -e "s#__VIBES_XLSX__#$B/Oferta_Vibes_Bistro_meniu_2026-2027.xlsx#g" -e "s#__RAFINATO_URL__#$B/Oferta_Rafinato_Events_2026-2027.pdf#g" -e "s#__POZE__#$B/poze/#g" -e "s#__LOGO__#$LOGO#g" -e 's#__CAMIGO_GO__#Deschide ↗#g' template.html > "$ARTIFACT"
fi
# In copia pentru artifact, pozele se incorporeaza ca data URI (viewerul nu incarca imagini externe)
if [ -n "$ARTIFACT" ]; then
  for f in poze/*.jpeg; do
    d="data:image/jpeg;base64,$(base64 -w0 "$f")"
    printf '%s\n' "$d" > "$ARTIFACT.uri"
    awk -v src="$B/$f" -v urifile="$ARTIFACT.uri" 'BEGIN{getline uri < urifile} { i=index($0, src); while (i>0) { $0 = substr($0,1,i-1) uri substr($0,i+length(src)); i=index($0, src) } print }' "$ARTIFACT" > "$ARTIFACT.tmp" && mv "$ARTIFACT.tmp" "$ARTIFACT"
  done
  rm -f "$ARTIFACT.uri"
fi
