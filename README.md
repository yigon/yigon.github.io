# Yigon Kim — Minimal Monotone Jekyll Theme

A self-contained minimal styling overlay for `yigon/yigon.github.io`.

## Design

- Pure white background, near-black type, quiet gray accents, fine divider lines.
- **EB Garamond**, with Garamond/Baskerville/Georgia fallbacks. The web font is loaded from Google Fonts; the site remains readable without it.
- Home / Bio / Research desktop navigation with a center-out animated underline on hover, persistent underline on the active page, and accessible keyboard focus.
- Responsive/mobile header, narrow editorial reading column, comfortable line spacing.
- No JavaScript required. Respects `prefers-reduced-motion`.

## Apply to a Jekyll repository

1. Back up or commit your existing theme files (`_layouts/default.html`, `_layouts/page.html`, `_layouts/home.html` if present).
2. Copy the package's `_layouts/` and `assets/css/monotone.css` to the matching repository paths.
3. Ensure `index.md`, `bio.md` and `research.md` each have Jekyll YAML front matter, including `layout: default` (or `layout: home` / `layout: page`):

   ```yaml
   ---
   layout: default
   ---
   ```

   Keep the body of each existing Markdown page unchanged. Any current page front matter should be **edited**, not replaced wholesale.
4. Jekyll will auto-detect the output URLs of `bio.md` and `research.md` for the menu (including custom `permalink` settings). If your filenames differ, update the `site.pages | where: 'name', ...` lines in `_layouts/default.html`.
5. Commit and push to GitHub Pages. If you build locally, run `bundle exec jekyll serve` from your repository.

## Important integration caveat

The original repository's raw files could not be fetched for a full compatibility audit. The templates are a **drop-in replacement**, not a line-by-line edit of your current `_layouts` files. They intentionally preserve Markdown body content via `{{ content }}`, but an existing theme's custom layout snippets, JS/CSS integrations, footer links, embeds or metadata may require merging rather than overwriting. Check the existing files first.

The `preview/` folder is a stand-alone **design demonstration**, not a copy of your actual website or actual page text. Open `preview/index.html` in any browser to inspect the look and nav hover animation.
