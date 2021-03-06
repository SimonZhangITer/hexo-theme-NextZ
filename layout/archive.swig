{% extends '_layout.swig' %}
{% import '_macro/post-collapse.swig' as post_template %}
{% import '_macro/sidebar.swig' as sidebar_template %}

{% block title %} {{ __('title.archive') }} | {{ config.title }} {% endblock %}

{% block page_class %} page-archive {% endblock %}

{% block header %}
    <header id="header" class="header" itemscope itemtype="http://schema.org/WPHeader" style="background-image: url('{{ url_for( theme.cover.archive || theme.cover.home ) }}');">
      <div class="header-inner"> {%- include '_partials/header.swig' %} </div>
    </header>
{% endblock %}

{% block content %}

  <section id="posts" class="posts-collapse">
    <span class="archive-move-on"></span>

    <span class="archive-page-counter">
       {{ _p("counter.archive_posts", site.posts.length) }}
    </span>

    {% for post in page.posts %}

      {# Show year #}
      {% set year %}
      {% set post.year = date(post.date, 'YYYY') %}

      {% if post.year !== year %}
        {% set year = post.year %}
        <div class="collection-title">
          <h2 class="archive-year motion-element" id="archive-year-{{ year }}">{{ year }}</h2>
        </div>
      {% endif %}
      {# endshow #}

      {{ post_template.render(post) }}

    {% endfor %}

  </section>

  {% include '_partials/pagination.swig' %}

{% endblock %}

{% block sidebar %}
  {{ sidebar_template.render(false) }}
{% endblock %}


{% block script_extra %}
  {% if theme.use_motion %}
    <script type="text/javascript" id="motion.page.archive">
      $('.archive-year').velocity('transition.slideLeftIn');
    </script>
  {% endif %}
{% endblock %}
