# praktikum_api_crud
Nama:Galang Bagus Erkamta
Nim:362458302015
Kelas:2B

## A. Tujuan Praktikum
Setelah praktikum ini, mahasiswa diharapkan mampu:
1.	Memahami konsep API dan REST API.
2.	Menggunakan package http di Flutter untuk mengakses API eksternal.
3.	Melakukan operasi Read (GET),Create (POST)pada data dari API.
4.	Menampilkan data API ke UI menggunakan FutureBuilder dan ListView.
5.	Membuat form input untuk menambah data pengguna ke server.

## B. Dasar Teori
API (Application Programming Interface)
API adalah penghubung antara aplikasi dengan server untuk bertukar data. Dalam praktikum ini, Flutter bertindak sebagai client yang berkomunikasi dengan server reqres.in untuk mengambil dan mengirim data.
REST API
REST (Representational State Transfer) menggunakan metode HTTP seperti:
•	GET untuk membaca data
•	POST untuk membuat data baru
•	PUT untuk memperbarui data
•	DELETE untuk menghapus data
Package http
Library Flutter untuk melakukan permintaan HTTP seperti http.get(), http.post(), http.put(), dan http.delete().

## C. Langkah-Langkah Implementasi
 Hal pertama yang dilakukan adala setup proyek kemudian setting dependencies untuk http versi  terbaru, setelah itu membuat file user_model.dart, api_service.dart.
Lalu menampilkan data di main.dart, Data dari API ditampilkan menggunakan FutureBuilder dan ListView.builder. Jika data belum dimuat, muncul loading (CircularProgressIndicator).
Jika gagal, muncul pesan error dan tombol Coba Lagi.

Gambar pertamakali project berhasil di run.
![alt text](<WhatsApp Image 2025-10-27 at 23.03.59.jpeg>)

kemudian membuat halaman create data
![alt text](<WhatsApp Image 2025-10-28 at 00.14.04.jpeg>)

Setelah itu membuat halaman edit data
![alt text](<WhatsApp Image 2025-10-27 at 23.51.17 (1).jpeg>)
 
Setelah itu merubah tampilan home agar ada tombol edit & hapus
 ![alt text](<WhatsApp Image 2025-10-27 at 23.51.17 (2).jpeg>)

Kemudian membuat popup untuk delete data
 ![alt text](<WhatsApp Image 2025-10-27 at 23.51.17.jpeg>)
 
## D. Analisis Kode
1.lib/api_service.dart
Ini adalah file layanan (service) yang bertugas mengelola semua komunikasi dengan API eksternal (dalam hal ini reqres.in).
•	Class ApiService berisi semua metode untuk melakukan request HTTP (GET, POST, PUT, DELETE).
•	fetchUsers(): Mengambil (GET) daftar pengguna dari API.
•	createUser(): Mengirim (POST) data untuk membuat pengguna baru.
•	updateUser(): Mengirim (PUT) data untuk memperbarui pengguna yang ada berdasarkan ID.
•	deleteUser(): Mengirim (DELETE) permintaan untuk menghapus pengguna berdasarkan ID.

2. lib/main.dart
Ini adalah file utama dan titik masuk aplikasi.
•	Fungsi main() akan menjalankan aplikasi.
•	MyApp adalah root widget yang mengatur MaterialApp (judul, tema, dan halaman utama).
•	Halaman utamanya adalah UserListPage, yang merupakan StatefulWidget.
•	UserListPage adalah inti dari aplikasi ini. Halaman ini:
o	Memuat daftar pengguna dari API menggunakan apiService.fetchUsers() saat halaman dibuka (initState).
o	Menangani status loading (_isLoading) dan error (_error).
o	Menampilkan daftar pengguna menggunakan ListView.builder dan widget UserListItem.
o	Menyediakan fitur RefreshIndicator (tarik untuk refresh).
o	Memiliki FloatingActionButton untuk menavigasi ke halaman AddUserPage (Tambah User).
o	Mengatur logika untuk _handleEdit (navigasi ke EditUserPage) dan _handleDelete (menampilkan dialog konfirmasi dan memanggil API).

3.lib/edit_user_page.dart
Ini adalah halaman (layar) untuk mengedit pengguna yang sudah ada.
•	Sangat mirip dengan AddUserPage, namun halaman ini menerima objek User sebagai parameter.
•	Saat halaman dibuka (initState), TextEditingController akan langsung diisi dengan data pengguna yang ada (widget.user).
•	Saat tombol "Update User" ditekan, fungsi _onSubmit akan memanggil apiService.updateUser().
•	Sama seperti halaman tambah, ia akan menampilkan SnackBar dan kembali ke halaman daftar jika berhasil.

4. lib/user_list_item.dart
Ini adalah widget UI kustom yang digunakan untuk menampilkan satu item pengguna di dalam ListView pada main.dart.
•	Merupakan StatelessWidget yang menerima objek User.
•	Bertanggung jawab untuk tampilan visual satu baris pengguna (menggunakan Card, ListTile, CircleAvatar dengan Hero animation, dll.).
•	Menerima fungsi callback onEdit dan onDelete dari UserListPage. Ini memungkinkan tombol "Edit" dan "Delete" di dalam item ini untuk memicu fungsi yang ada di main.dart.

## Kesimpulan & Saran
Setelah melakukan praktikum tersebut, saya menyimpulkan bahwa aplikasi Flutter untuk manajemen pengguna dengan fungsi CRUD (CREATE,UPDATE,READ,DELETE) telah dibuat dengan baik dan berjalan sesuai tujuan. Aplikasi ini juga telah berhasil melakukan komunikasi dengan REST API publik (reqres.in) menggunakan paket http. Untuk salah satu proyek, saya rasa pembagian tanggung jawab di dalam proyek berjalan dengan baik. Untuk logika bisnis dan pemanggilan API, semuanya telah dikelola dalam satu kelas layanan (api_service.dart). Adanya model data seperti user_model.dart dan created_user_model.dart juga sangat membantu dalam manajemen dan pem-parsing-an data JSON dari API, sehingga menjadikan kode di lapisan UI lebih bersih. Dan juga  untuk aplikasi ini bisa ditambahkan peningkatan penanganan error, agar Ketika mengakses aplikasi jika terdapat kesalahan bisa langsung terlihat.

