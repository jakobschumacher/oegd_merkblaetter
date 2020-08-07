---
layout: archive
author_profile: false
---

<h1>Berliner Merkblätter</h1>
Merkblätter für Infektionskrankheiten als Erweiterung des Angebots der <a href="https://www.infektionsschutz.de/erregersteckbriefe/">Erregersteckbriefe</a>. Erstellt von [Personen aus dem Öffentlichen Gesundheitsdienst]({% link _pages/about.md %}) für den öffentlichen Gesundheitsdienst. Nach bestem Wissen und Gewissen erstellt, aber vermutlich nicht [fehlerfrei]({% link _pages/disclaimer.md %}).  

{% capture written_label %}'None'{% endcapture %}

{% for collection in site.collections %}
  {% for post in collection.docs %}
    {% unless collection.output == false or collection.label == "posts" %}
      {% include archive-single.html %}
    {% endunless %}
  {% endfor %}
{% endfor %}
