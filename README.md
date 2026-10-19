# UTS Manajemen Basis Data - Silvi Anggraeni

PostgreSQL 15 dan PgAdmin4 dengan Docker Compose.

## Cara menjalankan
1. Salin `.env.example` menjadi `.env`, isi password, dan ganti port XXX dengan 3 digit terakhir NIM.
2. Jalankan: `docker compose up -d`
3. Jalankan script SQL berurutan:
   - `docker exec -it postgres_silvi psql -U postgres -d db_uts -f /sql/01_schema_table.sql`
   - `docker exec -it postgres_silvi psql -U postgres -d db_uts -f /sql/00_seed_data.sql`
   - `docker exec -it postgres_silvi psql -U postgres -d db_uts -f /sql/03_roles.sql`
4. PgAdmin: http://localhost:44035

## Isi
- `docker-compose.yml`: service postgres_silvi dan pgadmin_silvi
- `sql/`: schema, data contoh, uji constraint, dan role