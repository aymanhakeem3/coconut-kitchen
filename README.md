# Coconut Kitchen

A recipe app that installs on your Android home screen and works offline.

## Files

| File | What it is |
|---|---|
| `index.html` | The whole app — recipes, day tracker, editor |
| `manifest.webmanifest` | Tells Chrome the name, colours and icons to install with |
| `sw.js` | Service worker — caches the app so it opens with no connection |
| `icon-192.png`, `icon-512.png`, `icon-maskable-512.png` | Home screen icons |

Keep all six files together in one folder. The app looks for them beside itself.

## Why it has to be hosted

Chrome only installs pages served over `https`. Opening `index.html` from your
Downloads folder works fine as a webpage, but the Install button will tell you
it can't install from a file. You need a URL.

## Putting it online with GitHub Pages (free, ~3 minutes)

1. Create a new public repository, for example `coconut-kitchen`.
2. Upload all six files to the root of the repo — not inside a subfolder.
3. Repo **Settings → Pages**. Under *Build and deployment*, set Source to
   **Deploy from a branch**, branch `main`, folder `/ (root)`. Save.
4. Wait about a minute, then open
   `https://<your-username>.github.io/coconut-kitchen/` on your phone in Chrome.
5. The Install panel appears at the top of the page. Tap **Install**.

Netlify Drop (drag the folder onto netlify.com/drop) and Cloudflare Pages both
work the same way if you'd rather not use GitHub.

## Features

- **Two languages.** The button at the top right switches between English and
  Arabic. Arabic is a real translation of every recipe, not machine output, and
  the whole layout flips to RTL. Your choice is remembered.
- **Bilingual recipes of your own.** The editor has English and العربية tabs.
  Numbers, picture and category are shared; name, ingredients and method are
  stored per language. Fill one side only and it shows in both.
- **Cooking mode.** One step at a time in large type, with the screen kept awake
  and a tap-to-start timer on any step that has a duration in it. Works in both
  languages.
- **Share any recipe.** Open a recipe and use *Share card* for a PNG recipe card
  (it goes straight into WhatsApp on Android via the native share sheet) or
  *Share as text* for plain text you can paste anywhere.

## After installing

- It opens full screen with no address bar, like a normal app.
- It works with no connection — the service worker caches everything.
- Your day, your recipes and your targets are stored in the browser on that
  device. They do not sync anywhere.
- Use **Download backup** in the app before changing phones or clearing browser
  data, and **Restore from file** on the new one.

## Updating the app later

Edit `index.html`, then bump the version string at the top of `sw.js`
(`coconut-kitchen-v1` → `v2`) and re-upload both. Without the bump, the old
cached copy keeps loading.
