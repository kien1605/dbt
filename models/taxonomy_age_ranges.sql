WITH source_data AS (
    SELECT 
        _airbyte_data:tid AS term_id,
        _airbyte_data:name AS age_range_title,
        FROM_UNIXTIME(_airbyte_data:changed) AS updated_at,
        FROM_UNIXTIME(_airbyte_data:changed) AS created_at
    FROM {{ source('airbyte_schema', 'taxonomy_term_field_data') }}
    WHERE _airbyte_data:vid = 'age_ranges'
)
SELECT 
    term_id, 
    age_range_title, 
    updated_at, 
    created_at
FROM source_data;
