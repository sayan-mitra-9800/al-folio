---
layout: page
title: search
permalink: /search/
description:
nav: true
nav_order: 3
---

<style>
  #search-container {
    text-align: center !important;
    margin-top: 20px;
  }

  #search-input {
    width: 80%;
    padding: 10px;
    font-size: 16px;
  }

  #results-container {
    list-style-type: none;
    padding: 0;
    margin: 20px 0;
    text-align: left; /* Aligning results left as before */
  }

  #results-container li {
    margin-bottom: 10px;
  }

  font[color="#ee82ee"] {
    /* highlight styling */
  }

  /* This class can be used to center no results text if you prefer not to use inline styles */
  .no-results-found {
    text-align: center;
    font-style: italic;
    color: #666;
    margin-top: 20px;
  }
</style>

<div id="search-container">
  <input type="text" id="search-input" placeholder="Search ↵">
  <ul id="results-container"></ul>
</div>

<script src="/js/search-script.js" type="text/javascript"></script>

<script>
  var searchInput = document.getElementById('search-input');

  SimpleJekyllSearch({
    searchInput: searchInput,
    resultsContainer: document.getElementById('results-container'),
    searchResultTemplate: '<li><a href="{url}"><h2>{title}</h2></a><span>{content}</span></li>',
    noResultsText: '<li class="no-results-found">No results found</li>',
    templateMiddleware: function (prop, value, template) {
      if (prop === 'content') {
        var searchTerm = searchInput.value.toLowerCase();
        var lowerValue = value.toLowerCase();
        var wordIndex = lowerValue.indexOf(searchTerm);

        if (wordIndex >= 0) {
          var excerpt = value.slice(Math.max(wordIndex - 70, 0), Math.min(wordIndex + 70, value.length));
          return excerpt.toLowerCase().replace(searchTerm, '<font color="#ee82ee">' + searchInput.value + '</font>');
        }
        return value;
      }
      return value;
    },
    json: '{{ site.baseurl }}/search.json',
  });

  // Pressing enter selects the first search result
  searchInput.addEventListener('keydown', function(event) {
    if (event.key === 'Enter') {
      var firstLink = document.querySelector('#results-container li a');
      if (firstLink) {
        window.location = firstLink.href;
      }
    }
  });
</script>

