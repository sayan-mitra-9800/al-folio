---
layout: page
title: search
permalink: /search/
description: 
nav: true
nav_order: 2
---

<!-- Html Elements for Search -->
<div id="search-container" style="text-align: center !important; height: 150px width: 10000px">
<input type="text" id="search-input" placeholder="Search ↵">
<ul id="results-container"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="/js/search-script.js" type="text/javascript"></script>

<!-- Configuration -->
<!-- <script> -->
<!-- SimpleJekyllSearch({ -->
<!--   searchInput: document.getElementById('search-input'), -->
<!--   resultsContainer: document.getElementById('results-container'), -->
<!--   json: '/search.json' -->
<!-- }) -->
<!-- </script> -->

<script>
    SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('results-container'),
    searchResultTemplate: '<br><div style="text-align: left !important;"><a href="{url}"><h1 style="text-align:left !important;">{title}</h1></a><span style="text-align:left !important;">{content}</span></div>',
    templateMiddleware: function(prop, value, template) {
            if (prop=='content') {
                var wordIndex = value.toLowerCase()
                                .indexOf(document.getElementById('search-input').value.toLowerCase());
                console.log(wordIndex, value);
                excerpt = value.slice(Math.max(wordIndex-70, 0), Math.min(wordIndex+70, value.length));
                return excerpt.split(' ')
                    .slice(1, excerpt.split(' ').length-1)
                    .join(' ').toLowerCase()
                    .replace(document.getElementById('search-input').value.toLowerCase(), '<font color="#ee82ee">' + document.getElementById('search-input').value + '</font>');
            }
          },
    json: '{{ site.baseurl }}/search.json',
    });
</script>
