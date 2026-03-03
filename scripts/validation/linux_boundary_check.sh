#!/usr/bin/env bash
set -euo pipefail

OUT_FILE="evidence/week-01/session-02-boundary-check.txt"
mkdir -p "$(dirname "$OUT_FILE")"

{
  echo "== Session 02 Linux Boundary Check =="
  date -u +"UTC Timestamp: %Y-%m-%dT%H:%M:%SZ"
  echo

  echo "== Host Info =="
  uname -a
  echo

  echo "== Current User =="
  whoami
  id
  echo

  echo "== Sudo Group Members =="
  getent group sudo || true
  getent group wheel || true
  echo

  echo "== SSH Config Checks =="
  if command -v sshd >/dev/null 2>&1; then
    sshd -T 2>/dev/null | grep -E '^(passwordauthentication|permitrootlogin|protocol)\b' || true
  else
    echo "sshd not installed on this host."
  fi
  echo

  echo "== Sensitive File Permissions =="
  ls -l /etc/passwd /etc/shadow /etc/sudoers 2>/dev/null || true
  echo

  echo "== Sudoers Includes =="
  ls -l /etc/sudoers.d 2>/dev/null || true
  echo

  echo "== Result =="
  echo "Boundary baseline evidence captured."
} | tee "$OUT_FILE"
