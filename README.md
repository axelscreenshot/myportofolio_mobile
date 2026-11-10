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
