# Computational Cognitive Science Booklet

[فارسی](README.md) | **English**

A bilingual Markdown course booklet that connects foundational ideas in cognitive science with contemporary computational models of language, speech, decision-making, spiking neural networks, and brain–model alignment. The typeset PDF edition is currently in Persian.

The booklet was prepared for the **Computational Cognitive Science** course at the Iran University of Science and Technology (IUST).

## Read the booklet

- [Persian Markdown edition](book/fa/README.md)
- [English Markdown edition](book/en/README.md)
- [Persian PDF edition](releases/computational-cognitive-science-booklet-fa.pdf)
- [LaTeX source](latex/main.tex)

## Booklet details

- **Author:** Dr. Zeinab Aghahadi
- **Affiliation:** School of Computer Engineering, Iran University of Science and Technology
- **Edition:** Version 1.0, Spring 2026
- **Language:** Persian and English Markdown editions; Persian PDF with an English title page and abstract
- **Format:** A4, 164 pages

## Contents

1. [Foundations of computational cognitive science](book/en/01-foundations.md)
2. [Cognitive architectures, memory, and cognitive load](book/en/02-architecture-memory-load.md)
3. [Prediction, bias, and attention](book/en/03-prediction-bias-attention.md)
4. [Computational models of language, speech, and auditory processing](book/en/04-language-speech-auditory-models.md)
5. [Reward, reinforcement learning, and decision-making](book/en/05-reward-rl-decision-making.md)
6. [Spiking neural networks and neuromorphic computing](book/en/06-spiking-neural-networks.md)
7. [Modern spiking models](book/en/07-modern-spiking-models.md)
8. [Brain–model alignment and reasoning](book/en/08-brain-alignment-reasoning.md)

## Repository structure

```text
.
├── assets/        # Shared figures and fonts
├── book/
│   ├── fa/        # Persian Markdown edition
│   └── en/        # English Markdown edition
├── latex/         # LaTeX source
├── releases/      # Published PDF editions
├── Makefile
├── README.md      # Persian landing page
└── README.en.md   # English landing page
```

## Building from source

The document must be compiled with XeLaTeX because it uses `xepersian` and bundled Persian fonts. A reasonably complete TeX Live or MacTeX installation is recommended.

```bash
make
```

To remove generated LaTeX build files:

```bash
make clean
```
