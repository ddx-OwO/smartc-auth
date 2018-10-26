# Smartc Auth

Smartc Auth adalah sebuah library Authentication dan Access Control sederhana untuk framework CodeIgniter dibuat oleh Dewa Andhika Putra [@therealdwzzzl](http://twitter.com/therealdwzzzl).

Smartc Auth terinspirasi dari library CodeIgniter Ion Auth karya @benedmunds yang mengusung sistem login yang sederhana.

## Peringatan
Library ini masih dalam tahap beta. Artinya, masih terdapat **banyak** bug. Dan juga dokumentasi kode belum tersedia. Tapi tentu nya akan segera dibuat.

## Fitur:
- Authentication menggunakan cookie
- Kustomisasi permission
- **Protected Users**. User yang tidak dapat di delete (immortal mungkin ?)
- Kustomisasi Role Group
- dan masih banyak lagi

## Instalasi:
1. Import file sql yang ada di folder **sql**
2. Pindahkan file dari package ini ke folder application CodeIgniter anda

```shell
CI                          # → Root Directory
└── application/
    ├── config/
    │   └── smartc_auth_config.php
    ├── language/               # → Language files
    ├── libraries
    │   └── Smartc_auth.php
    ├── models
        └── Smartc_auth_model.php
```

3. Load library smartc_auth

	$this->library->load('smartc_auth');

## Dokumentasi
Dokumentasi akan segera dibuat

## Penggunaan Dasar

### Default Login
Default login untuk admin

Username: **admin**
Password: **admin**

### Pemeriksaan Login
Untuk periksa apakah user sudah login atau belum bisa menggunakan method `is_logged_in()`

**Contoh:**

```php
if($this->smartc_auth->is_logged_in() === TRUE)
{
	echo 'Anda sudah login';
}

```

### Login

```php
$identity = 'admin';
$pass = 'admin';
$rememberme = FALSE;

if($this->smartc_auth->login($identity, $pass, $rememberme) === TRUE)
{
	echo 'Anda berhasil login';
}

```

### In Group
Untuk periksa apakah user termasuk dalam semua group atau hanya salah satunya.

**Contoh:**

```php
// Asumsikan user masuk ke dalam group admin

if($this->smartc_auth->in_group('admin') === FALSE)
{
	echo 'Anda harus menjadi admin untuk masuk ke halaman ini';
}

// Menggunakan array
if($this->smartc_auth->in_group(array('admin', 'moderator')) === FALSE)
{
	echo 'Anda harus menjadi admin dan moderator untuk masuk ke halaman ini';
}

// Menggunakan array untuk user tertentu
if($this->smartc_auth->in_group(array('admin', 'moderator'), 1) === FALSE)
{
	echo 'Anda harus menjadi admin atau moderator untuk masuk ke halaman ini';
}

// Menggunakan array dan memeriksa apakah user masuk dalam semua group.
// Nilai nya akan bernilai FALSE karena user hanya masuk group admin
if($this->smartc_auth->in_group(array('admin', 'moderator'), NULL, TRUE) === FALSE)
{
	echo 'Anda harus menjadi admin dan moderator untuk masuk ke halaman ini';
}

```

### Permission
Untuk periksa apakah user punya permission tertentu menggunakan `user_has_permission()`

**Contoh:**

```php
if($this->smartc_auth->user_has_permission('add_user') === FALSE)
{
	echo 'Anda harus mempunyai hak akses add_user';
}

```

## TODO Lists
- [x] User Access Control
- [ ] Documentation
- [ ] Email Verification
- [ ] Google reCaptcha integration
- [ ] OAuth 2 Support
- [ ] CodeIgniter 4 Support

## Kontribusi
Kode ini masih jauh dari kata **layak** tentunya. Dan saya juga belum cukup pengalaman tentang dunia pemrograman, untuk itu silakan kirim **Pull Request** ke repository ini untuk berkontribusi dan saya sangat mengharapkan kontribusi untuk memperbaiki code ini agar lebih baik lagi.

Untuk penulisan sintaks, silakan mengacu pada [CodeIgniter 3.x Style Guide](https://www.codeigniter.com/user_guide/general/styleguide.html).

## Bantuan
Jika anda merasa kesulitan atau bahkan bingung dengan penggunaan library ini, silakan kontak saya melalui:
- Telegram: [@dwzzzl](https://t.me/dwzzzl)
- Facebook: [Dewa Andhika](https://www.facebook.com/dwzzzl)
- Twitter: [@therealdwzzzl](https://twitter.com/therealdwzzzl)
- Email: dewaandhika18@gmail.com

Dan saya akan merespon sesegera mungkin.
Terima kasih.