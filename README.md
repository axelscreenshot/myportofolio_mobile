Nama  : Axel Sebastian Saragih \
NPM   : 2506590063 \
Kelas : PBP B

# <div align="center">My Portofolio: Mobile — Progress</div>


<!-- ## Week X
Topic

**-- Disclaimer --** \
Essay


### Tugas X
1. ...
2. ...
3. ... -->


## Week 12
Flutter Navigation, Layouts, Forms, and Input Elements

**-- Tidak Menggunakan AI --**
<!-- Essay -->


### Tugas 8
1. `Navigator.push()` menambahkan suatu _route_ ke _stack route_ yang dikelola Navigator. Karena _route_ yang baru ditambahkan berada di atas _stack_, itulah yang akan ditampilkan ke pengguna. `Navigator.pushReplacement()` menge-_push_ dengan menghapus terlebih dahulu _route_ yang sedang ada di atas _stack_, dan `Navigator.pop()` hanya menghapus _route_ teratas pada _stack_, menyebabkan aplikasi berpindah ke _route_ yang di bawahnya (contoh: ketika menggunakan tombol 'back'). Khusus melalui kartu aksi, pembukaan formulir dilakukan dengan `Navigator.push()`. Pada drawer, opsi 'Home' melakukan routing kembali ke MyHomePage dengan `Navigator.pushReplacement()`.
2. Scaffold menyediakan struktur visual dasar halaman dan memiliki atribut AppBar yang menampilkan bar bagian atas pada setiap halaman aplikasi. Informasi teks pada AppBar kemudian dapat diatur bergantung pada halaman apa yang sedang ditampilkan. Untuk memudahkan navigasi antar halaman dengan mudah, ditambahkan Drawer yang terikat langsung dengan Scaffold sehingga juga termasuk komponen tiap halaman, memastikan struktur konsisten. Contoh penggunaan warna tema portofolio yang universal ada pada `main.dart`, di mana _theme_ halaman-halaman diatur menggunakan warna `seedColor: Colors.indigo`, `secondary: Colors.amber[700]`.
3. `Column` digunakan karena susunan _field_ secara vertikal sudah menjadi standar formulir pada umumnya, alur pengisian akan berjalan secara natural dari _field-field_ atas ke bawah. `CrossAxisAlignment.start` digunakan untuk me-rata-kiri-kan _fields_ mengikuti struktur teks pada umumnya (pada bahasa yang ditulis dari kiri ke kanan). Tata letak tersebut juga memiliki widget pengatur jarak dan widget penggulir pada `Padding` dan `SingleChildScrollView`: `Padding` memberi jarak antar elemen untuk kerapihan kebersihan dan `SingleChildScrollView` memberi kemampuan kepada pengguna untuk bisa _scroll_ apabila informasi pada halaman _overflow_.
4. `final _formKey = GlobalKey<FormState>();` berarti `_formKey` adalah sebuah _key_ global yang menyimpan _state_ dari _form_ tersebut, yang berarti _key_ ini unik untuk keseluruhan aplikasi dan digunakan untuk _save_, _reset_, dan validasi setiap _field_ pada _form_ terkait. Validasi ini dilakukan ketika tombol Simpan ditekan, menggunakan `validate()` untuk mereturn True apabila kesesuaian _form_ sudah dipastikan terlebih dahulu oleh `validator`. Contoh: `validator` akan menghasilkan pesan error apabila nama proyek hanya diisi spasi atau kosong, tidak memperbolehkan _save state_ sebelum semua valid. Jika hasil inputan tidak divalidasi, masalah-masalah formatting dapat muncul di waktu yang akan datang, sehingga memilih jenis input atau papan ketik saja belum cukup.


## Week 11
Basic Flutter

**-- Tidak Menggunakan AI --**
<!-- Essay -->


### Tugas 7
1. Pada Flutter, semua komponen UI adalah sebuah _widget_. Oleh karena itu, seluruh tampilan aplikasi sebenarnya hanyalah suatu _widget tree_ yang besar. Hubungan induk-anak antar-_widget_ mengikuti pewarisan mirip seperti umumnya, di mana properti dan atribut _parent_ akan diwariskan ke _child_.
2. MyPortfolio Mobile menggunakan widget sebagai berikut:
    - MaterialApp: _root_, mengatur tema, judul, dan halaman utama.
    - Scaffold: membangun struktur dasar halaman.
    - AppBar: menampilkan judul halaman di bagian atas.
    - Text: menampilkan teks.
    - Padding: memberi jarak antar elemen agar lebih rapi.
    - Row: menyusun elemen secara horizontal.
    - Column: menyusun elemen secara vertikal.
    - Center: menengahkan elemen.
    - GridView: menampilkan ikon dan tombol menu dalam bentuk _grid_.
    - Card: menampilkan kotak informasi pada InfoCard.
    - Container: membungkus _widget_ untuk memberi ukuran, padding, dan tata letak.
    - Icon: menampilkan ikon pada tombol menu.
    - InkWell: menangani interaksi _tap_ pada tombol menu.
    - SnackBar: menampilkan pesan saat tombol di-_tap_.
    - SizedBox: memberi jarak antar _widget_.
    - StatelessWidget: dipakai pada objek yang tampilannya tidak berubah secara dinamis.
3. MaterialApp adalah _widget_ yang menyediakan konfigurasi dasar aplikasi Flutter yang mengikuti Material Design Google. Ia mengatur tema aplikasi, judul aplikasi, _navigator_, _locale_, dan halaman awal yang akan ditampilkan. MaterialApp biasa digunakan sebagai root widget karena semua komponen Material Design seperti Scaffold, AppBar, Dialog, Theme, dan BottomNavigationBar membutuhkan konteks aplikasi yang terhubung ke konfigurasi global. Dengan MaterialApp sebagai _root_, aplikasi dapat konsisten dengan tema, navigasi, dan perilaku dasar seluruh halaman.
4. StatelessWidget adalah _widget_ yang tidak memiliki _state_ internal, sementara StatefulWidget memiliki _state_ internal sehingga masih dapat berubah saat _runtime_. Jika data yang ditampilkan sudah tetap dan tidak memerlukan _update_ saat terdapat interaksi pengguna, maka StatelessWidget cocok digunakan. Jika _widget_ diperlukan untuk berubah ketika ada interaksi pengguna, perubahan data, animasi, atau pemanggilan lainnya, gunakan StatefulWidget.
5. BuildContext adalah objek yang merepresentasikan lokasi _widget_ di dalam _widget tree_, digunakan untuk mengetahui posisi suatu _widget_ di dalam hirarki _widget_, sehingga _widget_ dapat mengakses data yang diwariskan. BuildContext penting karena Flutter memerlukan _context_ untuk mengakses informasi _widget tree_, seperti `Theme.of(context)`, `ScaffoldMessenger.of(context)`, dsb. Dalam `build`, context digunakan untuk membangun UI berdasarkan data yang diterima, yang ada di lingkungan _widget_ saat itu.
6. _Hot reload_ memungkinkan penerapan perubahan kode ke aplikasi yang sedang berjalan tanpa kehilangan _state_ aplikasi. Artinya, kita bisa langsung melihat hasil perubahan pada UI, sangat membantu saat sedang mengembangkan tampilan atau memperbaiki _bug_ yang berukuran kecil. _Hot restart_ memulai ulang aplikasi dari awal dan menghapus _state_ yang sebelumnya tersimpan, menginisialisasi ulang semuanya. Ketika perubahan yang dilakukan memengaruhi kode yang baru dijalankan di awal aplikasi (seperti `main()`, inisialisasi state, konfigurasi _dependency_, tema aplikasi, atau kode yang memengaruhi _lifecycle_ aplikasi), diperlukan _hot restart_ atau bahkan _full restart_ agar aplikasi benar-benar dimulai ulang dengan konfigurasi yang baru.


<!-- ## Resources -->
<!-- 1. [Title](link), purpose -->
