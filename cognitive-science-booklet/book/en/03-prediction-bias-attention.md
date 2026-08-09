# Chapter 3: Prediction, Bias, and Attention

[فارسی](../fa/03-prediction-bias-attention.md) | **English**

[← Chapter 2](02-architecture-memory-load.md) · [Table of contents](README.md) · [PDF edition (Persian)](../../releases/computational-cognitive-science-booklet-fa.pdf)

---

## Cognitive Bias

Computational cognitive science is not merely a review of theories; selecting the problem, model, and application is itself part of the scientific work. This booklet uses Transformers and large language models as its principal case study. After cognitive architecture, cognitive-load theory, working-memory limitations, attention, and strategies for managing load, we now turn to another characteristic of the human mind: **cognitive bias**.

### Defining *Cognitive Bias*

A **cognitive bias** is a systematic deviation in thinking, reasoning, judgment, or decision-making that leads to an incorrect, inaccurate, or suboptimal conclusion. It is not usually just a raw emotional reaction. People often give reasons for their decisions, but the reasoning itself—and the weighting of evidence—has been affected by bias.

Someone may say, “I believe this report because it agrees with several of my previous experiences.” This sounds rational, but the reasoning is biased if the person noticed only consistent experiences and excluded conflicting ones. Cognitive bias usually arises along the information-processing path: evidence selection, weighting, interpretation, and the final decision.

### Major Examples of Bias

Three widely studied examples are confirmation bias, anchoring bias, and the halo effect. Each can be investigated both in humans and in the outputs of language models.

#### *Confirmation Bias*

**Confirmation bias** occurs when prior belief becomes the principal criterion for seeking and interpreting information. People notice, select, or take more seriously evidence that confirms what they already believe, while assigning less weight to conflicting evidence.

In modeling terms, a person has a prior mental model that new data could update, but the update either fails or remains very weak. Confirmation bias is not confined to political or social beliefs; it can affect reading papers, analyzing data, selecting hypotheses, and reviewing research.

#### *Anchoring Bias*

**Anchoring bias** occurs when the first fact, number, impression, or frame presented receives excessive weight in subsequent judgment. After this anchor forms, later information may be interpreted around the same point.

“Firsts” are important here: a first meeting, first impression, the first news heard about a subject, or the first number proposed in a negotiation. Each can establish the starting point for judgment even when sufficient corrective information later becomes available.

#### *Halo Effect*

The **halo effect** generalizes one positive or salient characteristic of a person to unrelated characteristics. Someone with a polished appearance, social charm, or substantial fame may automatically be judged more intelligent, logical, ethical, or trustworthy, although these properties do not necessarily imply one another.

Celebrity can partly be understood through this effect. A person may excel in art, sport, beauty, or media performance, and an audience may extend that credibility to the person’s political analysis, moral judgment, or scientific opinion. This rapid generalization is cognitively inexpensive but can separate a decision from the actual evidence.

### Is Bias Always Bad?

Cognitive biases do not necessarily indicate a wholly defective mind. Many may have persisted because they served adaptive functions: fast decisions, lower energy use, immediate responses to danger, and acceptable judgments based on limited cues.

The mind need not operate like a perfect algorithm in every situation. A fast approximation is sometimes better than a perfect but delayed decision. Trouble begins when the same rapid strategy is applied to important, complex, or costly choices where a small error has large consequences.

### Explaining Bias with Cognitive Load Theory

**Cognitive load theory** holds that human working memory is limited. If the mind could simultaneously retain and evaluate all environmental information, every decision branch, and the entire state space, decisions could be more nearly optimal. In reality, it cannot.

The mind must therefore select: attend to some data, omit some, compress some into chunks, and assign greater weight to certain cues. These choices are not always errors, but disproportionate selection or weighting creates bias.

#### *Greedy* Decision-Making

The process can be described as *greedy*. Instead of exhaustively searching every path, the mind selects one route or a few available cues and decides from them. The decision may be *feasible* without being *optimal*.

In confirmation bias, the policy might be “give high weight to prior belief and discount conflicting evidence.” In anchoring bias it is “give high weight to the first fact or impression.” In both cases, working-memory limitations prevent equal consideration of every datum.

#### Generalization from Long-Term Memory

Long-term memory contains average characteristics associated with groups and situations. When encountering a new person or event, we may rapidly activate that prior average and generalize it instead of processing every new characteristic.

This is useful because it produces the best available guess from minimal information. If the stored average is invalid or the new case’s differences are ignored, however, the same strategy becomes a stereotype, a mistaken judgment, or a biased decision.

#### Reducing Bias by Managing Cognitive Load

If bias partly arises from working-memory limits, load-management strategies can reduce its probability:

- Structure information.
- Use meaningful grouping and chunking.
- Use checklists.
- Divide complex problems into smaller ones.
- Apply *divide and conquer*.
- Manage attention.
- Avoid important decisions when data are disorganized and dispersed.

These measures do not guarantee the elimination of bias, but they reduce reliance on the first readily available cue.

### Explaining Bias with Dual-Process Theory

**Dual-process theory** is a well-known framework for judgment and decision-making. A common educational account distinguishes two processing styles, *System 1* and *System 2*. Daniel Kahneman’s *Thinking, Fast and Slow* popularized this distinction.

> **Note — A qualification concerning the two systems**
>
> System 1 and System 2 should not be treated as two sharply separated boxes in the brain. They are educational labels for faster, more intuitive processing and slower, more analytical processing. Nor do all biases originate exclusively in System 1: analytical processing that begins from false assumptions or biased data can also produce incorrect conclusions.

#### *System 1*

System 1 is fast, intuitive, inexpensive, and suited to immediate reaction. Many everyday abilities depend on this processing style: face recognition, identifying a person from incomplete cues, rapidly understanding a situation, navigation, inferring another person’s emotional state, and reacting to danger.

System 1 is therefore not inherently bad. Requiring exhaustive analysis for every minor decision would make everyday life slow and costly. The problem occurs when the situation is complex, information is incomplete, the consequences are important, or precise analysis is needed, yet the mind still chooses by a rapid intuition.

#### *System 2*

System 2 is slower, more analytical, more logical, and more costly. It is associated with step-by-step reasoning, testing assumptions, gathering evidence, criticizing an initial answer, and defining decision criteria.

Bias is often intensified when System 1’s rapid response becomes final without System 2 engagement. To reduce bias in important decisions, pause, treat the first response as provisional, avoid deciding while exhausted or angry, gather more evidence, state criteria explicitly, and criticize the initial answer.

#### Eliciting *System 2*-Like Behavior in Language Models

Transformers and LLMs do not literally contain human System 1 and System 2. Their outputs can nevertheless resemble either rapid intuition or analytical reasoning. The practical question is how to encourage a model to produce a more analytical, less hasty answer.

Prompt engineering can ask a model to solve the problem in stages, inspect assumptions before the final answer, state evaluation criteria, criticize an initial answer, and then revise it. Few-shot prompts can discourage superficial pattern matching by including boundary cases and difficult examples, not only simple demonstrations.

Self-critique serves a similar function. The model first produces an answer, then is asked to inspect it, identify weaknesses, and construct a revision. In this analogy, the initial response resembles System 1, while critique and correction create System 2-like behavior.

### *Chain of Thought*, *Tree of Thought*, and *Self-Critique*

With *chain of thought*, a model solves a problem in several steps rather than immediately producing a final answer. This can help on reasoning tasks by making intermediate relations more orderly. Real applications need not expose every raw reasoning step to the user; the important point is that the response process should not be only an immediate guess.

*Tree of thought* goes further by generating several possible reasoning branches, evaluating them, and continuing along the better route. Cognitively, this reduces dependence on the first activated path. Considering multiple routes makes the answer less likely to remain trapped by an initial anchor or frame.

Self-critique and answer revision likewise reduce error and bias. All these approaches share a goal: move the model away from rapid, superficial, framing-sensitive output toward more precise and analytical responses.

## *Predictive Coding* and the Bayesian Model of Mind

After cognitive-load and dual-process accounts of bias, a third route can be examined more precisely: predictive coding. The central question is how far this theory can be mapped onto Transformers, language models, and contemporary neural networks.

### The Brain as a Predictive System

A simple traditional account of perception says that the external environment generates data, sensory cortices process them from the bottom up, and perception or a decision is eventually constructed. **Predictive coding** extends this picture: the brain is not a passive receiver, but continually creates expectations and predictions from prior knowledge.

On this account, the brain behaves like a *generative model*. Top-down processes predict what is happening in the environment from prior knowledge. Bottom-up processes receive sensory input through primary cortices. At every moment, the system computes the difference between prediction and sensory input.

There are therefore two information flows:

- **Top-down:** predictions based on prior knowledge.
- **Bottom-up:** sensory input from the environment.

A discrepancy produces a *prediction error*. With no discrepancy, the system remains in equilibrium and need not alter its mental model.

### *Prediction Error*

**Prediction error** is the difference between what a system predicted and what it received:

$$
\text{Prediction Error}=\text{Input}-\text{Prediction}
$$

Representing sensory input by $r$ or $\mu_i$ and the prediction by $\mu_p$ gives:

$$
\text{Error}=r-\mu_p
$$

or:

$$
\text{Error}=\mu_i-\mu_p
$$

If the error is zero, the new input agrees with the prior prediction and no correction is necessary. Otherwise, the system must either revise its prior belief or acquire additional input to reduce ambiguity.

### *Prior*, *Likelihood*, and *Posterior*

Prior knowledge can be represented as a probability distribution, such as a normal distribution with mean $\mu$ and variance $\sigma^2$. A strong mental model has a well-defined mean, low variance, and little uncertainty. A weak mental model has high variance and uncertainty, so the person relies on it less.

Bayes’ rule is summarized as:

$$
\text{Posterior} \propto \text{Likelihood} \times \text{Prior}
$$

The *prior* is existing knowledge, the *likelihood* is new environmental evidence, and the *posterior* is the updated belief after combining them. The process can be summarized as prior, prediction, comparison with sensory input, prediction error, updating, and posterior. This will be useful for mapping the account onto language models because the issue is not only response generation, but the weighting of presuppositions and new evidence.

#### The Detective Example

Suppose a detective enters a crime scene with information about two suspects: an older man who has reportedly been hospitalized for several weeks and a child toward whom previous evidence points. The detective’s prior strongly favors the child.

At the scene, however, the detective finds a large footprint—say, size 43. This new evidence, the likelihood, agrees better with the older man. If the detective’s prior is excessively strong, they may suggest that the child wore someone else’s shoes. Instead of revising the prior when faced with conflicting evidence, the detective attempts to preserve it. Probabilities alone are thus insufficient; the confidence or weight assigned to each source matters.

### *Precision*

*Precision* is the confidence or weight assigned to an information source. Here we distinguish:

- **Precision of prior knowledge** (*precision prior*)
- **Precision of new evidence** (*precision input*)

High prior precision means great confidence in previous knowledge. High input precision means great confidence in current evidence.

#### *Precision Prior*

Prior precision increases when knowledge rests on extensive evidence, has repeatedly been confirmed over time, agrees with many experiences, or belongs to a field in which the individual has expertise.

Sunlight arriving from above is one example. Repeated experience since childhood gives this prior very high precision, so one casual observation or assertion does not easily change it.

Prior precision is low when earlier information is scarce or dispersed, or when a person lacks experience and encounters a topic for the first time. A weak prior can cause excessive reliance on the first inputs and thereby create another source of bias.

#### Media and Expertise

It is sometimes suggested that people should not follow every media source because, when their prior precision is low, media information can readily shape their judgment and generate bias. An expert can inspect diverse sources and views with less risk of immediate displacement because their prior is stronger.

#### *Precision Input*

Input precision is high when current evidence seems highly trustworthy: the individual observed it carefully, the source is reliable, several sources converge, the observer is physically and mentally well, or there is sufficient time for scrutiny. “No, I am certain—I saw it myself” expresses high input precision.

Input precision is low when someone is tired, hurried, physically or mentally unwell, the observation is ambiguous, or the source is unreliable. A very tired person may say, “Perhaps I saw it incorrectly,” signaling low input precision.

#### Combining Input and Prior Belief

Prior and input each influence the final belief according to their precision:

$$
\mu_{\mathrm{post}}=
\frac{\pi_p \mu_p+\pi_i \mu_i}{\pi_p+\pi_i}
$$

where $\mu_{\mathrm{post}}$ is the updated mean, $\mu_p$ the prior mean, $\mu_i$ the input mean, $\pi_p$ prior precision, and $\pi_i$ input precision. This is a weighted average in which each source contributes in proportion to its precision.

#### Rewriting the Formula with Prediction Error

The same expression can expose the role of prediction error:

$$
\mu_{\mathrm{post}}=
\mu_p+\frac{\pi_i}{\pi_p+\pi_i}(\mu_i-\mu_p)
$$

Here,

$$
(\mu_i-\mu_p)
$$

is prediction error, while

$$
\frac{\pi_i}{\pi_p+\pi_i}
$$

is the error weight. Thus:

$$
\text{New Belief}=\text{Prior}+\text{Weight}\times\text{Prediction Error}
$$

### When Is a Belief Not Updated?

The prior is unchanged when $\mu_{\mathrm{post}}=\mu_p$. This occurs in several cases.

#### Case 1: Prediction Error Is Zero

If

$$
\mu_i-\mu_p=0,
$$

the new input completely agrees with the prior prediction. Nothing requires correction, and the system remains in equilibrium.

#### Case 2: *Precision Input* Is Zero or Very Small

If

$$
\pi_i \approx 0,
$$

the individual assigns almost no credibility to the new input. Even conflicting evidence then has little effect on the final belief.

#### Case 3: *Precision Prior* Is Much Greater

If

$$
\pi_p \gg \pi_i,
$$

then

$$
\frac{\pi_i}{\pi_p+\pi_i}\approx 0
$$

and therefore

$$
\mu_{\mathrm{post}}\approx \mu_p.
$$

The previous belief remains almost unchanged. This is the pattern seen in confirmation bias: confidence in the prior mental model is so great that new evidence is ignored.

### Reducing *Confirmation Bias* with the Bayesian Framework

When prediction error exists, the system must reduce it. One route changes the prior by updating the previous belief or mental model. Someone who considered an environment safe may revise that model after observing evidence of danger.

The other route changes the input: look again, turn on a light, inspect the scene from another angle, or collect more data. If an unidentified object lies on the floor, better illumination may resolve what it is. Input changes so prediction error decreases.

When no additional input is available, the prior generally dominates. If the detective finds no further evidence, judgment falls back on existing information. Reducing confirmation bias therefore requires:

1. Lowering prior precision, so previous assumptions exert less control.
2. Increasing input precision, so new evidence is clear and trustworthy.

If

$$
\pi_i \gg \pi_p,
$$

then

$$
\frac{\pi_i}{\pi_p+\pi_i}\approx 1.
$$

Consequently,

$$
\mu_{\mathrm{post}}=\mu_p+(\mu_i-\mu_p)
$$

and

$$
\mu_{\mathrm{post}}=\mu_i.
$$

The final belief is then determined almost entirely by input rather than prior. Confirmation bias decreases because the system must attend to the new evidence.

### Connecting *Predictive Coding* to Language Models

To reduce confirmation bias in an LLM, we can encourage it to rely less on its internal prior—its learned weights and parameters—and more on the current input. Prompting techniques can be analyzed as increasing input precision or limiting prior precision.

#### *RAG*

*Retrieval-augmented generation* supplies retrieved external information. This evidence acts as high-precision input. Requiring the model to answer from retrieved material reduces the influence of its broad prior and grounds the response more strongly in the supplied data.

#### *Few-Shot Prompting*

Few-shot prompting gives the model several specific examples. These clarify the input signal and reduce its variance, increasing input precision and reducing dependence on general assumptions.

#### *Negative Prompting*

Negative prompts instruct the model to avoid particular assumptions, biases, or orientations—for example, “ignore your assumptions,” “avoid cultural bias,” or “answer only from the supplied evidence.” This can be interpreted as lowering prior precision or restricting the effects of unwanted priors.

#### *Role Playing*

Role playing assigns a specific role, such as “You are an impartial judge.” It moves the model from a general response space into a narrower, controlled one. The model’s broad prior becomes less dominant, and behavior is more strongly constrained by the assigned role.

### Differences Between *Predictive Coding* and Conventional Neural Networks

A conventional neural network is usually described as follows:

1. Receive an input.
2. Perform feed-forward computation.
3. Produce an output.
4. Calculate error with a loss function.
5. Propagate the error backward.
6. Update weights using gradient descent.

For an input layer, hidden layer, and output layer, a computation may take the form:

$$
h=a_1w_1+a_2w_2+b
$$

The output is compared with the target, for example through mean squared error:

$$
\text{Loss}=(y-\hat{y})^2
$$

Backpropagation then determines how each weight should change to reduce the loss.

#### Local Error in the Brain, Global Error in the Network

In conventional neural networks, error is generally calculated at the end, after input has passed through the entire network and produced an output. It is propagated backward to adjust the weights. The error is therefore largely global or end-to-end.

In predictive coding, each processing level can locally calculate the discrepancy between its own prediction and input. Everything need not reach the top of a hierarchy before a correction command is sent back. Intuitively, every component treats itself as responsible for error rather than waiting for error to be defined only at the network’s end.

#### Direction of Information Flow

The main flow in conventional neural networks is usually bottom-up:

$$
\text{Input}\rightarrow \text{Hidden Layers}\rightarrow \text{Output}
$$

Predictive coding adds a top-down flow. Higher levels continually generate predictions and compare them with lower sensory inputs. Conventional networks usually produce a prediction after receiving input and passing it through the network; the brain, on this account, continuously generates predictions in advance and compares them with incoming data.

#### Are Network Weights the *Prior*?

Learned neural-network weights can broadly be treated as the model’s prior knowledge. The model responds through these parameters. The important difference is that conventional networks do not generally calculate and correct local prediction errors continuously at every level in the way proposed for the brain.

### A Conceptual Comparison with *GANs*

A generative adversarial network may appear similar to predictive coding because it contains a generator and an evaluating discriminator. The generative component can initially resemble the top-down component in predictive coding.

The mapping is not exact and requires care. Neither the generator nor the adversarial output can simply be equated with top-down flow in the brain.

![A simplified GAN architecture](../../assets/figures/generative-adversarial-network.png)

*Figure 3-1 — A simplified GAN: the generator constructs synthetic samples from latent variables, while the discriminator evaluates real and generated samples. Generation and evaluation create a superficial resemblance to predictive coding, but the cognitive mapping is not straightforward.*

## Selective Attention

In the ACT architecture, humans interact with an external environment. Sensory modules such as vision and hearing receive environmental information, some of which enters short-term memory. Short-term memory retrieves information from long-term memory; experiences repeatedly processed and referred to long-term memory become consolidated there through learning. Both forms of memory may also undergo forgetting.

In Bayesian terms, long-term memory resembles prior knowledge, while current environmental input entering through short-term memory resembles likelihood. Their combination creates a posterior that can alter prior knowledge over time:

$$
\begin{aligned}
\text{Long-Term Memory} &\approx \text{Prior Knowledge},\\
\text{Short-Term Input} &\approx \text{Likelihood},\\
\text{Updated Belief} &\approx \text{Posterior}.
\end{aligned}
$$

Working memory performs active mental processing but has limited capacity, making strategies such as chunking useful—for example, dividing a telephone number into smaller groups.

We inhabit an environment overflowing with information. Multiple senses continually gather data, which first enter sensory memory. Sensory memory has high capacity, but information remains there only briefly. On entering a space, we simultaneously receive sounds, faces, objects, smells, and bodily sensations. Not all of these can enter short-term memory because both storage and processing capacity are limited.

**Selective attention** chooses a subset of environmental information so that it can pass from sensory memory into short-term memory and participate in conscious processing.

### The Place of Selective Attention in Cognitive Architecture

The overall path is: the environment produces extensive information; sensory systems receive and register it in sensory memory; only part is selected for short-term memory; semantic processing and decision-making occur there; and an action is ultimately produced.

The central problem of selective attention is thus what gets chosen from the large volume of environmental information and how it enters short-term memory.

### Cognitive Attention versus *Attention* in Language Models

In systems such as ChatGPT, *attention* usually refers to how the model weights different parts of a prompt. Selective attention here concerns an earlier stage.

In an ordinary chatbot, the user has already specified the system’s environment: the prompt is the environment from which the response is constructed. The model need not select input from the entire physical world. Voice assistants such as Siri and Alexa are different. Located in a real environment, they continually receive surrounding sounds and must select the relevant portion.

When a user says *Hey Siri* or *Alexa*, the system must identify the activation phrase among ambient sounds. Selective attention is particularly relevant to systems that interact with the external environment and must choose which environmental data concern them.

### The Attentional Bottleneck

At a party, many people may speak around us, yet we ordinarily focus on one person. If a friend opposite us dictates a telephone number, we can enter it into short-term memory, chunk it, and use it later. If several other people dictate numbers simultaneously, we generally cannot process them all.

This illustrates an information-processing *bottleneck*. Much information is present, but only part can pass through the bottleneck into conscious processing.

### *Broadbent’s Filter Theory*

Broadbent’s 1958 *filter theory*, also called *early selection*, was an early account of selective attention.

#### *Early Selection*

Selection occurs early—before meaning is understood. Information is first filtered by physical or acoustic features. At a party, a friend’s voice may be selected because it is nearer, louder, familiar, comes from a known direction, or belongs to the current conversation.

Semantic processing occurs only after an input is selected. First the system chooses which voice to hear, then understands it:

1. Receive multiple environmental inputs.
2. Select one by physical or acoustic features.
3. Remove or ignore the others.
4. Process the selected input semantically.
5. Enter it into short-term memory.
6. Decide and act.

The filter precedes comprehension of meaning.

#### Limitations of Early Selection

Early selection explains why we often fail to understand other conversations while talking with one person. It struggles, however, with an important observation: someone elsewhere in the room may quietly say our name and still capture our attention.

If every unattended input had been eliminated, it is unclear how our name could have been recognized. This problem motivated another account.

### *Late Selection*

*Late selection*, including Deutsch and Deutsch’s 1963 account, places the filter after semantic processing.

#### Selection After Semantic Processing

The mind first processes multiple inputs to the level of meaning, then selects which is important enough to enter short-term memory. At a party, hearing one’s name passes the filter because its meaning is personally important:

1. Receive multiple environmental inputs.
2. Process all or many of them semantically.
3. Select the most important according to meaning.
4. Enter the selected input into short-term memory.
5. Decide and act.

Here, the filter follows comprehension.

#### Limitations of Late Selection

Late selection explains why one’s name is detected. Its central problem is the enormous processing cost of analyzing every environmental input semantically.

At any moment, the volume of available information is vast. Full semantic processing would impose an extreme burden and conflicts with experience: we do not understand every surrounding sound and event, and much never enters awareness. Late selection alone is therefore insufficient.

### *Perceptual Load Theory*

*Perceptual load theory*, developed in the mid-1990s, integrates the earlier views. Both early and late selection occur because the brain is dynamic rather than committed to one fixed mechanism. Which dominates depends on **perceptual load**, the attentional and perceptual demand imposed by a task.

A difficult, novel, dangerous, or complex task has high perceptual load. A simple, repetitive, familiar task has low load.

#### High Perceptual Load

Under high load, the mind uses early selection. It selects quickly and excludes most other inputs because there is insufficient capacity to analyze them.

Driving at night on an unfamiliar road, in danger, complex traffic, or poor weather creates high perceptual load. Most attention is devoted to driving. Someone may speak in the car, yet afterward the driver says, “I did not notice what you said.”

#### Low Perceptual Load

Under low load, spare capacity permits more inputs to receive semantic processing, making late selection more possible. Driving along a simple, familiar route may allow a person to listen to music and converse at the same time.

Early and late selection should therefore not be viewed as one correct and the other incorrect. High perceptual load favors early selection; low load permits later selection. Human attention shifts flexibly with environmental conditions and task difficulty.

### *Treisman’s Attenuation Theory*

Treisman’s **attenuation theory** offers another account between early and late selection. It rejects a fully binary filter. In Broadbent’s model, a message passes while the others are removed. Treisman proposes that information is instead strengthened or attenuated.

#### The Attenuating Filter

All inputs pass to some degree, but at different strengths. At a party, a friend’s voice may pass strongly, other voices weakly, and a quiet mention of our name may nevertheless become active because of its importance.

The filter thus weights rather than completely deletes information: some inputs are amplified and others attenuated.

#### Thresholds and Important Stimuli

Some words and stimuli have a lower activation *threshold*, requiring little energy or intensity. A person’s own name normally has a low threshold because it has been heard for years and is both familiar and important. It may therefore be detected even when spoken quietly or unclearly.

Information is not eliminated; some is weakened and some strengthened. Low-threshold stimuli activate more readily, after which semantic processing occurs.

Voice assistants provide an engineering analogy. Systems use a wake word such as *Hey Siri* or *Alexa*. They need not analyze every conversation deeply, but remain sensitive to this low-threshold pattern. Detection activates more extensive processing and may use acoustic features, a sound pattern, or, in more complex systems, semantic information.

### Serial Processing, Parallel Processing, and Attention Switching

We cannot perform every complex task in true parallel. If asked to calculate $37 \times 17$ and $81 \times 9$ simultaneously, we cannot genuinely solve both at once. We may switch rapidly between them, but this is *task switching*, not true parallel processing.

Simple actions may appear simultaneous, but tasks demanding analysis, calculation, decision-making, or high-level semantic understanding usually require serial processing. The attentional system must determine which input passes through the bottleneck at each moment.

Selective attention explains how only a fraction of vast environmental information enters short-term memory and conscious processing. Four major accounts were presented: Broadbent’s early filter before meaning; late selection after semantic processing; perceptual load theory, in which selection stage varies with load; and Treisman’s attenuation theory, in which inputs are weighted and low-threshold stimuli can pass.

The following figure compares three common views of the attentional bottleneck: early filtering, attenuation of multiple inputs, and late selection. Their main differences lie in the location and strength of the filter.

![Comparison of selective-attention models](../../assets/figures/selective-attention-models.png)

*Figure 3-2 — Three models of selective attention: early filtering, Treisman’s attenuation control, and late selection after more extensive input processing.*

---

[← Chapter 2](02-architecture-memory-load.md) · [Table of contents](README.md) · [Next chapter: Language, Speech, and Auditory Models →](04-language-speech-auditory-models.md)
