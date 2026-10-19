#!/usr/bin/env python3
"""Patch only the Research Skillsets section and append the matching CSS.

Run: python3 apply_skillsets.py /path/to/yigon.github.io
Use --dry-run to inspect the diff without modifying files.
"""
import argparse
from datetime import datetime
from pathlib import Path
import difflib
import re
import sys

SECTION = (Path(__file__).resolve().parent / 'skillsets-section.md').read_text(encoding='utf-8').rstrip() + '\n'
CSS = (Path(__file__).resolve().parent / 'skillsets.css').read_text(encoding='utf-8').rstrip() + '\n'
CSS_START='/* skillsets-bio-list:start'
CSS_END='/* skillsets-bio-list:end */'

def update_research(contents):
    headings=list(re.finditer(r'(?im)^##\s+skillsets?\s*$',contents))
    if len(headings)!=1:
        raise ValueError(f'Expected exactly one "## Skillsets" heading; found {len(headings)}. No files changed.')
    start=headings[0].start()
    other=re.search(r'(?m)^#{1,2}\s+[^\n]+',contents[headings[0].end():])
    end=(headings[0].end()+other.start()) if other else len(contents)
    suffix=contents[end:].lstrip('\n')
    return contents[:start].rstrip('\n')+'\n\n'+SECTION.rstrip()+'\n'+ ('\n'+suffix if suffix else '')

def update_css(contents):
    if CSS_START in contents or CSS_END in contents:
        a=contents.find(CSS_START); b=contents.find(CSS_END)
        if a<0 or b<a: raise ValueError('Found incomplete skillsets CSS markers. No files changed.')
        return contents[:a].rstrip()+'\n\n'+CSS + contents[b+len(CSS_END):].lstrip('\n')
    return contents.rstrip()+'\n\n'+CSS

def diff(name,old,new):
    return ''.join(difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile=str(name),tofile=str(name)))

def main():
    ap=argparse.ArgumentParser()
    ap.add_argument('repo',type=Path,help='Path to cloned yigon.github.io repo')
    ap.add_argument('--dry-run',action='store_true',help='Print proposed changes without writing')
    args=ap.parse_args()
    research=args.repo/'research.md'
    stylesheet=args.repo/'assets/css/monotone.css'
    for path in (research,stylesheet):
        if not path.is_file(): raise FileNotFoundError(f'Missing {path}; check your repository path.')
    old_md=research.read_text(encoding='utf-8')
    old_css=stylesheet.read_text(encoding='utf-8')
    new_md=update_research(old_md)
    new_css=update_css(old_css)
    if args.dry_run:
        print(diff(research,old_md,new_md))
        print(diff(stylesheet,old_css,new_css))
        return
    stamp=datetime.now().strftime('%Y%m%d-%H%M%S')
    for path,old,new in ((research,old_md,new_md),(stylesheet,old_css,new_css)):
        if new==old:
            print(f'No change: {path}')
            continue
        backup=path.with_name(path.name+'.bak-'+stamp)
        backup.write_text(old,encoding='utf-8')
        path.write_text(new,encoding='utf-8')
        print(f'Updated: {path}; backup: {backup}')

if __name__=='__main__':
    try: main()
    except (ValueError,FileNotFoundError) as e:
        print(f'Error: {e}',file=sys.stderr)
        sys.exit(1)
