# Research Skillsets — Biography-style list

This change replaces the **image only in Research > Skillsets** with a readable, four-category text list. It leaves the other research content unchanged and adds no illustration, borders, or rounded cards. Dates, qualifications, and other Bio page content are not modified.

## Apply to the existing Jekyll website

1. Download and extract this archive.
2. From a terminal, run:
   `python3 apply_skillsets.py /path/to/yigon.github.io --dry-run`
3. Check the proposed diff; then run without `--dry-run`.
4. Commit the changes to `research.md` and `assets/css/monotone.css` as normal.

Alternatively, replace the content of the existing `## Skillsets` section in `research.md` with `skillsets-section.md`, and append the contents of `skillsets.css` to `assets/css/monotone.css`.

The script creates timestamped `.bak-...` backups for each changed file, validates that exactly one `## Skillsets` heading exists, and can be rerun without duplicating the CSS block. It does not make any changes to the remote GitHub repository.

## Design
- Desktop: category at left in the same small sans-serif font family as the Bio dates; details as a clear list in the site's regular serif font at right.
- Mobile (700px and below): category above its details.
- Four groups with generous vertical spacing; no cards or decorative graphics.
- Existing gray section rules are unaffected.

The repository's latest main-branch files could not be downloaded in this environment; the patch uses the known heading (`## Skillsets`) and only changes that section. It refuses to edit if that heading cannot be found.
