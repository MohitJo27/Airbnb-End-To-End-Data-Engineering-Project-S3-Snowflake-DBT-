{% set flag = 10 %}

SELECT * FROM {{ ref('bronze_bookings') }} 
{% if flag == 1 %}
WHERE NIGHTS_BOOKED > {{ flag }}
{% else %}
WHERE NIGHTS_BOOKED < {{ flag }}
{% endif %}