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

> ## login_remembered_user

### ```login_remembered_user()```
Login user if they have token identifier cookie

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## logout

### ```logout()```
Logout user and destroy session

**Returns**
- void

**Return Types**
- void

> ## change_password

### ```change_password($identity, $new_password, $old_password = NULL)```
Change user password. If the old password filled, it will be automatically verify the password that
saved on database.

**Parameters**
* $identity (string) - User identity **[Required]**
* $new_password (string) - New password **[Required]**
* $old_password (string) - Old password **[Default: NULL]** **[Optional]**

**Returns**
- TRUE on success, FALSE on failure

**Return Types**
- boolean

> ## username_check

### ```username_check($username)```
Username availability check. This method also can be used in Form_validation callback

**Parameters**
* $username (string) - Username **[Required]**

**Returns**
- TRUE when username is **unique** or FALSE when username contains illegal characther, exceeding maximum length,
below minimum length, or not unique.

**Return Types**
- boolean


> ## in_group

### ```in_group($check_groups, $user_id = NULL, $check_all = FALSE)```
Check if user joined in a group(s) or not

**Parameters**
* $check_groups (mixed|string/array) - A group name or array of groups name **[Required]**
* $user_id (integer) - User id will automatically get from session if the parameter is NULL **[Optional]**
* $check_all (boolean) - Set to TRUE if want to check user joined in ALL groups **[Default: FALSE]** **[Optional]**

**Returns**
- TRUE when user joined in one or ALL of the groups, or FALSE if none of them.

**Return Types**
- boolean

> ## user_has_permission

### ```user_has_permission($permissions, $user_id = NULL, $check_all = FALSE)```
Check if user joined in a group(s) or not

**Parameters**
* $permissions (mixed|string/array) - A permission name or array of permissions name **[Required]**
* $user_id (integer) - User id will automatically get from session if the parameter is NULL **[Optional]**
* $check_all (boolean) - Set to TRUE if want to check user has ALL permissions **[Default: FALSE]** **[Optional]**

**Returns**
- TRUE when user has one or ALL of the permissions, or FALSE if none of them.

**Return Types**
- boolean