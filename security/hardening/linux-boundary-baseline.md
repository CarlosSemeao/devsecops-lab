# Linux Boundary Baseline

## Account and Privilege Controls
- Review sudo group membership.
- Enforce least privilege in sudoers and drop-in files.

## SSH Boundary Controls
- PasswordAuthentication should be disabled.
- PermitRootLogin should be disabled.
- Protocol should be 2.

## Sensitive File Permissions
- /etc/passwd expected mode: 644
- /etc/shadow expected mode: 640 (or distro default restrictive mode)
- /etc/sudoers should be read-only for root/admin policy controls.

## Evidence Rule
All checks must output to evidence/week-01/session-02-boundary-check.txt
