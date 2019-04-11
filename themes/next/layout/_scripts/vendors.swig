{# Reset `window.Promise` when it was not a function. #}
{# IE refers the element whose id is `Promise` as `window.Promise`, this causes Velocity throwing an exception #}
<script type="text/javascript">
  if (Object.prototype.toString.call(window.Promise) !== '[object Function]') {
    window.Promise = null;
  }
</script>

{% set js_vendors = {} %}
{% set js_vendors.jquery      = 'jquery/index.js?v=2.1.3' %}
{% set js_vendors.fastclick   = 'fastclick/lib/fastclick.min.js?v=1.0.6' %}
{% set js_vendors.lazyload    = 'jquery_lazyload/jquery.lazyload.js?v=1.9.7' %}
{% set js_vendors.velocity    = 'velocity/velocity.min.js?v=1.2.1' %}
{% set js_vendors.velocity_ui = 'velocity/velocity.ui.min.js?v=1.2.1' %}

{% if theme.fancybox %}
  {% set js_vendors.fancybox  = 'fancybox/source/jquery.fancybox.pack.js?v=2.1.5' %}
{% endif %}


 <script type="text/javascript">
      // borwserRedirect
      (function browserRedirect(){
        var sUserAgent = navigator.userAgent.toLowerCase();
        var bIsIpad = sUserAgent.match(/ipad/i) == 'ipad';
        var bIsIphone = sUserAgent.match(/iphone os/i) == 'iphone os';
        var bIsMidp = sUserAgent.match(/midp/i) == 'midp';
        var bIsUc7 = sUserAgent.match(/rv:1.2.3.4/i) == 'rv:1.2.3.4';
        var bIsUc = sUserAgent.match(/ucweb/i) == 'web';
        var bIsCE = sUserAgent.match(/windows ce/i) == 'windows ce';
        var bIsWM = sUserAgent.match(/windows mobile/i) == 'windows mobile';
        var bIsAndroid = sUserAgent.match(/android/i) == 'android';

        if( bIsIphone || bIsMidp || bIsUc7 || bIsUc || bIsCE || bIsWM || bIsAndroid ){
          document.getElementById('top-github').style.display='none';
        }
      })();
    </script>

{% if theme.canvas_nest %}
  {% set js_vendors.canvas_nest  = 'canvas-nest/canvas-nest.min.js' %}
{% endif %}

{% if theme.three_waves %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.three_waves  = 'three/three-waves.min.js' %}
{% endif %}

{% if theme.canvas_lines %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_lines  = 'three/canvas_lines.min.js' %}
{% endif %}

{% if theme.canvas_sphere %}
  {% set js_vendors.three  = 'three/three.min.js' %}
  {% set js_vendors.canvas_sphere  = 'three/canvas_sphere.min.js' %}
{% endif %}

{% if theme.canvas_ribbon.enable and theme.scheme === 'Pisces'%}
  {% set js_vendors.canvas_ribbon  = 'canvas-ribbon/canvas-ribbon.js' %}
{% endif %}

{% for name, internal in js_vendors %}
  {% set internal_script = url_for(theme.vendors._internal) + '/' + internal %}
  {% if name == 'canvas_ribbon' %}
    <script id="ribbon" type="text/javascript" size="{{ theme.canvas_ribbon.size }}" alpha="{{ theme.canvas_ribbon.alpha }}"  zIndex="{{theme.canvas_ribbon.zIndex }}" src="{{ theme.vendors[name] | default(internal_script) }}"></script>
  {% else %}
    <script type="text/javascript" src="{{ theme.vendors[name] | default(internal_script) }}"></script>
  {% endif %}
{% endfor %}
