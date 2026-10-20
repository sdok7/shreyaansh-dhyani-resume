My resume as a PDF in a vendored viewer that is static and light and quick to deploy

### How it loads

**Viewer choice** - the page picks by feature detection and never by user agent and the address bar stays on the site root so a copied link opens the page and not the raw PDF

**Chrome and Edge and Samsung Internet** - get [PDF.js (6.4.299 legacy)](https://github.com/mozilla/pdf.js) unless the connection is slow (2g or 3g or under 1.5 Mbps) and then they get a plain links page because only Chromium can measure speed

**Firefox and Safari on Mac** - use their own built-in viewer and if it hasn't opened after 8 seconds because the browser would rather download PDFs they get the links page too

**iPhone and iPad** - always get PDF.js because iOS only shows page 1 of a PDF inside an iframe

**No viewer or no JavaScript** - PDF.js covers browsers with nothing to embed and the links page covers JavaScript being off

**Links page** - just View and Download links with the PDF size and no PDF.js or custom font and its download progress bar buffers in memory so keep the PDF under 3 MB

**Why PDF.js** - it gives people one decent viewer where the browser's own is missing or bad and it ships with the site so nothing comes from a third party

**Crawlers** - PDF.js sits inside an iframe so the page looks empty to them which is why a hidden text block and Open Graph tags and schema.org data and a sitemap and llms.txt do the talking while the PDF and viewer stay noindex

### Using it

**Privacy** - no cookies or analytics or third party scripts

**Deploy** - no build step so you push to main and Cloudflare Pages does the rest

**Limits** - the 1.5 Mbps cutoff and the 8 second wait and the 3 MB PDF cap are just my defaults so set your own (all three are in the script in index.html and the cap is also in size.sh)

**Reuse** - swap the PDF and its filename (index.html and _headers and _redirects and llms.txt and size.sh) then the name and links and domain (index.html and 404.html and llms.txt and sitemap.xml and robots.txt) and my Google verification tag and run `./size.sh` whenever the PDF changes to refresh the size on the no-JS page

**Viewer tweaks** - PDF.js is minified and starts in its dark theme (`viewerCssTheme` in `pdfjs/web/viewer.mjs`) and phones get page width zoom (in `index.html`) and a short toolbar (CSS at the end of `pdfjs/web/viewer.css`) so reapply those if you update PDF.js

**License** - [Unlicense](LICENSE) except the resume and my personal details and PDF.js is Apache-2.0

---

If a site needs a build step to show one document then something went wrong
