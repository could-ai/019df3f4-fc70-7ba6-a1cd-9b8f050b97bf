# Aplikasi Presentasi Produk

Aplikasi Presentasi Produk adalah aplikasi interaktif bergaya slide deck yang dibuat dengan [CouldAI](https://could.ai). Aplikasi ini mendemonstrasikan bagaimana membangun presentasi yang dinamis dan menarik layaknya PowerPoint menggunakan Flutter, lengkap dengan navigasi antar slide, penjelasan pengertian awalan produk, kalkulator simulasi keuntungan, dan animasi yang mulus.

## Fitur Aplikasi

- Antarmuka slide interaktif menggunakan `PageView`
- Navigasi mulus dengan tombol panah dan indikator progres slide
- **Slide Pengenalan:** Penjelasan awal tentang produk dan fitur-fitur utamanya
- **Slide Masalah & Solusi:** Komparasi visual antara proses manual dan otomatis
- **Slide Kalkulator ROI:** Kalkulator interaktif yang mensimulasikan penghematan biaya tahunan (ROI) berdasarkan jumlah karyawan
- **Slide Kesimpulan:** Ringkasan manfaat dan seruan bertindak (call-to-action)
- Tema Material Design 3 dengan skema warna yang profesional
- Desain responsif, optimal untuk layar lebar (Web/Desktop) dan dapat berjalan di perangkat mobile

## Dibangun Menggunakan

- Flutter
- Dart
- Material Design 3

## Struktur Proyek

```text
lib/
  main.dart      Titik masuk aplikasi, pengaturan rute, navigasi slide, dan konten presentasi
pubspec.yaml     Metadata paket dan dependensi Flutter
android/         File proyek Android
ios/             File proyek iOS
web/             File proyek Web
macos/           File proyek macOS
windows/         File proyek Windows
linux/           File proyek Linux
```

## Mulai Menggunakan

Instal Flutter, kemudian unduh dependensinya:

```bash
flutter pub get
```

Jalankan aplikasi presentasi:

```bash
flutter run
```

## Catatan Pengembangan

Seluruh logika presentasi dan antarmuka slide berada di `lib/main.dart`. Anda dapat menambahkan lebih banyak slide dengan membuat class widget baru dan menambahkannya ke dalam daftar `_slides` di state utama.

## Tentang CouldAI

Aplikasi ini dibuat dengan [CouldAI](https://could.ai), AI pembuat aplikasi untuk platform lintas perangkat. CouldAI mengubah perintah (prompt) menjadi aplikasi native untuk iOS, Android, Web, dan Desktop melalui agen AI otonom yang dapat mengarsiteki, membangun, menguji, mendeploy, dan melakukan iterasi pada aplikasi skala produksi.

Gunakan CouldAI di [could.ai](https://could.ai) untuk membangun dan menyempurnakan aplikasi lintas platform dengan AI.

## Lisensi

Tambahkan lisensi sebelum mendistribusikan aplikasi ini secara publik.
