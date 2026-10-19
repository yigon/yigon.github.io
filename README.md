# Yigon Kim's homepage

Personal academic website built with Jekyll and GitHub Pages.

## Sources

- `index.md`, `bio.md`, and `research.md`: Home, Bio, and Research pages.
- `research/*.md`: the three research detail pages.
- `_layouts/default.html`: shared layout, navigation, page banner, and footer.
- `assets/css/monotone.css`: shared stylesheet, including biography and skillsets styles.
- `assets/img/220702_MW.jpg`: page banner image.
- `assets/img/research/`: images referenced by the research pages.
- `_config.yml`: site metadata, URL settings, and build exclusions.
- `Gemfile` and `Gemfile.lock`: existing Ruby dependencies.

Edit these sources directly. Generated output, design examples, and previously
applied setup scripts are not needed to maintain the current pages.

## Local review

To review changes without building the site:

```sh
git diff --check
git diff
```

To build manually with the existing Ruby/Bundler environment:

```sh
bundle exec jekyll build --destination /tmp/yigon-homepage-preview
```

## Backup

`backup/before-cleanup-20261019-154841/` contains the complete repository snapshot
from before the cleanup, including hidden files, Git history, generated output,
and previous backups. `repository.tar.gz` preserves the original directory
structure; `SOURCE_SHA256SUMS` lists the original file checksums, and
`ARCHIVE_SHA256SUMS` records the archive checksum. `CLEANUP.txt` lists the cleanup
changes.

The backup is local and excluded from Git and Jekyll output. To inspect or recover
the original files, extract the archive into a separate empty directory. Avoid
extracting its `.git` directory over the working repository.
