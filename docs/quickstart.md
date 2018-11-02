# Quick start

## Requirements
* CodeIgniter v3.x.x
* PHP 5.6 or above (PHP 7.1 Recommended)

## Installation

1. Download file zip dari repository ini https://github.com/dwzzzl/Smartc-Auth-CodeIgniter/releases

Atau bisa meng-clone repository ini ke dalam folder aplikasi anda

```shell
> cd application
> git clone https://github.com/dwzzzl/Smartc-Auth-CodeIgniter.git
```
2. Pindahkan file dari package ini ke folder application CodeIgniter anda jika anda mengunduh secara manual

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

3. Eksekusi query sql yang ada di folder **sql**
4. Load library smartc_auth

> $this->library->load('smartc_auth');

## Configuration (default)

### Tables
Nama Tabel dari Database
```php
$config['tables']['users'] = 'users';
$config['tables']['groups'] = 'groups';
$config['tables']['user_groups'] = 'user_groups';
$config['tables']['group_permissions'] = 'group_permissions';
$config['tables']['logins'] = 'user_logins';
$config['tables']['permissions'] = 'permissions';
$config['tables']['login_attempts'] = 'login_attempts';
$config['tables']['ip_geodata'] = 'ip_geodata';
```

### Joins Column
Nama Kolom yang akan dijadikan referensi JOIN query
```php
$config['join']['users'] = 'user_id';
$config['join']['groups'] = 'group_id';
$config['join']['permissions'] = 'permission_id';
```

### Identity Column
Nama Kolom pada tabel "users" untuk identitas user

```php
$config['identity_column'] = 'username';
```

### User default group
User akan otomatis tergabung dalam grup ketika mereka register
```php
$config['user_default_group'] = 'user';
```

### Activation Method
manual = Only admin will activate new user
email  = New user will activated by email with verification link/code
FALSE  = No activation (Auto active)

```php
$config['activation_method'] = 'manual';
```

### Protected Users
Daftar user yang tidak bisa di hapus

'protected_users' = array of user identity that want to protect
```php
$config['protected_users'] = array('admin');
```

### Cookies
Nama Cookies untuk Authentication
- 'identity'			= Cookie for user identity
- 'token'				= Cookie for token.
- 'token_identifier'	= Cookie for token identifier.
- 'expiration'			= Default expiration time in seconds
- 'remember_expiration'= Expiration time in seconds when 'remember me' is checked

```php
$config['cookies']['identity'] = 'user';
$config['cookies']['token'] = 'token';
$config['cookies']['token_identifier'] = 'token_identifier';
$config['cookies']['login_id'] = 'login_id';
$config['cookies']['expiration'] = 7200;
$config['cookies']['remember_expiration'] = 31536000;
```

### Login recheck
Jeda waktu dalam detik untuk memeriksa dan membandingkan token pada PHP Session dan Cookie.

!> Disarankan untuk mengambil jeda tidak terlalu pendek untuk meringankan kerja database

```php
$config['login_recheck'] = 600;
```

### Misc Configuration
```php
$config['salt_type'] = PASSWORD_BCRYPT; // PHP Password constant algo

$config['track_login_attempts'] = TRUE;
$config['max_login_attempts'] = 3; // Max login attempts
$config['lockout_time'] = 100; // Lockout time in seconds

$config['username_min_length'] = 4; // Set to 0 for no minimal length
$config['username_max_length'] = 32; // Set to 0 for no maximal length
$config['username_allowed_chars'] = 'a-z0-9_'; //Regular expression for allowed characters
$config['password_min_length'] = 4; // Set to 0 for no minimal length
$config['password_max_length'] = 32; // Set to 0 for no maximal length

$config['message_start_delimeter'] = '';
$config['message_end_delimeter'] = '';
$config['message_new_line'] = "\n";
```

!> Peringatan ! Untuk saat ini metode verifikasi menggunakan email belum bisa digunakan.
```php
$config['email_config'] = array(
	'protocol' 	=> 'smtp',
	'smtp_host' => 'ssl://smtp.googlemail.com',
	'smtp_port' => '',
	'smtp_user' => 'your_email@gmail.com', // change it to yours
	'smtp_pass' => 'yourpasshere', // change it to yours
	'mailtype' 	=> 'html',
	'charset' 	=> 'iso-8859-1',
	'wordwrap' 	=> TRUE
);
$config['email_subject'] = 'Smartc Auth';
$config['admin_email'] = 'noreply@youremail.com';

$config['email_templates'] = 'auth/email/';
$config['email_activate'] = 'activate.php';

$config['auth_language'] = 'indonesian';
```
