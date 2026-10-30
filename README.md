<p align="center">
  <a href="https://www.piloterr.com"><img src="images/banner.png" alt="Instagram Scraper API by Piloterr – scrape Instagram data as JSON" width="100%"></a>
</p>

# Instagram Scraper API

[![Discord](https://img.shields.io/badge/Discord-Join%20the%20community-5865F2?logo=discord&logoColor=white)](https://discord.gg/CFj3ph8aHU) [![Get API key](https://img.shields.io/badge/Piloterr-Get%20a%20free%20API%20key-111827)](https://app.piloterr.com) [![API docs](https://img.shields.io/badge/Docs-OpenAPI-0EA5E9)](https://app.piloterr.com/openapi) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

The **Piloterr Instagram Scraper API** lets you extract public data from Instagram as **clean, structured JSON** — no proxies, headless browsers or HTML parsing to maintain. Endpoints available in production:

- **Instagram Post Info API** — Monitor competitors and market trends by scraping Instagram posts for valuable data.
- **Instagram User Info API** — Gather user insights efficiently from Instagram for targeted marketing strategies.

Use it for brand monitoring, social listening, influencer research, ad intelligence or content analytics on public data.

| Endpoint | Path | Credits | What you get |
|---|---|---|---|
| [Instagram Post Info API](#instagram-post-info-api) | `/v2/instagram/post/info` | 1 | Monitor competitors and market trends by scraping Instagram posts for valuable data. |
| [Instagram User Info API](#instagram-user-info-api) | `/v2/instagram/user/info` | 1 | Gather user insights efficiently from Instagram for targeted marketing strategies. |

## Table of contents

- [How it works](#how-it-works)
- [Instagram Post Info API](#instagram-post-info-api)
- [Instagram User Info API](#instagram-user-info-api)
- [Code examples in other languages](#code-examples-in-other-languages)
- [Practical use cases](#practical-use-cases)
- [Why Piloterr?](#why-piloterr)
- [FAQ](#faq)
- [Related scrapers](#related-scrapers)
- [Support](#support)

## How it works

1. **Create a free Piloterr account** and copy your API key from the [dashboard](https://app.piloterr.com).
2. **Send a `GET` (or `POST`) request** to `https://api.piloterr.com/v2/...` with the header `x-api-key: YOUR_API_KEY`.
3. **Receive structured JSON** — Piloterr handles rendering, proxies, retries and parsing.

```bash
export PILOTERR_API_KEY="your-api-key"
pip install requests        # Python
# TypeScript: Node.js 18+ (native fetch), run with `npx tsx file.ts`
```

> Every endpoint accepts both `GET` (query string) and `POST` (JSON body with the same fields).

## Instagram Post Info API

Monitor competitors and market trends by scraping Instagram posts for valuable data.

`GET | POST https://api.piloterr.com/v2/instagram/post/info` · **1 credit per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | The Instagram post or reel to retrieve. Accepts a full URL or a shortcode. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/instagram/post/info",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "https://www.instagram.com/p/CshTQQlMGMl",
    },
    timeout=60,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type InstagramPostInfo = {
  id?: string;
  text?: string;
  is_video?: boolean;
  owner_id?: string;
  sponsors?: unknown[];
  shortcode?: string;
  text_lang?: string;
  text_tags?: unknown[];
  timestamp?: number;
  like_count?: number;
  location_id?: string;
  created_time?: string;
  product_type?: unknown;
  location_name?: string;
  location_slug?: string;
  related_posts?: unknown;
  comments_count?: number;
  paid_partnership?: boolean;
  text_tagged_users?: unknown[];
  video_plays_count?: unknown;
  video_views_count?: unknown;
  is_comments_disabled?: boolean;
  attached_media_display_url?: string;
  attached_media_tagged_users?: {
    id?: string;
    username?: string;
  }[];
  attached_carousel_media_urls?: string[];
};

const params = new URLSearchParams({
  "query": "https://www.instagram.com/p/CshTQQlMGMl",
});

const response = await fetch(`https://api.piloterr.com/v2/instagram/post/info?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as InstagramPostInfo;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/instagram/post/info
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "https://www.instagram.com/p/CshTQQlMGMl"}
```
</details>

### Output example

Response shape with placeholder values — field names follow the API reference.

```json
{
  "id": "example",
  "text": "example",
  "is_video": false,
  "owner_id": "example",
  "sponsors": [
    "example"
  ],
  "shortcode": "example",
  "text_lang": "example",
  "text_tags": [
    "example"
  ],
  "timestamp": 0,
  "like_count": 0,
  "location_id": "example",
  "created_time": "example",
  "product_type": "example",
  "location_name": "example",
  "location_slug": "example",
  "related_posts": "example",
  "comments_count": 0,
  "paid_partnership": false,
  "text_tagged_users": [
    "example"
  ],
  "video_plays_count": "example"
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `id` | string |  |
| `text` | string |  |
| `is_video` | boolean |  |
| `owner_id` | string |  |
| `sponsors` | any[] |  |
| `shortcode` | string |  |
| `text_lang` | string |  |
| `text_tags` | any[] |  |
| `timestamp` | integer |  |
| `like_count` | integer |  |
| `location_id` | string |  |
| `created_time` | string |  |
| `product_type` | object |  |
| `location_name` | string |  |
| `location_slug` | string |  |
| `related_posts` | object |  |
| `comments_count` | integer |  |
| `paid_partnership` | boolean |  |
| `text_tagged_users` | any[] |  |
| `video_plays_count` | object |  |
| `video_views_count` | object |  |
| `is_comments_disabled` | boolean |  |
| `attached_media_display_url` | string |  |
| `attached_media_tagged_users[]` | object[] |  |
| `attached_media_tagged_users[].id` | string |  |

## Instagram User Info API

Gather user insights efficiently from Instagram for targeted marketing strategies.

`GET | POST https://api.piloterr.com/v2/instagram/user/info` · **1 credit per request** · [Full reference](https://app.piloterr.com/openapi)

### Request parameters

| Parameter | Type | Required | Description |
|---|---|---|---|
| `query` | string | ✅ | The Instagram user to look up. Accepts a full profile URL or a username. |

### Python example

```python
import json
import os
import requests

response = requests.get(
    "https://api.piloterr.com/v2/instagram/user/info",
    headers={"x-api-key": os.environ["PILOTERR_API_KEY"]},
    params={
        "query": "https://www.instagram.com/k.mbappe",
    },
    timeout=60,
)
response.raise_for_status()
data = response.json()

print(json.dumps(data, indent=2, ensure_ascii=False)[:2000])
```

### TypeScript example

```typescript
type InstagramUserInfo = {
  id?: string;
  name?: string;
  posts?: {
    id?: string;
    likes?: number;
    caption?: string;
    comments?: number;
    is_video?: boolean;
    shortcode?: string;
    timestamp?: number;
    display_url?: string;
  }[];
  avatar?: string;
  gender?: string;
  private?: boolean;
  website?: unknown;
  username?: string;
  verified?: boolean;
  followers?: number;
  following?: number;
  description?: string;
  category_name?: string;
  business_account?: boolean;
  business_category_name?: string;
};

const params = new URLSearchParams({
  "query": "https://www.instagram.com/k.mbappe",
});

const response = await fetch(`https://api.piloterr.com/v2/instagram/user/info?${params}`, {
  headers: { "x-api-key": process.env.PILOTERR_API_KEY! },
});
if (!response.ok) throw new Error(`Piloterr error ${response.status}: ${await response.text()}`);

const data = (await response.json()) as InstagramUserInfo;

console.log(JSON.stringify(data, null, 2).slice(0, 2000));
```

<details>
<summary><b>POST variant</b></summary>

```http
POST https://api.piloterr.com/v2/instagram/user/info
x-api-key: YOUR_API_KEY
Content-Type: application/json

{"query": "https://www.instagram.com/k.mbappe"}
```
</details>

### Output example

Response shape with placeholder values — field names follow the API reference.

```json
{
  "id": "example",
  "name": "example",
  "posts": [
    {
      "id": "example",
      "likes": 0,
      "caption": "example",
      "comments": 0,
      "is_video": false,
      "shortcode": "example",
      "timestamp": 0,
      "display_url": "example"
    }
  ],
  "avatar": "example",
  "gender": "example",
  "private": false,
  "website": "example",
  "username": "example",
  "verified": false,
  "followers": 0,
  "following": 0,
  "description": "example",
  "category_name": "example",
  "business_account": false,
  "business_category_name": "example"
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `id` | string |  |
| `name` | string |  |
| `posts[]` | object[] |  |
| `posts[].id` | string |  |
| `posts[].likes` | integer |  |
| `posts[].caption` | string |  |
| `posts[].comments` | integer |  |
| `posts[].is_video` | boolean |  |
| `posts[].shortcode` | string |  |
| `posts[].timestamp` | integer |  |
| `posts[].display_url` | string |  |
| `avatar` | string |  |
| `gender` | string |  |
| `private` | boolean |  |
| `website` | object |  |
| `username` | string |  |
| `verified` | boolean |  |
| `followers` | integer |  |
| `following` | integer |  |
| `description` | string |  |
| `category_name` | string |  |
| `business_account` | boolean |  |
| `business_category_name` | string |  |

## Code examples in other languages

Ready-to-run examples live in the [`examples/`](examples) folder. Each one reads your key from the `PILOTERR_API_KEY` environment variable.

| Language | Post Info | User Info |
|---|---|---|
| cURL (Bash) | [`post-info`](examples/curl/post_info.sh) | [`user-info`](examples/curl/user_info.sh) |
| PHP | [`post-info`](examples/php/post_info.php) | [`user-info`](examples/php/user_info.php) |
| C# | [`post-info`](examples/csharp/PostInfo.cs) | [`user-info`](examples/csharp/UserInfo.cs) |
| Go | [`post-info`](examples/go/post_info.go) | [`user-info`](examples/go/user_info.go) |
| Java | [`post-info`](examples/java/PostInfoExample.java) | [`user-info`](examples/java/UserInfoExample.java) |
| Ruby | [`post-info`](examples/ruby/post_info.rb) | [`user-info`](examples/ruby/user_info.rb) |
| Node.js | [`post-info`](examples/nodejs/post_info.mjs) | [`user-info`](examples/nodejs/user_info.mjs) |

## Practical use cases

- **Brand monitoring** — Follow public mentions and engagement around your brand.
- **Social listening** — Analyse public conversations and trends.
- **Influencer research** — Qualify public creator profiles and audience metrics.
- **Ad intelligence** — Study competitors' public ads and creatives.
- **Content analytics** — Benchmark formats and engagement over time.

## Why Piloterr?

- **No infrastructure** — no proxies, headless browsers or CAPTCHA solving to run yourself.
- **Structured JSON** — stable, documented fields instead of brittle HTML selectors.
- **Pay per request** — transparent credit cost per endpoint, failed requests are retried for you.
- **One API key, hundreds of sources** — Instagram plus many other e-commerce, search and company data endpoints in the [Piloterr library](https://www.piloterr.com/library).
- **Any language** — plain HTTPS + JSON, with examples for Python, TypeScript, cURL, PHP, C#, Go, Java, Ruby and Node.js.

## FAQ

### Is it legal to scrape Instagram?

Collecting publicly available data is generally allowed in many jurisdictions, but rules depend on your country, the data you collect and how you use it. Avoid personal data unless you have a lawful basis, respect the website's terms where they apply, and get legal advice for your specific use case. This is not legal advice.

### Do I need proxies or a headless browser?

No. Piloterr handles rendering, proxy rotation and retries on its side. You only send an HTTPS request with your `x-api-key` header and receive JSON.

### How much does a request cost?

Credits per call: `/v2/instagram/post/info` **1**, `/v2/instagram/user/info` **1**. See the [Piloterr website](https://www.piloterr.com) for plans.

### What data does the Instagram API return?

Each endpoint returns structured JSON: **Instagram Post Info** — `id`, `text`, `is_video`, `owner_id`, `sponsors`, `shortcode`; **Instagram User Info** — `id`, `name`, `posts[]`, `posts[].id`, `posts[].likes`, `posts[].caption`.

### Which languages are supported?

Any language that can make an HTTP request. This README shows Python and TypeScript; the [`examples/`](examples) folder contains cURL, PHP, C#, Go, Java, Ruby and Node.js.

## Related scrapers

- [Kick Scraper API](https://github.com/piloterr/kick-scraper)
- [Patreon Scraper API](https://github.com/piloterr/patreon-scraper)
- [Pinterest Scraper API](https://github.com/piloterr/pinterest-scraper)
- [TikTok Top Ads Scraper API](https://github.com/piloterr/tiktoktopads-scraper)
- [weibo-scraper](https://github.com/piloterr/weibo-scraper)
- [X (Twitter) Scraper API](https://github.com/piloterr/twitter-x-scraper)
- [All Piloterr scrapers on GitHub](https://github.com/piloterr)

## Support

- 💬 Join the [Piloterr Discord](https://discord.gg/CFj3ph8aHU) to ask questions and share what you build.
- 📚 Browse the [API reference (OpenAPI)](https://app.piloterr.com/openapi) and the [Piloterr library](https://www.piloterr.com/library).
- 🔑 [Get your API key](https://app.piloterr.com).

---

<p align="center">
  <a href="https://www.piloterr.com">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo-dark.svg">
      <img src="images/logo.svg" alt="Piloterr" height="32">
    </picture>
  </a>
  <br>
  <sub>Built by <a href="https://www.piloterr.com">Piloterr</a> — web scraping APIs for e-commerce, search, real estate and more, one API key.</sub>
</p>

<sub>Instagram is a trademark of its respective owner. This repository is not affiliated with or endorsed by Instagram. Examples are released under the MIT license.</sub>
