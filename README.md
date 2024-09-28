

# NFT Wallet ICP

**NFT Wallet ICP** adalah aplikasi desentralisasi (dApp) berbasis **Internet Computer Protocol (ICP)** yang memungkinkan pengguna untuk **mint**, melihat, dan mentransfer **NFT**. Aplikasi ini terdiri dari dua bagian: **backend** yang ditulis dalam **Motoko** dan **frontend** berbasis **JavaScript** yang berkomunikasi dengan canister di jaringan **ICP**.

## Fitur
- Mint NFT dengan metadata.
- Lihat koleksi NFT yang dimiliki.
- Transfer NFT ke pengguna lain dengan **Principal ID**.

## Teknologi yang Digunakan

- **ICP (Internet Computer Protocol)** - Infrastruktur untuk menjalankan kontrak pintar (canister).
- **Motoko** - Bahasa pemrograman untuk kontrak pintar di ICP.
- **JavaScript** dan **Webpack** - Untuk frontend aplikasi.
- **dfx** - Alat pengembangan dari DFINITY untuk membangun, menguji, dan menerapkan canister.
- **@dfinity/agent** - Library untuk berinteraksi dengan canister ICP di frontend.

## Persyaratan

Pastikan Anda sudah menginstal beberapa alat berikut di sistem Anda:

- **Node.js** (v14 atau lebih baru)
- **npm** (v6 atau lebih baru)
- **DFINITY SDK (dfx)**. Ikuti [panduan instalasi dfx](https://smartcontracts.org/docs/quickstart/quickstart.html#download-and-install) jika belum diinstal.

## Struktur Proyek

```bash
nft-wallet-icp/
│
├── backend/
│   ├── src/
│   │   ├── nft_wallet.mo       # File kontrak pintar untuk wallet NFT
│   │   ├── nft_storage.mo      # File kontrak pintar untuk penyimpanan NFT
│   ├── dfx.json                # Konfigurasi DFX
│   ├── canister_ids.json       # ID Canister setelah deploy
│
├── frontend/
│   ├── src/
│   │   ├── index.html          # Halaman utama frontend
│   │   ├── index.js            # Logika aplikasi frontend
│   │   ├── styles.css          # Styling untuk aplikasi
│   ├── package.json            # Dependencies untuk frontend
│   └── webpack.config.js       # Konfigurasi Webpack
│
└── README.md                   # Dokumentasi proyek
```

## Cara Menjalankan Proyek

Berikut adalah langkah-langkah untuk menjalankan proyek **NFT Wallet ICP** di lokal Anda:

### 1. Clone Repository

Clone repository ini ke sistem Anda:

```bash
git clone https://github.com/Mknallisa/Mikaila
cd Mikaila
```

### 2. Install Dependencies

#### Backend

Jalankan perintah berikut untuk menginisialisasi proyek backend:

```bash
dfx start --background
dfx deploy
```

Ini akan men-deploy canister backend untuk **nft_wallet** dan **nft_storage**, serta menghasilkan file `canister_ids.json` yang berisi ID canister.

#### Frontend

Instal dependensi untuk frontend:

```bash
cd frontend
npm install
```

### 3. Menjalankan Frontend

Untuk menjalankan frontend di **localhost**, jalankan perintah berikut di direktori **frontend**:

```bash
npm run start
```

Frontend akan tersedia di [http://localhost:8080](http://localhost:8080), di mana Anda dapat berinteraksi dengan **NFT Wallet ICP**.

### 4. Interaksi dengan Aplikasi

- **Mint NFT**: Masukkan ID dan metadata NFT di form yang tersedia, lalu klik tombol "Mint NFT" untuk menambahkan NFT ke koleksi Anda.
- **Lihat Koleksi NFT**: Koleksi NFT yang Anda miliki akan ditampilkan di bagian "Your NFT Collection".
- **Transfer NFT**: Masukkan ID NFT yang ingin Anda transfer dan Principal ID penerima, lalu klik "Transfer NFT" untuk mengirim NFT tersebut.

## Konfigurasi Canister

Setelah **deploy**, file `canister_ids.json` akan berisi **ID canister** dari aplikasi backend. Anda perlu menggunakan ID ini di file frontend untuk menghubungkan frontend dengan backend.

Contoh file `canister_ids.json`:

```json
{
  "nft_wallet": {
    "local": "rrkah-fqaaa-aaaaa-aaaaq-cai",
    "ic": "replace-with-production-canister-id"
  },
  "nft_storage": {
    "local": "ryjl3-tyaaa-aaaaa-aaaba-cai",
    "ic": "replace-with-production-canister-id"
  }
}
```

## Deploy ke Internet Computer (Mainnet)

Untuk deploy ke jaringan **ICP** production, ikuti langkah berikut:

1. Jalankan perintah ini di terminal:

```bash
dfx deploy --network ic
```

2. Ganti **canister ID** di frontend (pada file `index.js`) dengan canister ID yang sesuai dari environment production.

## Kontribusi

Kontribusi untuk proyek ini sangat diterima! Silakan buat **pull request** atau buka **issue** jika Anda menemukan bug atau memiliki ide untuk perbaikan.

## Lisensi

Proyek ini dilisensikan di bawah lisensi **MIT**.

---
