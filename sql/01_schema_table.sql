CREATE SCHEMA IF NOT EXISTS salam;

CREATE TABLE salam.mahasiswas (
    id            SERIAL PRIMARY KEY,
    nim           VARCHAR(10) NOT NULL UNIQUE,
    nama          VARCHAR(100) NOT NULL,
    email         VARCHAR(100) UNIQUE,
    prodi         VARCHAR(50) NOT NULL DEFAULT 'Teknik Informatika',
    fakultas      VARCHAR(50) NOT NULL DEFAULT 'Sains dan Teknologi',
    kelas         CHAR(1) NOT NULL CHECK (kelas IN ('A','B','C','D')),
    ipk           NUMERIC(3,2) CHECK (ipk BETWEEN 0 AND 4),
    sks_lulus     INT DEFAULT 0 CHECK (sks_lulus >= 0),
    sks_semester  INT DEFAULT 0 CHECK (sks_semester BETWEEN 0 AND 24),
    status_online BOOLEAN DEFAULT FALSE,
    created_at    TIMESTAMP DEFAULT NOW()
);

CREATE TABLE salam.mata_kuliah (
    kode_mk     VARCHAR(20) PRIMARY KEY,
    nama_mk     VARCHAR(100) NOT NULL,
    sks         INT NOT NULL CHECK (sks BETWEEN 1 AND 6),
    dosen       VARCHAR(100),
    ruang       VARCHAR(20),
    hari        VARCHAR(10),
    jam_mulai   TIME,
    jam_selesai TIME
);

CREATE TABLE salam.absensi (
    id            SERIAL PRIMARY KEY,
    mahasiswa_id  INT NOT NULL REFERENCES salam.mahasiswas(id),
    kode_mk       VARCHAR(20) NOT NULL REFERENCES salam.mata_kuliah(kode_mk),
    pertemuan_ke  INT NOT NULL CHECK (pertemuan_ke BETWEEN 1 AND 16),
    hadir         BOOLEAN NOT NULL,
    UNIQUE (mahasiswa_id, kode_mk, pertemuan_ke)
);

CREATE VIEW salam.v_ringkasan_mahasiswa AS
SELECT nim, nama, prodi, kelas, ipk, sks_lulus
FROM salam.mahasiswas;