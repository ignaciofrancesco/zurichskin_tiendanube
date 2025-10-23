<div class="row mt-4 justify-content-center">
  <div class="col-12 col-md-8">
    <div id="product-description" class="mt-4" data-store="product-description-{{ product.id }}">
      
      {# Product description #}
      {% if product.description is not empty %}
        <div class="product-description user-content">
          {{ product.description }}
        </div>
      {% endif %}

      {# Facebook comments #}
      {% if settings.show_product_fb_comment_box %}
        <div class="fb-comments section-fb-comments d-block mb-4" data-href="{{ product.social_url }}" data-num-posts="5" data-width="100%"></div>
      {% endif %}

      <div id="reviewsapp"></div>

      {# Product share buttons #}
      {% include 'snipplets/social/social-share.tpl' %}

    </div>
  </div>
</div>

<style>
  #product-description {
    margin: 40px auto;      /* espacio arriba y abajo */
    max-width: 800px;       /* ancho máximo centrado */
    padding: 0 20px;        /* aire a los costados en pantallas chicas */
    text-align: left;       /* mantiene lectura natural */
  }
</style>
