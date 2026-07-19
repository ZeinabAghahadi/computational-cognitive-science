# Computational Cognitive Science Booklet

A Persian-language course booklet that connects foundational ideas in cognitive science with contemporary computational models of language, speech, decision-making, spiking neural networks, and brain–model alignment.

The booklet was prepared for the **Computational Cognitive Science** course at the Iran University of Science and Technology (IUST).

## Booklet details

- **Author:** Dr. Zeinab Aghahadi
- **Affiliation:** School of Computer Engineering, Iran University of Science and Technology
- **Edition:** Version 1.0, Spring 2026
- **Language:** Persian (with an English title page and abstract)
- **Format:** A4, 164 pages

The ready-to-read PDF is available at [computational_cognitive_science_booklet.pdf](computational_cognitive_science_booklet.pdf).

## Contents

1. Foundations of computational cognitive science
2. Cognitive architectures, memory, and cognitive load
3. Prediction, bias, and attention
4. Computational models of language, speech, and auditory processing
5. Reward, reinforcement learning, and decision-making
6. Spiking neural networks and neuromorphic computing
7. Modern spiking models
8. Brain–model alignment and reasoning

## Repository structure

```text
.
├── chapters/      # LaTeX source for the eight chapters
├── figures/       # Figures referenced by the booklet
├── fonts/         # Fonts required to typeset Persian and Latin text
├── computational_cognitive_science_booklet.tex
├── computational_cognitive_science_booklet.pdf
├── Makefile
└── README.md
```

## Building from source

The document must be compiled with XeLaTeX because it uses `xepersian` and bundled Persian fonts. A reasonably complete TeX Live or MacTeX installation is recommended.

```bash
make
```

Alternatively, run:

```bash
latexmk -xelatex -interaction=nonstopmode -halt-on-error computational_cognitive_science_booklet.tex
```

To remove generated LaTeX build files:

```bash
make clean
```

## Rights and reuse

Copyright © 2026 Zeinab Aghahadi. No open-source or open-content license is granted for the booklet text by this repository. Please contact the author before redistributing, adapting, or reusing it beyond the permission you have received. Figures, fonts, and other third-party materials remain subject to their respective owners' terms.
