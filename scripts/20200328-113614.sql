ALTER TABLE cases ADD COLUMN IF NOT EXISTS is_confirmed BOOLEAN DEFAULT FALSE;
ALTER TABLE cases ADD COLUMN IF NOT EXISTS tested_at TIMESTAMP;
ALTER TABLE cases ADD COLUMN IF NOT EXISTS confirmed_at TIMESTAMP;
ALTER TABLE cases ADD COLUMN IF NOT EXISTS address TEXT; 