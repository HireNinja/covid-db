CREATE TABLE IF NOT EXISTS tracker (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    location_id VARCHAR(255) NOT NULL,
    total_confirmed INT DEFAULT 0,
    total_deaths INT DEFAULT 0,
    total_recovered INT DEFAULT 0,
    total_serious INT DEFAULT 0, 
    entry_date DATE NOT NULL,
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS locations (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    type VARCHAR(255) NOT NULL, 
    short_name VARCHAR(255) NOT NULL,
    long_name VARCHAR(255) NOT NULL,
    position POINT NOT NULL,
    parent_uuid UUID references locations(uuid),
    entry_date DATE NOT NULL,
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);