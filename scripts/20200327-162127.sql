CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE IF NOT EXISTS users (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    email VARCHAR(255) NOT NULL,
    username VARCHAR(30) NOT NULL,
    password TEXT NOT NULL,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    phone VARCHAR(30),
    country VARCHAR(10),
    ip_address VARCHAR(255),
    user_agent TEXT NOT NULL,
    ref VARCHAR(255),
    last_seen_at TIMESTAMP,
    reset_token VARCHAR(255), 
    access_token TEXT NOT NULL, 
    access_token_expired_at TIMESTAMP NOT NULL,
    facebook_id VARCHAR(255),
    google_id VARCHAR(255),
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE UNIQUE INDEX ON users(email);
CREATE UNIQUE INDEX ON users(username); 

CREATE TABLE IF NOT EXISTS cases (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    sku VARCHAR(255) NOT NULL,
    position POINT NOT NULL,
    city VARCHAR(255),
    country VARCHAR(255) NOT NULL,
    is_recovered BOOLEAN NOT NULL DEFAULT false,
    is_dead BOOLEAN NOT NULL DEFAULT false,
    is_verified BOOLEAN NOT NULL DEFAULT false,
    submitted_by UUID REFERENCES users(uuid),
    source TEXT,
    reported_at TIMESTAMP,
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE INDEX ON cases(sku);
CREATE INDEX ON cases(country);
CREATE INDEX ON cases(city);
CREATE INDEX ON cases(reported_at); 


CREATE TABLE IF NOT EXISTS posts (
    uuid UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    title TEXT NOT NULL,
    description TEXT,
    link TEXT NOT NULL,
    image_url TEXT,
    source VARCHAR(255),
    highlight BOOLEAN DEFAULT FALSE,
    votes INT NOT NULL DEFAULT 0,
    clicks INT NOT NULL DEFAULT 0,
    country VARCHAR(255),
    city VARCHAR(255),
    submitted_by UUID REFERENCES users(uuid),
    deleted_at  TIMESTAMP,
    updated_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);