# File Management System

Aplikasi web sederhana untuk mengelola file dari dua folder: `folderMaha` dan `folderReva`.

## Fitur

✅ **Pengelompokan berdasarkan jenis file** - File dikelompokkan otomatis (Database, Document, Image, Code, Archive, Other)  
✅ **Pencarian file** - Cari file berdasarkan nama  
✅ **Filter berdasarkan jenis** - Filter file berdasarkan kategori  
✅ **Download file** - Download file langsung dari browser  
✅ **Statistik** - Lihat jumlah total file per folder  

## Struktur Folder

```
managementFolder/
├── assets/
│   ├── folderMaha/      # File-file dari Maha
│   └── folderReva/      # File-file dari Reva
├── public/
│   ├── index.html       # Halaman utama
│   ├── style.css        # Styling
│   └── app.js           # JavaScript frontend
├── server.js            # Backend server (Express)
├── package.json         # Dependencies
├── .gitignore          # File yang diabaikan Git
└── README.md           # Dokumentasi ini
```

## Cara Menjalankan

### 1. Install Dependencies

Pertama kali, install semua dependencies yang diperlukan:

```bash
npm install
```

### 2. Jalankan Server

```bash
npm start
```

Atau untuk development (auto-restart):

```bash
npm run dev
```

### 3. Buka di Browser

Buka browser dan akses:
```
http://localhost:3000
```

## Cara Menggunakan

1. **Melihat File** - Semua file akan ditampilkan dikelompokkan berdasarkan jenisnya
2. **Mencari File** - Ketik nama file di kotak pencarian dan klik tombol "🔍 Cari"
3. **Filter** - Pilih jenis file dari dropdown untuk filter berdasarkan kategori
4. **Download** - Klik tombol "⬇️ Download" pada file yang ingin didownload

## API Endpoints

### GET `/api/files`
Mendapatkan semua file dari kedua folder

### GET `/api/search?q=nama&type=Database`
Mencari file berdasarkan nama dan/atau jenis

### GET `/api/download/:folder/:filename`
Download file tertentu

### GET `/api/types`
Mendapatkan summary jenis-jenis file

## Teknologi yang Digunakan

- **Backend:** Node.js + Express
- **Frontend:** HTML, CSS, JavaScript (Vanilla)
- **Styling:** CSS3 dengan gradient modern

## Push ke GitHub

Sebelum push ke GitHub, pastikan:

1. File `.gitignore` sudah ada (untuk ignore `node_modules/`)
2. Jalankan perintah berikut:

```bash
git add .
git commit -m "Add file management system"
git push origin main
```

## Catatan

- Server berjalan di port 3000
- Pastikan folder `assets/folderMaha` dan `assets/folderReva` sudah ada
- File yang ada di `node_modules/` tidak akan ikut di-push ke GitHub

## License

MIT
