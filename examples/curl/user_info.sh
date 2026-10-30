#!/usr/bin/env bash
# Instagram User Info API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./user_info.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/instagram/user/info" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.instagram.com/k.mbappe
