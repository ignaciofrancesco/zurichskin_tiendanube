{% if home_main_product %}
    {% set show_thumbs = product.media_count > 1 %}
{% else %}
    {% set show_thumbs = not settings.scroll_product_images and (product.media_count > 1 or product.video_url) %}
{% endif %}

<div class="row" data-store="product-image-{{ product.id }}">
    
    {% if show_thumbs %}
    <div class="{% if home_main_product %}col-auto{% else %}col-2{% endif %} d-none d-md-block">
        <div class="product-thumbs-container position-relative">
            <div class="js-swiper-product-thumbs swiper-product-thumb">
                <div class="swiper-wrapper">
                    {% for media in product.media %}
                        <div class="swiper-slide">
                            {% include 'snipplets/product/product-image-thumbs.tpl' %}
                        </div>
                    {% endfor %}
                </div>
            </div>
            <div class="mt-2 text-center d-none d-md-block">
                <div class="js-swiper-product-thumbs-prev swiper-button-prev swiper-product-thumb-control">
                    <svg class="icon-inline icon-lg svg-icon-text icon-rotate-90-neg"><use xlink:href="#chevron"/></svg>
                </div>
                <div class="js-swiper-product-thumbs-next swiper-button-next swiper-product-thumb-control">
                    <svg class="icon-inline icon-lg svg-icon-text icon-rotate-90"><use xlink:href="#chevron"/></svg>
                </div>
            </div>
        </div>
    </div>
    {% endif %}

    {% if product.media_count > 0 %}
    <div class="product-image-container {% if show_thumbs %}{% if home_main_product %}col-md{% else %}col-md-10{% endif %}{% else %}col-12{% endif %} p-0">
        <div class="js-swiper-product swiper-container" data-product-images-amount="{{ product.media_count }}">
            {% include 'snipplets/labels.tpl' with {'product_detail': true} %}
            <div class="swiper-wrapper">
                {% for media in product.media %}
                    {% if media.isImage %}
                        <div class="js-product-slide swiper-slide" data-image="{{media.id}}" data-image-position="{{loop.index0}}">
                            <a href="{{ media | product_image_url('original') }}" 
                               data-fancybox="product-gallery" 
                               class="js-product-slide-link d-block position-relative product-slide-fixed">
                                <img src="{{ media | product_image_url('large') }}"
                                     alt="{{ media.alt }}"
                                     class="js-product-slide-img product-slider-image">
                            </a>
                        </div>
                    {% else %}
                        {% include 'snipplets/product/product-video.tpl' with {video_id: media.next_video, product_native_video: true, home_main_product: home_main_product} %}
                    {% endif %}
                {% endfor %}
            </div>
            <div class="js-swiper-product-pagination swiper-pagination"></div>
        </div>
    </div>
    {% endif %}
</div>
<script>
window.addEventListener('load', function () {
    if (typeof Swiper !== 'undefined') {

        var thumbsSwiper = new Swiper('.js-swiper-product-thumbs', {
            slidesPerView: 'auto',
            spaceBetween: 10,
            direction: 'vertical',
            watchSlidesProgress: true,
        });

        // Esperar un pequeño retardo para asegurar carga completa
        setTimeout(function() {
            var productSwiper = new Swiper('.js-swiper-product', {
                slidesPerView: 1,
                spaceBetween: 10,
                loop: false,
                pagination: {
                    el: '.js-swiper-product-pagination',
                    clickable: true,
                },
                thumbs: {
                    swiper: thumbsSwiper,
                },
            });
        }, 300);
    }
});
</script>

