{# SELECT * FROM {{ ref('bronze_bookings') }} #}

{# SELECT * FROM {{ ref('obt') }} #}
SELECT * FROM {{ ref('silver_listings') }}