---
layout: archive
---

<h1>Merkblätter für Infektionskrankheiten</h1>
Ergänzende Merkblätter zu den <a href="https://www.infektionsschutz.de/erregersteckbriefe/">Erregersteckbriefen</a>. Erstellt für den öffentlichen Gesundheitsdienst. Vor Verwendung prüfen. Verbesserungsvorschläge
<a href="https://github.com/jakobschumacher/oegd_merkblaetter">sind willkommen!</a>
{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
  {% for post in collection.docs %}
    {% unless collection.output == false or collection.label == "posts" %}
      {% include archive-single.html %}
    {% endunless %}
  {% endfor %}
{% endfor %}
