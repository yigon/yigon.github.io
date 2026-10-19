# Biography typography and spacing update

This is an **additive** update to the monotone Jekyll theme supplied earlier.
The current GitHub `bio.md` was not accessible during this run, so this package does **not** overwrite your actual biography content.

## Apply

1. Append the complete contents of `bio-timeline-additions.css` to the **end** of `assets/css/monotone.css` in your repository. Do not replace your existing stylesheet; doing so could remove your recent hero-title/subtitle edits.
2. In your existing `bio.md`, wrap each date/content item using the structure in `bio-markup-example.md` (`bio-list`, `bio-entry`, `bio-entry__date`, `bio-entry__content`). Keep the facts and original text from your site.
3. Keep the `##` headings of your existing sections. The thin grey divider rule supplied previously will continue to separate major sections.
4. No changes to `_layouts/default.html`, `index.md`, or `research.md` are required.

## Visual behavior

- Date uses the same sans-serif family (`--sans`) and weight as the Home eyebrow (the label type used for “Astronomy · Cosmology · Scientific Machine Learning”). At 10.5px it is slightly smaller than the previous 11px eyebrow. On mobile it is 11px for clarity.
- A single entry is one row: date on the left, title/details on the right; on a narrow screen the date stacks above the content.
- Tight spacing between title and description; 1.9–2.6rem between separate dated entries.
- No borders on individual entries; section-level grey rules from the existing theme remain.

## Capitalization convention

- **Section headings:** Title Case (`Education`, `Research Experience`, `Academic Activities`).
- **Date labels:** `Mar 2024 – Present`, `Sep 2022`, consistent abbreviated English months with initial capital.
- **Degrees and proper names:** official spellings (`Ph.D.`, `Seoul National University`, `Gaia DR3`).
- **Descriptions:** sentence case (`Research on Galactic structure and dynamics` -> `Research on galactic structure and dynamics`).
- CSS does not change text case automatically: update existing strings in `bio.md` where appropriate.

## HTML notes

Use plain HTML inside Jekyll Markdown so each date and its content are structurally grouped. The sample has `<article>` and `<time>`-styled elements, but they are just presentational; the placeholders are not intended to replace your actual history. You may add `datetime="2024-03"` for single dates; omit `datetime` for ranges since HTML `<time datetime>` does not support a free-form date range.
