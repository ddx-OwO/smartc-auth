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

