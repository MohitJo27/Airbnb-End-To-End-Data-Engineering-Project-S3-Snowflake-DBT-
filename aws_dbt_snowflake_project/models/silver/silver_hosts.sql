{{
    config(
        materialized='incremental',
        unique_key='HOST_ID',
        on_schema_change='sync_all_columns'
    )
}}

SELECT
    HOST_ID,
    REPLACE(HOST_NAME, ' ', '_') AS HOST_NAME,
    HOST_SINCE,
    IS_SUPERHOST,
    RESPONSE_RATE,
    CASE
        WHEN RESPONSE_RATE > 99 THEN 'V.Good'
        WHEN RESPONSE_RATE > 88 THEN 'Good'
        WHEN RESPONSE_RATE > 66 THEN 'Fair'
        ELSE 'Poor'
    END AS RESPONSE_RATE_TAG,
    CREATED_AT

FROM
    {{ ref('bronze_hosts') }}
