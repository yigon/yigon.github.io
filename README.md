# Full-width Milky Way hero + gray subsection rules

These files update the earlier monotone Jekyll theme for yigon.github.io.

## Apply

1. In your repository, copy `_layouts/default.html` and `assets/css/monotone.css` to the same locations. Keep backups of your own edits before replacing anything. The other layout files are included for completeness, but unchanged.
2. Your uploaded image stays in `/assets/img/220702_MW.jpg`; you do **not** need to copy it into this package. The CSS uses `../img/220702_MW.jpg` because `monotone.css` lives in `/assets/css/`.
3. In `index.md`, `bio.md`, and `research.md`, **remove the existing leading Markdown H1** (`# ...`) if present. The new layout already renders the page's main title in the photo banner, so keeping both would duplicate the title. Do not remove any H2 subsections (`## ...`).
4. Give each Markdown page a `title` in YAML front matter (the Home banner uses `site.title` by default). To override any banner title, set `hero_title: "Your heading"`.
5. Push the updated files to your GitHub Pages repository.

Examples of front matter:

    ---
    layout: default
    title: Research
    hero_title: Research
    wide_layout: true
    ---

    ---
    layout: default
    title: Bio
    ---

    ---
    layout: home
    title: Home
    hero_title: Yigon Kim
    ---

## How it works

- The common image banner is **outside** the content-width container, so it spans 100% of the viewport. The title aligns with the site's usual margins.
- `background-size: cover` crops horizontally or vertically as needed. Adjust `background-position: center 53%` to move the crop up/down, and `.page-hero` min-height to change banner height.
- The dark overlay protects white title legibility on a bright photograph.
- Thin gray dividers appear **before the second and later top-level H2 headings**, while `.research-card h2` remains exempt to avoid double lines. Adjacent `<section>` blocks also get separators.
- Desktop research Grid is three columns, tablet two, mobile one (matching your prior request); feel free to keep your own `research-grid` style if you've already customized it.
- `hide_hero: true` in front matter disables the banner for a page if desired.

## Caution

I could not fetch the latest GitHub repository files for a line-by-line compatibility audit. These files are based on the **monotone theme generated earlier in this conversation**, not on a verified copy of your current GitHub commit. Merge changes if you already made additional CSS, front matter, or layout edits. A standalone `hero-and-divider-additions.css` is supplied if you want to append only the new CSS.
