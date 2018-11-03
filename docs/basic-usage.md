## Basic Usage {docsify-ignore}

### Default Login
Default login untuk admin

Username: **admin**
Password: **admin**

## Pemeriksaan Login
Untuk periksa apakah user sudah login atau belum bisa menggunakan method `is_logged_in()`

**Contoh:**

```php
if($this->smartc_auth->is_logged_in() === TRUE)
{
	echo 'Anda sudah login';
}

```

## Login

```php
$identity = 'admin';
$pass = 'admin';
$rememberme = FALSE;

if($this->smartc_auth->login($identity, $pass, $rememberme) === TRUE)
{
	echo 'Anda berhasil login';
}

```

## Registering User

Registering user without form validation
```php
$identity = $this->input->post('username');
$password = $this->input->post('password');
$email = $this->input->post('email');
$extra_data = $this->input->post('extra_field');

if ($this->smartc_auth->register($identity, $password, $email, $extra_data) !== FALSE)
{
	redirect('login');
}
else
{
	// Get the error message(s)
	$this->session->set_flashdata('messages', $this->smartc_auth->message());
}
```

Using form validation
```php
$validations = array(
	array(
		'field' => 'username',
		'label' => 'Username',
		'rules' => array(
			'required',
			array('username_check', array($this->smartc_auth, 'username_check')) // Using username check method
		)
	),
	array(
		'field' => 'password',
		'label' => 'Password',
		'rules' => 'required'
	),
	array(
		'field' => 'email',
		'label' => 'Email',
		'rules' => 'required|valid_email|is_unique[users.user_email]'
	)
);

if ($this->form_validation->run() === TRUE)
{
	$this->smartc_auth->register($data['username'], $data['password'], $data['email'], '', '', array(3));
	$this->session->set_flashdata('messages', $this->smartc_auth->message());
} else {
	// Get the error message(s)
	$this->session->set_flashdata('form_validation_messages', $this->form_validation->error_string());
	$this->session->set_flashdata('messages', $this->smartc_auth->message());
}
```

## Checking User Authorization Access
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

## Checking User Permissions Access
Untuk periksa apakah user punya permission tertentu menggunakan `user_has_permission()`

**Contoh:**

```php
if($this->smartc_auth->user_has_permission('add_user') === FALSE)
{
	echo 'Anda harus mempunyai hak akses add_user';
}

```

