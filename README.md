### Pre-requirements

The following is installed:

- Git / Git Bash
- AutoHotkey

I recommend using [scoop](https://scoop.sh/) for the installations.

After installing scoop, user **PowerShell** to install the necessary software:

```
scoop install git
```

For AutoHotkey, I recommend using the installer from their website:

<https://www.autohotkey.com/download/ahk-install.exe>

### Config files setup

Using **Git Bash**, clone the repository in the home directory:

```sh
git clone https://github.com/HerCerM/wa.git "$HOME/wa"
```

Run the setup script:

```
sh -- $HOME/wa/setup.sh
```

