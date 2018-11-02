# Smartc_auth Class {docsify-ignore}

> ## activate

### ```activate($identity, $code = '')```
Activate user and set message whether it is success or failed

**Parameters**
* $identity (string) - User identity (e.g username) **[Required]**
* $code (string) - User Activation Code **[optional]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

**Example**
```php
$identity = $this->input->get('username', TRUE);
$code = $this->input->get('activation_code', TRUE);

if ($this->smartc_auth->activate($identity, $code) === TRUE)
{
    echo 'OK';
}
```
> ## deactivate

### ```deactivate($identity)```
Activate user and set message whether it is success or failed

**Parameters**
* $identity (string) - User identity (e.g username) **[Required]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## ban

### ```ban($identity)```
Banned user and set message whether it is success or failed

**Parameters**
* $identity (string) - User identity (e.g username) **[Required]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## is_active

### ```is_active($identity)```
Check user status whether is active or not

**Parameters**
* $identity (string) - User identity (e.g username) **[Required]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## is_logged_in

### ```is_logged_in()```
Check user status whether is logged in or not

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## login

### ```login($identity, $password, $rememberme = FALSE)```
Authenticate user

**Parameters**
* $identity (string) - User identity (e.g username) **[Required]**
* $password (string) - User password **[Required]**
* $rememberme (boolean) - Is user want to be remembered ? **[Default: FALSE]** **[Optional]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## login_verify

### ```login_verify($identifier, $token)```
Verify user token if they're already authenticated

**Parameters**
* $identifier (string) - Token Identifier **[Required]**
* $token (string) - User Token **[Required]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## login_verify

### ```login_verify($identifier, $token)```
Verify user token if they're already authenticated

**Parameters**
* $identifier (string) - Token Identifier **[Required]**
* $token (string) - User Token **[Required]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean