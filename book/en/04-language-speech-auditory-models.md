# Chapter 4: Language, Speech, and Auditory Models

[فارسی](../fa/04-language-speech-auditory-models.md) | **English**

[← Chapter 3](03-prediction-bias-attention.md) · [Table of contents](README.md) · [PDF edition (Persian)](../../releases/computational-cognitive-science-booklet-fa.pdf)

---

## Classical Theories of Speech Processing

### Spoken-Word Recognition

Speech processing provides a useful introduction to cognitive theories. How do humans transform a continuous stream of sound into words? Auditory input is commonly noisy, incomplete, and context-dependent, yet people recognize words rapidly in everyday situations and sometimes make an accurate guess before a word is complete.

This is a cognitive question, not only an engineering problem. Word recognition reveals interactions among sensory input, lexical memory, prior expectation, and semantic context. Two classical theories are the *Cohort Model* and the *TRACE Model*.

### *Cohort Model*

The **Cohort Model** proposes that hearing the beginning of a word activates a set of possible words. As each additional speech segment arrives, incompatible candidates are removed until one remains or becomes dominant.

If a word in a restaurant begins with the Persian sound /b/, candidates such as *berenj* (rice) and *beryani* may become active. Hearing /r/ narrows the set. The process resembles autocomplete: initial letters activate suggestions, which further information progressively restricts.

#### Activation of Lexical Candidates

The mind does not wait for the word to finish. Initial segments activate compatible words, making recognition a temporally unfolding process. Competition changes as the signal continues and candidates are eliminated.

This helps explain auditory errors. Noise or words with similar beginnings may briefly activate an incorrect candidate or even cause its final selection. A good theory must account for such errors.

#### Bottom-Up Processing

In a simplified Cohort Model, information flows primarily **bottom-up**:

$$
\text{Sound} \rightarrow \text{Possible Words} \rightarrow \text{Word Selection}
$$

The auditory input determines which words activate and which are removed, highlighting the importance of word onset and temporal sound order.

#### Limitations of the Model

Humans do not always behave like simple autocomplete. Conversational context, prior expectations, the situation, lexical knowledge, and sentence meaning influence hearing. When part of a sound is missing or unclear, context may fill it in.

The Cohort Model explains an important part of recognition but not the full role of context and expectation. This motivates TRACE.

### *TRACE Model*

The **TRACE Model** is a more interactive account of speech perception in the connectionist and *interactive activation* tradition. It models simultaneous interaction among levels such as acoustic features, phonemes, and words.

Hearing is not merely movement from sound to word. Activated words and mental expectations can influence sound interpretation. Context can therefore resolve incomplete or ambiguous input.

#### Interaction Between Acoustic Data and Context

Suppose that restaurant noise obscures part of a word resembling *berenj*. The mind does not rely only on the raw signal. Knowing that the setting is a restaurant and the conversation concerns food affects the final selection. This is the role of context in an interactive model.

#### Top-Down Processing

TRACE adds **top-down** flow:

$$
\text{Expectation and Context} \rightarrow \text{Sound Interpretation}
$$

This does not eliminate acoustic input. Sensory evidence and expectation jointly shape interpretation, explaining why people can identify a word despite incomplete input.

#### Comparison with *Cohort*

- In the Cohort Model, what we hear activates and restricts candidates.
- In TRACE, both what we hear and what we expect affect selection.

TRACE is not simply a complete rejection of Cohort. Cohort emphasizes early activation of lexical candidates; TRACE extends the picture through interactions among processing levels and contextual effects.

### Validating Cognitive Theories

A cognitive theory must explain both normal behavior and errors. If someone hears a word other than *berenj*, the theory should identify the source: acoustic similarity, noise, context, expectation, lexical competition, or their combination.

Validation requires diverse participants, listening conditions, words, and contexts. A valid theory should not merely explain evidence after seeing it; it should generate predictions testable in later experiments.

The same question applies to AI models: Does a model only produce the correct output, or can its process and errors also be explained through cognitive theory?

## From Selective Attention to Voice Assistants

Selective attention distinguished *early selection* and *late selection*. Under high perceptual load, early selection chooses part of the input during initial processing and excludes the rest. Under lower load, deeper processing permits selection at a later level, possibly after meaning is understood.

How does a machine attend to speech? Here, cognitive attention is mapped onto computational speech processing, particularly *automatic speech recognition* (ASR) in always-on assistants such as Siri and Alexa, which must select relevant sounds from their environment.

### Mapping Attention Theories onto Speech Systems

Converting every environmental sound to text and semantically processing it continuously would consume enormous computation and energy. Voice assistants therefore commonly use a lightweight stage for detecting an activation cue and a heavier stage for understanding the user’s command.

Initial wake-word detection resembles early selection because meaning has not yet been analyzed. Deeper processing after detection resembles late selection.

### *Wake Words* in Humans and Machines

A voice assistant uses a *wake word* or *wake-up word*, such as *Hey Siri* or *Alexa*. It must detect this expression among environmental sounds.

A person’s own name may play a comparable role. Hearing it in a crowded setting can capture attention. An acoustic cue or particular word first activates attention, after which deeper processing begins.

### Early Selection in a Voice Assistant

At the early-selection stage, the system searches only for one or more specific words. It neither transcribes all speech nor performs natural-language understanding. It attends only to features indicating that the wake word occurred.

This stage is lightweight and energy-efficient. Initial selection can rely on the signal and its acoustic characteristics without routing every environmental sound through a complete language-understanding pipeline.

### Late Selection and Understanding Meaning

After detecting the wake word, the system activates deeper processing. It typically converts speech to text, processes the text, identifies intent, fills slots, and executes a task.

For “Buy me a ticket from Tehran to Mashhad at 8 a.m.,” the system identifies the intent as ticket purchase and extracts origin, destination, and time. It has entered *natural language understanding* (NLU).

### Why Is Speech Usually Converted to Text?

Early selection does not require complete transcription: acoustic features can directly detect a wake word. Speech-to-text becomes more important when the system must understand a command, infer intent, and extract details.

A common architecture is:

$$
\text{Speech}\rightarrow \text{Text}\rightarrow \text{NLP Task}\rightarrow \text{Action}.
$$

For a flight-booking command, ASR creates text, NLU recognizes the intent and extracts origin, destination, date, and time, and the system performs the action.

Intermediate text is not theoretically mandatory. Limited tasks may classify speech vectors or acoustic features directly. Text remains common because it has clearer structure, text NLP models often perform better, more textual training data exists, and text connects easily to databases, search engines, software services, APIs, and applications.

Text can also clarify commands for humans: word boundaries, punctuation, and spelling reduce pronunciation ambiguity. Persian words such as *hayat* (“life”) and *hayat* (“yard”) may sound similar but are distinguished in writing and context.

### Three Main Components of a Speech System

Voice assistants implicitly contain speech recognition, language understanding, and response or action execution. The present discussion emphasizes the first two.

#### *ASR*

*Automatic speech recognition* converts speech into a processable representation, usually text. After an assistant activates, the user’s speech must be represented in a form suitable for language processing.

#### *NLU*

*Natural language understanding* analyzes command meaning. Identifying ticket purchase as the intent and extracting origin, destination, and time are NLU operations.

#### *TTS*

*Text-to-speech* converts text into spoken output. After understanding a request, an assistant may answer or ask a follow-up question:

$$
\text{Text}\rightarrow \text{Speech}.
$$

Our focus is ASR and NLU rather than TTS.

## Fundamentals of Speech-Signal Processing

To understand machine speech processing, we must review human speech production and the conversion of sound into numerical features. A machine initially receives neither text nor meaning, but a raw sound wave that must become digital data and usable features.

### Human Speech Production

Human speech arises from interaction among the diaphragm, lungs, trachea, larynx, vocal folds, mouth, jaw, tongue, nose, and teeth. Diaphragm pressure drives air from the lungs; the vocal tract and articulators shape it into a sound wave.

The wave contains more than sentence meaning. It carries speaker identity, sex-related vocal characteristics, accent, emotion, properties of the vocal tract, and pitch. A shorter vocal tract, for example, generally produces a higher voice, while a longer one produces a lower voice.

### Phonemes, Vowels, and Formants

Speech can be analyzed as words, syllables, and phonemes. Phonemes include consonants and vowels. Persian is commonly described as having six vowels, although vowel inventories differ among languages.

Tongue position changes vowel production, showing that sound waves contain extensive physical information before becoming text.

Speech spectrograms often contain dark bands called *formants*, commonly labeled F1, F2, F3, and F4. These regions concentrate frequency energy and provide information about speech quality and distinctions.

Formants are associated with frequency ranges, not merely numbered by visual order. If no band appears in the F1 range and the first visible dark band lies in the F3 range, it remains F3 rather than being renamed F1.

### The Raw Sound Wave

A machine initially receives a raw sound wave, displayed with time on the horizontal axis and amplitude on the vertical axis. Louder sound produces greater displacement from the horizontal axis.

Sound also has frequency. Faster oscillation corresponds to higher frequency and slower oscillation to lower frequency. Machines require numbers and vectors rather than a continuous analog wave, so the first step is digitization.

### Sampling and the Nyquist Rule

Sampling measures the wave’s amplitude at successive moments. Higher sampling rates preserve the wave more accurately; low rates may miss important changes.

The Nyquist rule requires a sampling rate at least twice the signal’s highest frequency. A 400 Hz signal needs at least 800 samples per second, providing at least two samples per cycle.

Traditional telephone speech occupies a narrow band of roughly 300–3400 Hz and standards such as G.711 sample at 8000 samples per second. This is consistent with representing components up to approximately 4000 Hz.

![Converting an analog signal into digital samples](../../assets/figures/analog-to-digital-sampling.png)

*Figure 4-1 — Converting an analog signal into a sampled digital signal; sample points must be dense enough to preserve the wave’s original form.*

### Framing, Windowing, and Overlap

After sampling, audio becomes a sequence of numbers, but processing the entire wave at once is unsuitable. Just as text is divided into sentences, words, or tokens, sound is divided into smaller *frames*.

A *window* selects successive regions of the wave. Abrupt rectangular boundaries can introduce artifacts, so speech processing often uses a *Hamming window*, which weights the frame center more heavily and reduces abrupt boundary effects.

Frames normally overlap to preserve continuity and retain changes occurring at boundaries. Without overlap, an important transition exactly between frames might be lost.

### Fourier Transform and the Frequency Spectrum

The time-domain signal shows amplitude at each moment, but sound combines many frequencies. The *Fourier transform* decomposes the wave, revealing its frequency components and the strength of each.

### Spectrograms

Applying the Fourier transform across audio frames produces a *spectrogram*: frequency changes over time. One axis represents time, the other frequency, while color or darkness represents energy.

Spectrograms expose acoustic patterns without semantic processing. Speech differs from breathing or noise, permitting tasks such as speech/non-speech discrimination and noise removal without transcription.

![An example speech spectrogram](../../assets/figures/speech-spectrogram.png)

*Figure 4-2 — A speech spectrogram: the horizontal axis shows time, the vertical axis frequency, and color intensity the energy in each frequency band; breathing and speech form different patterns.*

Male voices are generally lower and female voices generally higher, a difference visible in energy distribution. Lower voices concentrate more energy at low frequencies and higher voices at higher frequencies.

A wake word also has a characteristic spectrographic pattern. Different speakers produce variations, but instances can still belong to a similar acoustic category. Spectrograms and formants can therefore support wake-word classification.

### *MFCC*

Spectrograms are images, while many computational models require numerical vectors. **Mel-frequency cepstral coefficients** (MFCCs) extract speech-relevant numerical features.

The general pipeline is:

1. Receive a sound wave.
2. Sample it.
3. Divide it into frames.
4. Apply a window.
5. Use a Fourier transform to construct a spectrogram.
6. Pass the spectrum through a Mel filter bank.
7. Extract MFCCs.

#### *Mel Scale*

The Mel scale better approximates human frequency perception. Human hearing distinguishes low-frequency changes more precisely and is less sensitive to small high-frequency differences. The Mel representation reflects this perceptual nonlinearity.

#### *Mel Filter Bank*

An MFCC pipeline applies overlapping triangular filters to the frequency spectrum. Filters are denser at low frequencies and wider and sparser at high frequencies, preserving greater low-frequency resolution in accordance with human hearing.

![The Mel filter bank](../../assets/figures/mel-filter-bank.png)

*Figure 4-3 — Overlapping triangular filters in a Mel filter bank; energy in each frequency band becomes a feature used to calculate MFCCs.*

#### Numerical Output and Classification

Further processing converts the filter-bank output into numerical coefficients, producing a matrix or vector sequence suitable for machine learning.

Suppose we want to classify COVID status from voice. A dataset might contain coughs, breathing, or ordinary speech from affected and unaffected individuals. MFCCs are extracted from every recording.

Similarity and correlation can test whether the two groups differ. Highly similar or correlated MFCCs will not separate them well. Low correlation between cough features from affected and unaffected groups suggests that MFCCs may be informative for classification.

The complete path is raw sound, sampling, framing, overlapping windows, Fourier transform, spectrogram, formant analysis, Mel filter bank, MFCC extraction, and classification. For machine early selection, acoustic features can be used without understanding meaning.

## Self-Supervised Speech Models

Early selection operates on physical and acoustic features without meaning, transcription, or semantic analysis. Late selection enters meaning, often converting speech to text for NLP tasks.

Text is not the only possible model input. A system can receive text, a spectrogram, MFCCs, a raw waveform, or CNN-extracted vectors. It may move directly from an acoustic representation to a semantic one, although speech-to-text remains a central route.

### Deterministic and Learned Feature Extraction

Waveforms, spectrograms, and MFCCs are common speech representations. Producing a spectrogram or MFCC is normally mathematical and *deterministic*: it has no training phase, follows fixed formulas, and returns the same output for the same input.

Alternatively, a neural network can learn features from the raw wave:

$$
\text{Raw Waveform}\rightarrow \text{CNN}\rightarrow \text{Learned Features}.
$$

Initially random CNN weights are updated during training until filters and kernels discover useful features. The CNN may receive a raw waveform or a spectrogram. With scarce data or a difficult task, preprocessing can supply a better initial representation.

### *Self-Supervised Learning*

Self-supervised speech models such as *wav2vec* and *HuBERT* address the abundance of raw audio and scarcity of labeled or accurately transcribed recordings.

The model constructs a training task from raw data. BERT masks part of a sentence and predicts the hidden word from context. Speech models similarly mask audio frames and predict them from surrounding frames:

1. Supply large quantities of raw audio.
2. Mask portions of it.
3. Predict the hidden portions from context.
4. Define a loss function.
5. Compare prediction with the actual value.
6. Update weights through backpropagation.
7. Continue until loss decreases and performance improves.

Predicting the hidden frame is a means rather than the final goal. Pretraining learns a useful speech representation or embedding that can later support speech-to-text, classification, speaker recognition, intent detection, and other tasks.

### *wav2vec 2.0*

wav2vec normally takes a raw waveform rather than a spectrogram:

$$
\begin{aligned}
\text{Raw Waveform} &\rightarrow \text{CNN Feature Encoder}\\
&\rightarrow \text{Transformer Encoder}\\
&\rightarrow \text{Contextual Representations}.
\end{aligned}
$$

#### Raw Input

The input is a numerical sequence representing the sound waveform. Other architectures may first calculate a spectrogram or MFCC, but wav2vec typically receives the wave directly.

#### *CNN Feature Encoder*

The waveform enters a CNN that extracts features. Different filters detect different patterns. Early layers represent lower-level properties; deeper layers construct more abstract, meaning-related features.

The learned quantities are the values within filters and kernels. Randomly initialized values change through backpropagation until they capture important patterns in audio data.

Deeper convolutional networks often use more filters and increasingly abstract representations. Dimensionality reduction compresses important information, reduces complexity, and can help limit overfitting. The CNN ultimately produces a vector or sequence of feature vectors.

#### *Transformer Encoder*

CNN output enters a Transformer encoder, which turns local features into context-dependent representations. A frame’s relationship with preceding and following frames matters, and self-attention captures these relations.

This component is an encoder rather than a decoder or encoder–decoder because it is not yet generating an output sequence. Its task is to understand and encode its input.

#### *Masking*

Some frames are masked and predicted from context. Text models choose hidden words from a finite vocabulary, but audio frames occupy a continuous space with no perfectly discrete word-like boundaries. A speech model therefore needs an analogue of vocabulary.

#### *Quantization* and the *Codebook*

*Quantization* maps a continuous representation into a finite discrete one. A *codebook* acts like a dictionary of acoustic units, containing representative vectors. Each audio vector is assigned to a nearby codebook vector, replacing an infinite continuous space with a limited set of units.

The analogy can be hierarchical: “I am in Iran,” then “in Tehran,” then “in a particular district.” Quantization may likewise have several levels, and codebook values can be randomly initialized and learned.

Quantization does not replace the Transformer’s main continuous path. CNN output enters the Transformer, which operates on rich continuous representations. Quantization is mainly used to construct the training target and calculate loss. Quantizing too early would discard acoustic information.

#### *Contrastive Loss*

Contrastive learning pulls the contextual representation of a masked segment toward the correct quantized target and pushes it away from negative samples:

$$
\text{Correct Quantized Vector}\rightarrow \text{Closer},\qquad
\text{Negative Samples}\rightarrow \text{Farther Away}.
$$

Quantization makes the target more discrete and stable while allowing model input to remain rich and continuous.

#### *Pretraining* and *Fine-Tuning*

Pretraining learns acoustic structure from raw speech and constructs a strong representation. Fine-tuning then uses a smaller amount of labeled data to adapt all or part of the model to speech-to-text or classification:

$$
\begin{aligned}
\text{Large Raw Speech Dataset} &\rightarrow
\text{Self-Supervised Pretraining}\\
&\rightarrow \text{Speech Representations}\\
&\rightarrow \text{Fine-Tuning on Labeled Data}.
\end{aligned}
$$

In summary, wav2vec 2.0 takes raw audio; a CNN compresses it into features; some frames are masked; a Transformer encoder constructs contextual representations; selected outputs are quantized into discrete acoustic targets; contrastive loss distinguishes the correct target from negatives; and labeled data fine-tune the pretrained model.

![The wav2vec 2.0 architecture](../../assets/figures/wav2vec-2-architecture.png)

*Figure 4-4 — wav2vec 2.0: raw audio becomes latent speech representations, some are masked, a Transformer constructs contextual representations, and contrastive loss separates the correct target from negative samples.*

## *Whisper* and the *Encoder–Decoder* Architecture

wav2vec learns from abundant unlabeled audio. *Whisper* represents a different approach: supervised training on paired audio and text.

### *Whisper* Input and Output

Whisper receives audio and produces text. Each training recording has a corresponding transcript. The described training collection contains roughly 680,000 hours of paired multilingual audio and text, including varied accents and relatively noisy real-world environments. Background sound, ambient conversation, and media audio contribute to robustness across noise, language, and accent.

### Why an *Encoder–Decoder* Architecture?

In wav2vec, the main goal is an informative audio representation, so the central architecture is an encoder. Whisper must both understand speech and generate corresponding text:

$$
\begin{aligned}
\text{Speech Understanding} &\rightarrow \text{Audio Representation}\\
\text{Text Generation} &\rightarrow \text{Transcript}.
\end{aligned}
$$

An encoder–decoder is therefore appropriate. The encoder converts sound into a representation; the decoder generates text progressively from it.

### The *Encoder*

The encoder transforms audio input into a semantic representation or embedding. Auditory models may receive waveforms, spectrograms, Mel spectrograms, or MFCCs. Whisper primarily uses a Mel spectrogram.

#### Unmasked *Self-Attention*

The encoder uses self-attention to relate audio frames. Its attention is not causally masked because the complete recording is available from the beginning. Every frame can be considered in relation to every other frame. This differs from the decoder, which produces text sequentially without future tokens.

#### Contextualized Audio Representations

Encoder output is a contextualized embedding: each audio segment is represented in relation to the entire recording. In a spoken phrase such as “natural language processing,” the segment corresponding to “language” should be interpreted in relation to “natural” and “processing.”

### The *Decoder*

The decoder generates the transcript from the encoder’s audio representation. Generation is autoregressive: tokens are produced one at a time, and each new output becomes part of the next step’s input.

#### *Masked Self-Attention*

The decoder uses masked self-attention so a token cannot access future tokens. When only “natural” has been generated, the decoder must not already see that “language” follows.

Part of the attention matrix is masked, permitting attention only to the current and previous tokens:

$$
\begin{aligned}
\text{Encoder} &: \text{Full Self-Attention over Audio Frames}\\
\text{Decoder} &: \text{Masked Self-Attention over Generated Text}.
\end{aligned}
$$

![The Transformer encoder–decoder architecture](../../assets/figures/transformer-encoder-decoder.png)

*Figure 4-5 — A general Transformer encoder–decoder: the encoder constructs contextual input representations; the decoder uses masked self-attention and attention to encoder output to generate tokens progressively.*

#### *Cross-Attention*

Cross-attention connects the encoder’s audio representation with the text generated so far. To choose the next token, the decoder considers both its current text and the original audio.

#### Autoregressive Text Generation

Generation is a sequence of textual decisions. Starting from a start token, the model produces one word, then uses it to generate the next, continuing to the end:

$$
\text{Start}\rightarrow
\text{Natural}\rightarrow
\text{Natural Language}\rightarrow
\text{Natural Language Processing}.
$$

Whisper can thus be summarized as follows: the encoder builds a contextual audio representation from a Mel spectrogram; the decoder applies masked self-attention to generated text; cross-attention consults encoder output; and the next text token is selected.

### Connecting Auditory Models with Selective Attention

The goal is to use cognitive theories to inspire better computational models. Early selection, late selection, and perceptual load suggest that a voice assistant could estimate environmental perceptual load and switch between lightweight and intensive processing.

Under high perceptual load:

$$
\text{High Perceptual Load}\rightarrow \text{Early Selection}
$$

the system would perform only lightweight physical-feature processing. Under low load:

$$
\text{Low Perceptual Load}\rightarrow \text{Late Selection}
$$

it could enter semantic processing, speech-to-text, and NLU.

This matters because engineering always balances accuracy against computational cost. The aim is to connect cognitive theory to computation without losing either the cognitive goal or necessary technical detail.

Selective attention and perceptual load have not yet been deeply incorporated into many current auditory models. A cognitively grounded assistant would need explicit mechanisms or policies for perceptual-load thresholds, early selection, and late selection.

### A Brief Return to *Predictive Coding* and *GANs*

Predictive coding and GANs both involve production and evaluation. A GAN generator creates synthetic data, and a discriminator distinguishes real from generated samples. Predictive coding continually generates predictions, compares them with reality, calculates prediction error, and corrects itself.

The important difference concerns error. Conventional networks usually calculate a global output loss and distribute it through backpropagation. Predictive coding proposes more local errors, where each level or neuron compares its prediction with its input and performs a local correction. This separates brain-inspired proposals from standard neural networks.

### Neuromorphic Processors

Today’s AI ecosystem is centered on GPUs, gradients, and backpropagation. *Neuromorphic* hardware instead attempts to emulate aspects of neural computation: neurons, spikes, synapses, and local processing.

These processors have not replaced general-purpose GPUs because migration is rational only when a substantial practical advantage is clear. Nevertheless, studying or virtually implementing a neuromorphic processor is a possible research direction, provided that its scope is defined precisely and feasibly.

---

[← Chapter 3](03-prediction-bias-attention.md) · [Table of contents](README.md) · [Next chapter: Reward, Reinforcement Learning, and Decision-Making →](05-reward-rl-decision-making.md)
