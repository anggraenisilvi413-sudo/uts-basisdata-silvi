-- Uji 1: PRIMARY KEY (harus error)
INSERT INTO salam.mahasiswas (id, nim, nama, kelas) VALUES (1, '111', 'Tes', 'D');

-- Uji 2: UNIQUE (harus error)
INSERT INTO salam.mahasiswas (nim, nama, kelas) VALUES ('1247050035', 'Tes', 'D');

-- Uji 3: CHECK ipk (harus error)
INSERT INTO salam.mahasiswas (nim, nama, kelas, ipk) VALUES ('222', 'Tes', 'D', 5.00);

-- Uji 4: CHECK kelas (harus error)
INSERT INTO salam.mahasiswas (nim, nama, kelas) VALUES ('333', 'Tes', 'Z');