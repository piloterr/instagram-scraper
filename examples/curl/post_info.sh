#!/usr/bin/env bash
# Instagram Post Info API – cURL example
# Usage: PILOTERR_API_KEY=your-key ./post_info.sh
set -euo pipefail

curl -sS -G "https://api.piloterr.com/v2/instagram/post/info" \
  -H "x-api-key: ${PILOTERR_API_KEY}" \
  --data-urlencode query=https://www.instagram.com/p/CshTQQlMGMl
