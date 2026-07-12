#!/usr/bin/env bash
set -euo pipefail

# Run this script from the root of your Jekyll repository.
# Example:
#   bash add_research_subpages.sh
# or:
#   bash add_research_subpages.sh /path/to/yigon.github.io

ROOT="${1:-.}"
cd "$ROOT"

STAMP="$(date +%Y%m%d-%H%M%S)"

backup_file() {
  local f="$1"
  if [[ -f "$f" ]]; then
    cp "$f" "$f.bak-$STAMP"
    echo "Backed up $f -> $f.bak-$STAMP"
  fi
}

download_if_missing() {
  local url="$1"
  local out="$2"
  if [[ -f "$out" ]]; then
    echo "Exists: $out"
    return 0
  fi
  if command -v curl >/dev/null 2>&1; then
    echo "Downloading $out"
    curl -L --fail --silent --show-error "$url" -o "$out"
  else
    echo "curl not found. Please download manually: $url -> $out" >&2
  fi
}

mkdir -p research assets/img/research

download_if_missing "https://ykim28.weebly.com/uploads/1/3/2/7/132788570/orangepie-orig_orig.jpg" "assets/img/research/lss-sdss-pie.jpg"
download_if_missing "https://ykim28.weebly.com/uploads/1/3/2/7/132788570/clust-orig_orig.png" "assets/img/research/halo-cluster.png"
download_if_missing "https://ykim28.weebly.com/uploads/1/3/2/7/132788570/milky-way_orig.webp" "assets/img/research/milky-way.webp"
download_if_missing "https://ykim28.weebly.com/uploads/1/3/2/7/132788570/1371900361_orig.jpg" "assets/img/research/mw-dm-reconstruction.jpg"
download_if_missing "https://ykim28.weebly.com/uploads/1/3/2/7/132788570/image_orig.png" "assets/img/research/mw-density-profile.png"
download_if_missing "https://ykim28.weebly.com/uploads/1/3/2/7/132788570/skillsets-260315_orig.png" "assets/img/research/skillsets.png"

backup_file "research.md"
backup_file "research/large-scale-structure.md"
backup_file "research/dark-matter-halo.md"
backup_file "research/milky-way.md"

cat > research.md <<'PAGE'
---
layout: default
title: Research
permalink: /research/
---

# Research fields

Interested in:

- Large-scale structure of the Universe
- Cosmological simulations
- Dark matter substructures
- Deep learning

Updated on: 10 March 2026.

## Thesis

Click on each image to see details.

<div class="research-grid">
  <a class="research-card" href="{{ '/research/large-scale-structure/' | relative_url }}">
    <img src="{{ '/assets/img/research/lss-sdss-pie.jpg' | relative_url }}" alt="Large-scale structure of the Universe">
    <h3>The Large Scale Structure</h3>
    <p>Testing the cosmological principle with observed, simulated, and theoretical point distributions.</p>
  </a>

  <a class="research-card" href="{{ '/research/dark-matter-halo/' | relative_url }}">
    <img src="{{ '/assets/img/research/halo-cluster.png' | relative_url }}" alt="Dark matter halo in a galaxy cluster">
    <h3>Dark Matter Halo</h3>
    <p>Measuring halo spin and testing observational signatures of secondary spin bias.</p>
  </a>

  <a class="research-card" href="{{ '/research/milky-way/' | relative_url }}">
    <img src="{{ '/assets/img/research/milky-way.webp' | relative_url }}" alt="The Milky Way">
    <h3>The Milky Way</h3>
    <p>Reconstructing the Galactic dark matter distribution with stellar dynamics and machine learning.</p>
  </a>
</div>

## Skillsets

<img class="wide-image" src="{{ '/assets/img/research/skillsets.png' | relative_url }}" alt="Scientific machine learning for astrophysics skillsets">
PAGE

cat > research/large-scale-structure.md <<'PAGE'
---
layout: default
title: The Large Scale Structure
permalink: /research/large-scale-structure/
---

# The Large Scale Structure

**Testing Cosmological Principle**

1 paper published: **Astronomy & Astrophysics**, April 2022.  
[ADS](https://ui.adsabs.harvard.edu/abs/2022A%26A...660A.139K/abstract) / [arXiv](https://arxiv.org/abs/2112.04134)

<img class="wide-image" src="{{ '/assets/img/research/lss-sdss-pie.jpg' | relative_url }}" alt="Large-scale structure from SDSS">

*Image credit: Sloan Digital Sky Survey (SDSS)-IV.*

The cosmological principle, which states that the Universe appears statistically homogeneous and isotropic on sufficiently large scales, is one of the foundations of modern cosmology. Together with the inflationary scenario, it motivates key expectations for the matter distribution: Gaussianity, adiabatic fluctuations, and scale invariance.

Many observational studies have attempted to identify a homogeneity scale, namely the scale above which the matter distribution can be regarded as homogeneous. Some studies have argued for the existence of such a scale, while others have found no clear threshold in observed galaxy catalogues.

In this work, we tested homogeneity using the SDSS-III BOSS galaxy catalogue, simulated dark matter halo catalogues from Horizon Run 3, and theoretically derived point distributions from the linear matter power spectrum assuming Planck 2018 cosmology. We adopted the Poisson distribution as the reference criterion for homogeneity at a given scale.

No homogeneity threshold was found up to scales of 300 \(h^{-1}\,\mathrm{Mpc}\). Rather than challenging modern cosmology, this result supports the interpretation that the observed matter distribution can remain highly inhomogeneous while being consistent with a cosmological model whose background geometry obeys the cosmological principle.

[Back to Research]({{ '/research/' | relative_url }})
PAGE

cat > research/dark-matter-halo.md <<'PAGE'
---
layout: default
title: Dark Matter Halo
permalink: /research/dark-matter-halo/
---

# Dark Matter Halo

**Measuring Halo Spin**

2 papers published:

- **Astrophysical Journal**, August 2022. [arXiv](https://arxiv.org/abs/2207.02389)
- **Astronomy & Astrophysics**, June 2025.

<img class="wide-image" src="{{ '/assets/img/research/halo-cluster.png' | relative_url }}" alt="Dark matter halo in a galaxy cluster">

*Image credit: NASA, ESA, E. Jullo, P. Natarajan, and J.-P. Kneib.*

Dark matter haloes cannot be directly observed, so their properties must be inferred through observable proxies. Their mass and shape can be constrained using gravitational lensing and the motions of cluster member galaxies, but their spin is much more difficult to measure directly.

Halo spin is important because it traces angular momentum, a quantity connected to the formation and evolution of structure from the early Universe. It is also relevant to secondary bias: the dependence of halo clustering on properties other than mass.

We first detected the spin of dark matter haloes by measuring the progression and regression velocities of cluster member galaxies. We found that the averaged motion of galaxies tends to align with the spin of the cluster across a wide range of galaxy distributions, and that the inferred angular momentum correlates with cluster mass and environment.

Using this observational spin proxy, we then tested the existence and magnitude of secondary spin bias. The measured amount of spin bias agrees with predictions from cosmological simulations, showing that spin bias can be probed with purely observational data.

[Back to Research]({{ '/research/' | relative_url }})
PAGE

cat > research/milky-way.md <<'PAGE'
---
layout: default
title: The Milky Way
permalink: /research/milky-way/
---

# The Milky Way

**Galactic dynamics & Machine Learning**

Working on draft.

<img class="wide-image" src="{{ '/assets/img/research/mw-dm-reconstruction.jpg' | relative_url }}" alt="Machine-learning reconstruction of dark matter distribution">

<img class="wide-image" src="{{ '/assets/img/research/mw-density-profile.png' | relative_url }}" alt="Dark matter density profile around the Milky Way">

Dark matter is a key ingredient of the standard \(\Lambda\)CDM cosmological model, contributing much more mass-energy than baryonic matter. The Milky Way, like other galaxies, resides inside an extended dark matter halo whose mass exceeds that of its luminous components and strongly influences Galactic dynamics.

Despite its importance, dark matter does not interact with electromagnetic radiation, which makes direct spatial mapping through optical observations impossible. Existing studies of the Milky Way dark matter distribution therefore rely on assumptions and theoretical models, including density profiles and dynamical constraints.

Recent machine-learning studies have shown that dark matter structure can be reconstructed from phase-space information of luminous tracers. Building on this idea, we aim to reconstruct the three-dimensional distribution of dark matter in the Milky Way using the six-dimensional phase-space information of nearby stars from Gaia.

The goal is to obtain a dark matter density map in the Solar neighbourhood and, ultimately, to infer the Milky Way mass in a way that can be compared against expectations from stellar dynamics.

[Back to Research]({{ '/research/' | relative_url }})
PAGE

CSS="assets/css/style.css"
if [[ -f "$CSS" ]]; then
  if ! grep -q "research-grid" "$CSS"; then
    cat >> "$CSS" <<'CSS'

/* Research page cards */
.research-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
  gap: 1.5rem;
  margin: 1.5rem 0 2.5rem;
}

.research-card {
  display: block;
  text-decoration: none;
  color: inherit;
  border: 1px solid #e5e7eb;
  border-radius: 14px;
  overflow: hidden;
  background: #fff;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.06);
  transition: transform 0.15s ease, box-shadow 0.15s ease;
}

.research-card:hover {
  transform: translateY(-3px);
  box-shadow: 0 8px 24px rgba(0, 0, 0, 0.11);
}

.research-card img {
  width: 100%;
  height: 180px;
  object-fit: cover;
  display: block;
}

.research-card h3 {
  margin: 1rem 1rem 0.4rem;
}

.research-card p {
  margin: 0 1rem 1rem;
  font-size: 0.95rem;
  line-height: 1.45;
  color: #555;
}

.wide-image {
  display: block;
  max-width: 100%;
  height: auto;
  margin: 1.2rem auto;
  border-radius: 8px;
}
CSS
    echo "Appended research-card CSS to $CSS"
  else
    echo "CSS already contains research-grid; skipped CSS append."
  fi
else
  echo "Warning: $CSS not found. Skipped CSS append." >&2
fi

echo "Done. Test locally with: bundle exec jekyll serve --livereload"
