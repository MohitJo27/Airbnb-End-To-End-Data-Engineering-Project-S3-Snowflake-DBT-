{% 
    set congigs = [
        {
            "table": ref('silver_bookings'),
            "columns": "silver_BOOKINGS.*",
            "alias": "silver_BOOKINGS"
        },
        {
            "table": ref('silver_listings'),
            "columns": "silver_listings.HOST_ID, silver_listings.PROPERTY_TYPE, silver_listings.ROOM_TYPE, silver_listings.CITY, silver_listings.COUNTRY, silver_listings.ACCOMMODATES, silver_listings.BEDROOMS, silver_listings.BATHROOMS, silver_listings.PRICE_PER_NIGHT, silver_listings.PRICE_PER_NIGHT_TAG, silver_listings.CREATED_AT AS LISTINGS_CREATED_AT",
            "alias": "silver_listings",
            "join_condition": "silver_BOOKINGS.LISTING_ID = silver_LISTINGS.LISTING_ID"
        },
        {
            "table": ref('silver_hosts'),
            "columns": "silver_hosts.HOST_NAME, silver_hosts.HOST_SINCE, silver_hosts.IS_SUPERHOST, silver_hosts.RESPONSE_RATE, silver_hosts.RESPONSE_RATE_TAG, silver_hosts.CREATED_AT AS HOSTS_CREATED_AT",
            "alias": "silver_hosts",
            "join_condition": "silver_LISTINGS.HOST_ID = silver_HOSTS.HOST_ID"
        }
    ]
%}

SELECT
    {% for config in congigs%}
        {{ config['columns'] }}{% if not loop.last %}, {% endif %}
    {% endfor %}
FROM
    {% for config in congigs %}
        {% if loop.first %}
            {{ config['table'] }} AS {{ config['alias'] }}
        {% else%}
            LEFT JOIN {{ config['table'] }} AS {{ config['alias'] }}
            ON {{ config['join_condition'] }}
        {% endif %}
    {% endfor %}