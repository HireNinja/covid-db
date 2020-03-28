DROP TABLE locations;

CREATE TABLE IF NOT EXISTS locations (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type VARCHAR(255) NOT NULL, 
    short_name VARCHAR(255) NOT NULL,
    long_name TEXT NOT NULL,
    position POINT NOT NULL,
    parent_uuid UUID references locations(uuid),
    formatted_address TEXT,
    place_id VARCHAR(255) NOT NULL,
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);