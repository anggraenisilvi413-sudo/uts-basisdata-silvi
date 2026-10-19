-- Buat user
CREATE ROLE backend_dev   LOGIN PASSWORD 'backend123';
CREATE ROLE bi_dev        LOGIN PASSWORD 'bi123';
CREATE ROLE data_engineer LOGIN PASSWORD 'de123';

-- Akses dasar
GRANT CONNECT ON DATABASE db_uts TO backend_dev, bi_dev, data_engineer;
GRANT USAGE ON SCHEMA salam TO backend_dev, bi_dev;

-- backend_dev: CRUD semua tabel
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA salam TO backend_dev;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA salam TO backend_dev;

-- bi_dev: hanya SELECT (tabel dan view)
GRANT SELECT ON ALL TABLES IN SCHEMA salam TO bi_dev;

-- data_engineer: jadi owner semua object (bisa CREATE, ALTER, DROP, CRUD)
ALTER SCHEMA salam OWNER TO data_engineer;
ALTER TABLE salam.mahasiswas OWNER TO data_engineer;
ALTER TABLE salam.mata_kuliah OWNER TO data_engineer;
ALTER TABLE salam.absensi OWNER TO data_engineer;
ALTER VIEW salam.v_ringkasan_mahasiswa OWNER TO data_engineer;
ALTER SEQUENCE salam.mahasiswas_id_seq OWNER TO data_engineer;
ALTER SEQUENCE salam.absensi_id_seq OWNER TO data_engineer;

-- Agar object baru otomatis ikut aturan
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
    GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
    GRANT SELECT ON TABLES TO bi_dev;