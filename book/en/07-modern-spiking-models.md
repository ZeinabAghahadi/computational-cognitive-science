# Chapter 7: Modern Spiking Models

[فارسی](../fa/07-modern-spiking-models.md) | **English**

[← Chapter 6](06-spiking-neural-networks.md) · [Table of contents](README.md) · [PDF edition (Persian)](../../releases/computational-cognitive-science-booklet-fa.pdf)

---

## *Spiking Transformer* and *SpikeFormer*

### Why Put a *Transformer* in an *SNN*?

Transformers are powerful because attention relates distant elements and builds contextual representations. SNNs are attractive because spikes are sparse, event-driven, temporal, and potentially energy efficient. A Spiking Transformer attempts to combine these strengths: Transformer-style global relations with spiking computation.

The difficulty is that a conventional Transformer uses continuous vectors, dot products, softmax, and dense matrix operations, whereas an SNN uses binary events and membrane dynamics. The central design question is how to translate every Transformer component into a spiking-compatible operation without losing the useful representation.

### The Input-Encoding Problem

An SNN cannot directly consume an ordinary continuous image or token embedding. The input must be encoded as spikes over time.

#### Image Encoding

Pixels can be converted into spike trains by rate coding, temporal coding, or direct binary/event encoding. In rate coding, brighter pixels generate more spikes over a time window; in temporal coding, intensity can determine when the first spike occurs. A representation may be written as:

$$
X\rightarrow S(t),\qquad S(t)\in\{0,1\}
$$

The number of time steps, coding rule, and preservation of spatial structure all affect accuracy and energy.

#### A Computational Point About Encoding

Encoding itself costs computation. A method that creates many spikes may make the later SNN expensive, while overly sparse coding may discard information. The goal is not merely to convert values into zeros and ones, but to preserve task-relevant information with few events.

#### Text Encoding

Text first becomes tokens and then continuous embeddings. These embeddings must be transformed into spike trains. A simple rate code repeats or samples the embedding across time; temporal codes assign information to spike timing. If $E$ is an embedding, a spike representation can be described as:

$$
E\rightarrow S_1,S_2,\ldots,S_T
$$

The time dimension is therefore part of the model input rather than an incidental implementation detail.

#### Encoding with *Integration*

An LIF neuron integrates input over time:

$$
V[t+1]=\lambda V[t]+I[t]
$$

and emits a spike when:

$$
S[t+1]=\mathbb{1}[V[t+1]>\theta].
$$

The membrane can accumulate a continuous embedding across several steps and express it as a sparse temporal sequence. This is one reason time steps matter in Spiking Transformers.

### *Attention* in Spiking Networks

Attention must be redefined because conventional attention uses continuous $Q$, $K$, and $V$ vectors and softmax. A spiking attention mechanism receives spike-based representations and tries to compute useful relations while remaining event-driven.

#### Spiking *Query*, *Key*, and *Value*

Spiking representations are projected into query, key, and value channels:

$$
Q=S W_Q,\qquad K=S W_K,\qquad V=S W_V
$$

Unlike ordinary vectors, these quantities are temporal spike sequences. Accumulation across time can approximate the evidence needed to compare tokens or image patches.

#### Removing *Softmax*

Softmax is expensive and produces dense continuous weights. Spiking designs may replace it with thresholding, normalization, binary attention, or direct accumulation. A simplified relation is:

$$
A=QK^T
$$

followed by a spiking or threshold operation rather than dense softmax. Removing softmax can reduce cost but may also reduce precision and stability.

#### Reordering Multiplications and Reducing Complexity

Associativity allows a computation to be rearranged:

$$
(QK^T)V=Q(K^TV).
$$

Depending on dimensions and sparsity, the second order can be cheaper. In an SNN, event sparsity can further reduce the number of effective operations. The exact benefit depends on sequence length, spike rate, hardware, and implementation.

#### Interpreting Spiking *Attention*

Spiking attention can be interpreted as selecting which events and temporal traces should influence the current representation. A high spike coincidence or accumulated membrane response indicates a stronger relation. It is not identical to human selective attention, but it provides an event-based computational analogue.

### Overall *SpikeFormer* Architecture

A SpikeFormer commonly contains an input encoder, spiking linear projections, spiking attention, LIF neurons, a spiking MLP, residual connections, and a readout over time. Information moves through several time steps, with each layer maintaining membrane state.

![Overall SpikeFormer architecture](../../assets/figures/spikeformer-architecture.png)

*Figure 7-1 — A schematic SpikeFormer: encoded inputs pass through spiking attention, LIF neurons, MLP blocks, residual paths, and a temporal readout.*

The output can be accumulated over time:

$$
O=\sum_{t=1}^{T}S[t]
$$

or decoded from spike count and timing. The choice of readout affects accuracy and latency.

### The Role of *LIF*

LIF neurons supply temporal memory, thresholding, leakage, reset, and event generation. They allow the same architecture to respond differently to an early or late event and prevent the network from being a simple static binary Transformer.

### *MLP* in a Spiking *Transformer*

The feed-forward MLP remains useful, but its linear layers and nonlinearities are implemented with spiking neurons:

$$
H[t]=\operatorname{LIF}(S[t]W_1),\qquad O[t]=\operatorname{LIF}(H[t]W_2).
$$

The MLP processes each token or patch, while attention communicates across them. Time integration and sparsity change both its computation and representation.

### *Residual Connection*

Residual paths help preserve information and stabilize deep learning:

$$
Y[t]=S[t]+F(S[t]).
$$

In a spiking model, the sum may be implemented through membrane accumulation or compatible spike addition. Residual connections prevent useful signals from disappearing through many thresholding layers.

### Summary of *SpikeFormer*

SpikeFormer keeps the Transformer’s high-level organization but replaces dense continuous operations with temporal, sparse, and threshold-based computation. Its success depends on encoding, time steps, attention approximation, LIF dynamics, residual design, and hardware support.

![Classical and spiking attention](../../assets/figures/classic-vs-spiking-attention.png)

*Figure 7-2 — A conceptual comparison between dense classical attention and sparse event-based spiking attention.*

## *SpikeBERT* and Knowledge Distillation

### Why Is Text Difficult for a Spiking Model?

#### Information Density in Text

Text embeddings contain many continuous dimensions, while spikes are sparse binary events. Direct conversion can lose subtle lexical and semantic information. A useful code must preserve the information needed for the task without producing an excessive number of spikes.

#### Long-Term Dependencies

Language depends on relations across distant tokens. A spiking model must preserve useful information across time steps and layers while membrane leakage and thresholding continually compress it.

#### The Symbolic and Abstract Nature of Language

Language is discrete, compositional, and abstract. Unlike a pixel, a token does not have a simple physical intensity. A model must convert learned semantic geometry into an event-based representation without destroying relationships among words and sentences.

### *Knowledge Distillation*

Knowledge distillation trains a smaller or different *student* model to imitate a capable *teacher*. BERT can act as a continuous teacher and SpikeBERT as the spiking student. The student learns from labels and from teacher representations or probability distributions.

### *Teacher* and *Student*

The teacher produces a continuous hidden representation $H_T$ and logits $z_T$. The student produces $H_S$ and $z_S$. Distillation can combine task loss with representation and output losses:

$$
\mathcal{L}=\mathcal{L}_{\text{task}}+\lambda_f\mathcal{L}_{\text{feature}}+\lambda_d\mathcal{L}_{\text{distill}}.
$$

The teacher is generally frozen or updated separately; the student learns spike encodings and weights.

### Converting Continuous *Embeddings* to Spikes

An embedding can be transformed using rate, temporal, threshold, or integrate-and-fire coding. Over $T$ steps, a student receives:

$$
S[t]=\mathbb{1}[V[t]>\theta].
$$

The student’s temporal average or accumulated membrane can approximate the teacher’s continuous activation:

$$
\bar{S}=\frac{1}{T}\sum_{t=1}^{T}S[t].
$$

Increasing $T$ improves representational resolution but increases latency and computation.

### Returning Spikes to a Continuous Representation

Downstream losses often require a continuous vector. Spike counts, temporal averages, membrane values, or a learned readout can produce one:

$$
H_S=\operatorname{Readout}(S[1],\ldots,S[T]).
$$

The readout is not a claim that the model has stopped being spiking; it is a training or decision interface.

### *Projection* and Representation Alignment

Teacher and student representations may have different dimensions. A projection maps them into a common space:

$$
\tilde{H}_S=H_SW_P.
$$

The goal is to make the student’s geometry resemble the teacher’s while retaining spike-based internal computation.

### *Feature Loss*

Feature loss can use mean squared error or cosine distance:

$$
\mathcal{L}_{\text{feature}}=\|\tilde{H}_S-H_T\|_2^2
$$

or:

$$
\mathcal{L}_{\text{cos}}=1-\frac{\tilde{H}_S\cdot H_T}{\|\tilde{H}_S\|\|H_T\|}.
$$

Feature alignment transfers internal information beyond final labels.

### Two Training Stages in *SpikeBERT*

#### General Knowledge Transfer

The first stage transfers broad language knowledge from a pretrained teacher. The student learns contextual representations, token relations, and useful intermediate features.

#### Task-Specific Training

The second stage adapts the student to a task such as classification, sentiment analysis, or natural-language inference. The task head and selected student weights are fine-tuned with labeled data.

### *Cross-Entropy Loss*

For a classification target $y$ and predicted probability $p$:

$$
\mathcal{L}_{\text{CE}}=-\sum_c y_c\log p_c.
$$

With teacher soft targets, temperature $\tau$ softens logits:

$$
p_c=\operatorname{softmax}(z_c/\tau).
$$

Higher temperature exposes relative similarities among classes; the task loss preserves the correct label.

![Knowledge distillation from BERT to SpikeBERT](../../assets/figures/spikebert-knowledge-distillation.png)

*Figure 7-3 — Distilling knowledge from a continuous BERT teacher into a spike-based SpikeBERT student through representations and task outputs.*

### The Role of *Time Step*

Time steps determine how long the SNN integrates evidence:

$$
S[1],S[2],\ldots,S[T].
$$

#### Time Steps and Accuracy

More steps usually provide finer temporal resolution and more opportunities for a neuron to cross threshold. Accuracy can improve until the representation saturates.

#### Limitations of Too Many Time Steps

Large $T$ increases latency, memory, and energy. A model can become accurate but cease to be efficient. The practical goal is the smallest number of steps that preserves acceptable performance.

![Effect of time-step count on model accuracy](../../assets/figures/time-steps-and-model-accuracy.png)

*Figure 7-4 — Accuracy as a function of simulation time steps: additional steps can help before cost and diminishing returns dominate.*

### A Brief Return to the *Spiking Attention* Test

Spiking attention should be evaluated not only by accuracy but also by event count, latency, energy, robustness to sparse input, and preservation of long-range relations. A model that matches a teacher’s output while generating dense spikes may not deliver the expected neuromorphic advantage.

## *SpikeGPT*, *RWKV*, and Spiking Text Generation

### Classification versus Generation

Classification requires a final decision among labels. The model may aggregate representations and emit one output. Generation must produce a sequence one token at a time; every output becomes part of the next input. This autoregressive loop makes spiking language generation more difficult.

$$
p(x_t\mid x_{<t})
$$

must be evaluated repeatedly until an end token is produced.

![SpikeGPT generative training and classification use](../../assets/figures/spikegpt-training-and-classification.png)

*Figure 7-5 — Generative training and classification use of SpikeGPT: one model can learn sequence prediction and later provide representations for a task head.*

### Why Is Direct Transformer Conversion Not Enough?

A dense Transformer assumes continuous activations, softmax attention, and parallel access to a sequence. Directly replacing activations with spikes can cause information loss, unstable gradients, and expensive time-step simulation. Generation also requires a recurrent state or efficient causal memory.

### Similarity Between *GPT* and *RNN*

GPT is Transformer-based but autoregressive: it processes a prefix and predicts the next token. This sequential interface resembles an RNN even though its internal attention is different. The similarity motivates recurrent alternatives such as RWKV.

### The Problem with Classical *RNNs*

RNNs maintain a hidden state:

$$
h_t=f(x_t,h_{t-1}).
$$

They process sequences efficiently but can suffer from vanishing or exploding gradients, limited parallelism, and difficulty retaining very long dependencies.

### The *RWKV* Architecture

RWKV combines recurrent state updates with key–value and attention-like operations.

#### *Receptance*

Receptance decides how much of the current or previous information should enter the state. It acts like a learned gate.

#### *Weight* or Forgetting Factor

The weight controls decay of old information. A large decay retains history; a small retention factor forgets it quickly.

#### *Key*

The key identifies the type or relevance of incoming information.

#### *Value*

The value is the content written into the state when the key is relevant.

### The *State* Idea in *RWKV*

Instead of retaining every previous token in a full attention matrix, RWKV compresses history into a recurrent state. A generic update is:

$$
s_t=\lambda_t s_{t-1}+k_t v_t
$$

and the output is read using a receptance gate:

$$
y_t=r_t\odot s_t.
$$

This offers linear-time sequential processing and a natural interface for a spiking implementation.

### *Time Step* in *RWKV* versus *SNN*

An RWKV time index normally corresponds to a token step. An SNN time step can represent repeated integration of one token or event. These notions need not be identical: one token may require several spiking simulation steps, while a recurrent state update processes it once.

### Overall *SpikeGPT* Architecture

SpikeGPT combines a language-modeling objective with spiking or recurrent event-based blocks. Token embeddings enter temporal spike encoders, pass through time-mix and channel-mix operations, and produce next-token logits.

![Overall SpikeGPT architecture](../../assets/figures/spikegpt-architecture.png)

*Figure 7-6 — Overall SpikeGPT architecture: token information is processed through temporal mixing, channel mixing, spiking feed-forward blocks, and an autoregressive output head.*

#### *Time-Mix*

Time-mix combines current and previous state information. It supplies a learned balance between new token input and history, analogous to a recurrent attention mechanism.

#### *Channel-Mix*

Channel-mix transforms features within each token state, much like a feed-forward layer. It mixes representation dimensions rather than positions in the sequence.

#### *R-FFN*

The recurrent feed-forward network (R-FFN) applies these operations while maintaining state across tokens and time. Spiking nonlinearities can make its internal events sparse.

### Continuity of Intermediate Computation and Spiking Behavior

A model can have binary spike outputs while retaining continuous membrane state internally. This distinction is important: spikes carry events between operations, while membrane variables integrate information and provide temporal continuity.

### Energy Use and the Limits of Running SNNs on GPUs

SNNs promise low event-driven energy, but ordinary GPUs are optimized for dense continuous matrix multiplication. Simulating many time steps on a GPU can introduce overhead and erase the theoretical advantage.

Energy should therefore be measured on appropriate hardware and include encoding, memory movement, time steps, and readout—not only the number of multiply–accumulate operations. Sparse neuromorphic hardware may exploit event sparsity more effectively.

$$
E_{\text{total}}\approx T(E_{\text{step}})+E_{\text{memory}}+E_{\text{encoding}}+E_{\text{readout}}.
$$

The important comparison is not “spikes are always cheaper,” but whether a complete deployed system achieves an acceptable accuracy–latency–energy trade-off.

![Energy consumption of Vanilla GPT and SpikeGPT](../../assets/figures/gpt-vs-spikegpt-energy-use.png)

*Figure 7-7 — A conceptual comparison of energy use in Vanilla GPT and SpikeGPT; the actual advantage depends on sparsity, time steps, hardware, and implementation.*

---

[← Chapter 6](06-spiking-neural-networks.md) · [Table of contents](README.md) · [Next chapter: Brain–Model Alignment and Reasoning →](08-brain-alignment-reasoning.md)
