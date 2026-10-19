-- Data tambahan: mata kuliah sesuai jadwal SALAM
INSERT INTO salam.mata_kuliah (kode_mk, nama_mk, sks, dosen, ruang, hari, jam_mulai, jam_selesai) VALUES
('20100470501033', 'Inteligensia Buatan', 3, NULL, NULL, 'Jumat', '12:40', '15:10'),
('20100470501032', 'Interaksi Manusia dan Komputer', 3, NULL, NULL, 'Kamis', '07:00', '09:30');

-- Manajemen Basis Data: hadir 6 dari 8 pertemuan
INSERT INTO salam.absensi (mahasiswa_id, kode_mk, pertemuan_ke, hadir)
SELECT 1, '20100470501024', n, n NOT IN (3, 6) FROM generate_series(1, 8) n;

-- Inteligensia Buatan: hadir 7 dari 7 pertemuan
INSERT INTO salam.absensi (mahasiswa_id, kode_mk, pertemuan_ke, hadir)
SELECT 1, '20100470501033', n, TRUE FROM generate_series(1, 7) n;

-- Interaksi Manusia dan Komputer: hadir 4 dari 5 pertemuan
INSERT INTO salam.absensi (mahasiswa_id, kode_mk, pertemuan_ke, hadir)
SELECT 1, '20100470501032', n, n <> 4 FROM generate_series(1, 5) n;

-- Rekap kehadiran per mata kuliah
SELECT m.nama_mk,
       COUNT(*) FILTER (WHERE a.hadir) AS hadir,
       COUNT(*) AS total_pertemuan
FROM salam.absensi a
JOIN salam.mata_kuliah m ON m.kode_mk = a.kode_mk
GROUP BY m.nama_mk;