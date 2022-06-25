#!/bin/sh

# Verify admin priviliges are granted for the current session.
function has-admin-privilege {
  $identity = [system.security.principal.windowsIdentity]::getCurrent()
  $principal = new-object system.security.principal.windowsprincipal($identity)
  $admin_role = [system.security.principal.windowsBuiltInRole]::administrator
  if ($principal.isInRole($admin_role)) {
    return $true
  }
  else {
    return $false
  }
}
if (-not (has-admin-privilege)) {
  write-error "Please run the script in a session with admin privileges"
  exit 1
}

# Pick the user to use for the script and set the 'chosen home'.
$user = read-host -prompt `
    "Which user do you want to configure? (leave blank to use '$env:username')"
if (-not $user) {
  $user = $env:username
}

# Verify the chosen user has a home directory.
function has-file {
  param(
    [string] $filepath
  )
  if (get-item "$filepath" -errorAction silentlyContinue) { 
    return $true
  }
  return $false
}
$chome = "C:\Users\$user"
if (-not (has-file "$chome")) {
  write-error "The user '$user' is not valid." 
  exit 1
}

# Clone wa repository, if not already cloned.
function has-file {
  param(
    [string] $filepath
  )
  if (get-item "$filepath" -errorAction silentlyContinue) { 
    return $true
  }
  return $false
}
$wa = "$chome\wa"
if (-not (has-file "$wa")) { 
  git clone https://github.com/HerCerM/wa.git "$wa"
}

# Symlink configuration files.
function create-symbolic-link {
  param (
    [string] $link,
    [string] $target
  )
  # Remove conflicting file, if any.
  remove-item -path "$link" -errorAction silentlyContinue
  new-item -path "$link" -itemType symbolicLink -value "$target"
}
# AutoHotkey script file.
$startup = "$chome\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"
create-symbolic-link -link "$startup\wa.ahk" -target "$wa\wa.ahk"

