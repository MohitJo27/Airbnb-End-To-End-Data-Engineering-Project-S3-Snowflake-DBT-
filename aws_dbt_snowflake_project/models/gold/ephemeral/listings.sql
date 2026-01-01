{{
    config(
        materialized='ephemeral'
    )
}}

WITH listings AS (
    SELECT
        LISTING_ID,
        CITY,
        COUNTRY,
        PROPERTY_TYPE,
        ROOM_TYPE,
        PRICE_PER_NIGHT_TAG,
        LISTINGS_CREATED_AT
    FROM 
        {{ ref('obt')}}
)
SELECT * FROM listings