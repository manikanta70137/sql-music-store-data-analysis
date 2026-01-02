-- Track Data Loading Script
-- Author: Manikanta Chundu
-- Description: Loads track data from CSV with NULL handling
-- to ensure data integrity during bulk import.

-- Allow NULL values for CSV import
ALTER TABLE Track MODIFY album_id INT NULL;
ALTER TABLE Track MODIFY media_type_id INT NULL;
ALTER TABLE Track MODIFY genre_id INT NULL;
ALTER TABLE Track MODIFY milliseconds INT NULL;
ALTER TABLE Track MODIFY bytes INT NULL;
ALTER TABLE Track MODIFY unit_price DECIMAL(10,2) NULL;

-- Enable local file loading
SET GLOBAL local_infile = 1;

-- Load data from CSV
LOAD DATA LOCAL INFILE 'track.csv'
INTO TABLE Track
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price)
SET 
    album_id = NULLIF(album_id, ''),
    media_type_id = NULLIF(media_type_id, ''),
    genre_id = NULLIF(genre_id, ''),
    composer = NULLIF(composer, ''),
    milliseconds = NULLIF(milliseconds, ''),
    bytes = NULLIF(bytes, ''),
    unit_price = NULLIF(unit_price, '');
