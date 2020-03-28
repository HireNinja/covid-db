DROP TABLE IF EXISTS cases; 
CREATE TABLE IF NOT EXISTS cases (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sku VARCHAR(255) NOT NULL,
    location_uuid UUID REFERENCES locations(uuid),
    is_confirmed BOOLEAN NOT NULL DEFAULT false,
    is_recovered BOOLEAN NOT NULL DEFAULT false,
    is_dead BOOLEAN NOT NULL DEFAULT false,
    is_verified BOOLEAN NOT NULL DEFAULT false,
    submitted_by UUID REFERENCES users(uuid),
    source TEXT,
    reported_at TIMESTAMP,
    died_at TIMESTAMP,
    recovered_at TIMESTAMP,
    tested_at TIMESTAMP,
    confirmed_at TIMESTAMP,
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

DROP TABLE tracker;
CREATE TABLE IF NOT EXISTS tracker (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    location_uuid VARCHAR(255) NOT NULL,
    total_confirmed INT DEFAULT 0,
    total_deaths INT DEFAULT 0,
    total_recovered INT DEFAULT 0,
    total_serious INT DEFAULT 0, 
    entry_date DATE NOT NULL,
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);