---
layout: page
title: search
permalink: /search/
description: 
nav: true
nav_order: 3
---

<style>
  /* Add some styling for the search container */
  #search-container {
    text-align: center !important;
    margin-top: 20px; /* Adjust the margin as needed */
  }

  /* Style the search input */
  #search-input {
    width: 80%; /* Adjust the width as needed */
    padding: 10px; /* Adjust the padding as needed */
    font-size: 16px; /* Adjust the font size as needed */
  }

  /* Style the results container */
  #results-container {
    list-style-type: none;
    padding: 0;
    margin: 20px 0; /* Adjust the margin as needed */
  }

  /* Style the search results */
  #results-container li {
    margin-bottom: 10px; /* Adjust the margin as needed */
  }

  /* Style the highlighted search term */
  font[color="#ee82ee"] {
  }
</style>

<!-- Html Elements for Search -->
<div id="search-container">
  <input type="text" id="search-input" placeholder="Search ↵">
  <ul id="results-container"></ul>
</div>

<!-- Script pointing to search-script.js -->
<script src="/js/search-script.js" type="text/javascript"></script>

<!-- Configuration -->
<script>
  SimpleJekyllSearch({
    searchInput: document.getElementById('search-input'),
    resultsContainer: document.getElementById('results-container'),
    searchResultTemplate: '<br><div style="text-align: left !important;"><a href="{url}"><h1 style="text-align:left !important;">{title}</h1></a><span style="text-align:left !important;">{content}</span></div>',
    templateMiddleware: function (prop, value, template) {
      if (prop == 'content') {
        var wordIndex = value.toLowerCase()
          .indexOf(document.getElementById('search-input').value.toLowerCase());
        console.log(wordIndex, value);
        excerpt = value.slice(Math.max(wordIndex - 70, 0), Math.min(wordIndex + 70, value.length));
        return excerpt.split(' ')
          .slice(1, excerpt.split(' ').length - 1)
          .join(' ').toLowerCase()
          .replace(document.getElementById('search-input').value.toLowerCase(), '<font color="#ee82ee">' + document.getElementById('search-input').value + '</font>');
      }
    },
    json: '{{ site.baseurl }}/search.json',
  });
</script>
