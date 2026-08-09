# Chapter 1: Foundations of Computational Cognitive Science

[فارسی](../fa/01-foundations.md) | **English**

[← Table of contents](README.md) · [PDF edition (Persian)](../../releases/computational-cognitive-science-booklet-fa.pdf)

---

## Conceptual Framework and the Central Problem

### What Is Cognitive Science?

Cognitive science is not merely the study of the brain as a biological and anatomical organ. Its central question is how humans are able to **act**: how they see, hear, speak, think, decide, judge, learn, make mistakes, and sometimes develop impairments. Cognitive science therefore seeks to understand the mechanisms that make human behavior and experience possible.

From this perspective, “the human” does not mean only an average, healthy adult. A cognitive theory should provide a coherent account of children, older adults, highly capable individuals, people with disabilities or disorders, and people with typical performance. A theory that works for only a narrow group is not yet a good general theory of human cognition.

The idea of a “cognitive module” can help clarify this point. Here, a module does not necessarily mean a separate, sharply bounded piece of hardware. It means a collection of processes and mechanisms that enable perception, language, memory, decision-making, and action. Cognitive science aims to describe, test, and ultimately model these mechanisms.

### From Cognitive Science to Computational Cognitive Science

In cognitive science, a verbal or conceptual theory may explain how humans perform a skill. Computational cognitive science goes one step further and asks whether that theory can be expressed formally, computationally, and in an implementable form.

It is therefore not enough to say that “humans use context” or that “working memory is limited.” The goal is to turn such claims into models, algorithms, architectures, experiments, and predictions. A cognitive theory becomes more useful to computational cognitive science when it can be reformulated in an executable—or at least testable—form.

For this reason, the discussion begins with classical cognitive theories but does not end there. The main path is to connect every cognitive theory to a computational problem: Can the theory explain a weakness in an artificial-intelligence model? Can it suggest a better architecture, dataset, or evaluation method?

### The Relationship Between Computational Cognitive Science and Artificial Intelligence

The progression of knowledge in this area can be approximated as follows:

$$
\begin{aligned}
\text{Artificial Intelligence}
&\rightarrow
\text{Machine Learning}
\rightarrow
\text{Deep Learning}\\
&\rightarrow
\text{Computational Cognitive Science}.
\end{aligned}
$$

Classical artificial intelligence includes methods such as search, brute force, breadth-first search (BFS), genetic algorithms, and simulated annealing. Machine learning emphasizes learning from data and extracting features. Deep learning enables models to construct more complex representations through deeper architectures. Computational cognitive science adds a new question: Which cognitive skill is missing from these models, and how can it be incorporated?

Many computational cognitive science courses choose vision and image processing as their main case study. This choice is historically and pedagogically understandable: neuroscience and cognitive psychology provide extensive classical evidence about vision, while computer vision played a major role in the growth of modern artificial intelligence. This booklet, however, focuses primarily on language, speech, reasoning, and language models, including:

- **Natural language processing** (NLP)
- **Reasoning**
- **Speech processing**
- **Language models**
- **Transformers**

A basic familiarity with NLP is useful, although the necessary models and architectures are reviewed throughout the text. Because most examples concern language and speech, readers coming from other fields should explicitly relate the concepts to their own research questions or applications.

### Cognitive Questions and Machine-Learning Questions

In machine learning, a problem is usually framed as follows:

> Given this input, how can we predict the correct output?

Metrics such as accuracy, precision, and recall are important in this framework. From an engineering perspective, a model may be considered successful if it receives an input and produces the correct output, even when we do not know exactly what happened inside it.

The central question in cognitive science is slightly different:

> How do humans perform this task?

A correct output is therefore not sufficient. A cognitive model should also provide some account of the process, reaction time, error patterns, individual differences, and impairments. A model that scores highly on a test but makes mistakes entirely unlike those made by humans may be a useful engineering tool without necessarily being a good cognitive model.

This distinction makes computational cognitive science a bridge between two concerns. It seeks to build computational models, but it does not settle for the final output alone. A model should be comparable with human evidence at the behavioral level and, where possible, at the process level.

### Cognitive Theory, Computational Models, and Validation

The multiplicity of theories in cognitive science can be illustrated by the parable of the blind people and the elephant. Human cognition is like a large elephant, and each theory touches only one part of it: one theory explains hearing, another memory, another attention, and another decision-making or error. No single theory explains the entire human mind.

A good cognitive theory should:

- Explain correct human behavior.
- Explain human errors rather than modeling only correct answers.
- Apply beyond a single age, condition, or narrowly defined group.
- Address individual differences and cognitive impairments.
- Generate predictions that can be tested through independent experiments.

Validation in cognitive science rarely ends with one convincing example. Researchers must design experiments, collect human data, perform statistical analyses, and test the theory again in independent settings. If a theory claims that humans activate several lexical candidates during speech recognition, it should explain why a person hears one word rather than another under noisy or ambiguous conditions.

Cognitive theories are not usually discarded in an all-or-nothing fashion. Many explain part of a phenomenon well, after which more complete or precise theories add what was previously missing. The development of theory in cognitive science therefore resembles revision, extension, and refinement more than the outright rejection of every preceding theory.

### The Brain, Functional Regions, and Cautious Interpretation

Cognitive theories should be broadly compatible with evidence from the brain, but the brain should not be reduced to a set of fully separate, non-overlapping boxes. Different cortical regions are associated with functions such as vision, hearing, speech, balance, coordination, decision-making, and reasoning. For example, occipital regions are more strongly associated with visual processing, temporal regions with aspects of auditory and language processing, and frontal regions with functions such as planning, judgment, and cognitive control.

These mappings do not have perfectly sharp boundaries. Cognitive functions generally arise from networks of brain regions rather than a single isolated point. When we say that a region is “associated with speech” or “associated with reasoning,” we mean a predominant and approximate relationship—not that the region has exclusive ownership of that ability.

### Applications of Cognitive Science and the Scope of This Booklet

One important application of cognitive science is understanding disorders and diseases. If we understand how a cognitive or developmental condition—such as part of the autism spectrum—is related to mechanisms of perception, language, social interaction, or environmental prediction, we may be able to design better and more humane interventions. This booklet is not, however, a substitute for specialized training in clinical neuropsychology or the treatment of disorders.

The goal here is to build a bridge between cognitive science and artificial intelligence. We use cognitive theories to understand the weaknesses of computational models, design more precise experiments, and, where possible, construct models that are more meaningful from a cognitive perspective.

### Failures of Large Models on Cognitive Skills

Large language models perform remarkably well on many linguistic and knowledge-based tasks, but this success alone does not show that they have acquired cognitive skills in a general, human-like way. One important approach to evaluation is to design tests that minimize superficial similarity to training data and require the model to recognize an abstract relationship in a novel setting.

A significant example is **analogical reasoning** under **counterfactual** changes. Suppose a model performs well on familiar analogies—for example, recognizing the pluralization relationship in “book : books” and “girl : girls.” This does not yet establish whether it understands the abstract relationship or merely reproduces familiar patterns. A harder test changes alphabets, symbols, colors, or orderings and asks whether the model can still transfer relations such as “comes next,” “is the inverse of,” or “belongs to the same class.”

Examples involving invented alphabets, stories with different settings but a shared theme, and categories replaced by symbols such as crosses or exclamation marks all expose the same issue. The model must not rely solely on surface similarity; it must identify the deeper relationship. Recent research on analogy in language models debates precisely this point. Some findings show sharp performance declines on counterfactual versions, while others argue that stronger models or more careful experimental designs can achieve part of this generalization. The precise claim should therefore remain cautious: abstract and counterfactual analogy is still an important and challenging test of the cognitive capabilities of language models.

### Counterfactual and Adversarial Changes

When we alter the order of an alphabet, define new symbols, or place a familiar relationship in an unfamiliar environment, we create a counterfactual change. If the change is designed to move the model away from memorized surface patterns, it can also play an adversarial role by exposing a weakness in the model.

For humans, transferring an abstract relationship to a new environment is generally more natural. Humans are not error-free, but a person who understands the relationship can transfer it from a real alphabet to an invented one. Models that depend more heavily on familiar statistical correlations may deteriorate sharply after this small change. The cognitive question begins at precisely this point: Which abstract skill or generalization mechanism is weak in the model?

### Human Data and Correlations Between Error Patterns

To evaluate models cognitively, we should not ask only whether a model solved a task. We should ask how closely its pattern of performance correlates with the human pattern.

Two criteria must be distinguished:

1. Does the model successfully perform the task?
2. Do the model’s difficulties and errors correlate with human difficulties and errors?

The relevance of this distinction depends on our goal. If we are building a tool intended to compensate for human errors, we may not want the model to repeat those errors. Even then, understanding the relationship between model and human errors remains important. We should first determine whether the model and humans share a cognitive error; we can then reduce that error through fine-tuning, few-shot learning, changes to the data or architecture, or similar techniques.

If the goal is to model human cognition, correlation with human errors becomes even more important. A model that produces more correct answers but bears no resemblance to the human error pattern does not necessarily explain human cognition. In computational cognitive science, errors can therefore be as informative as correct responses.

The same issue appears in discussions of **artificial general intelligence** (AGI). Some recent evaluation frameworks assess a collection of cognitive abilities rather than a single skill. One important psychometric framework for classifying human cognitive abilities is **Cattell–Horn–Carroll theory** (CHC), which organizes abilities at broad and narrow levels. Applying such frameworks to artificial-intelligence evaluation means assessing a model’s cognitive profile across several abilities rather than judging it by a single benchmark.

### A Research Path

A typical research path in computational cognitive science is:

1. Identify a cognitive weakness or error in a model.
2. Determine whether it correlates with a human error.
3. Explain the human error using a cognitive theory.
4. Design suitable data, experiments, or descriptions for measuring it.
5. Improve the model through methods such as prompting, few-shot learning, fine-tuning, retrieval-augmented generation (RAG), or architectural changes.
6. Show that the improvement is not merely a superficial performance increase, but is connected to a cognitive analysis of the problem.

If we simply enlarge a model or train it on more data without the cognitive stage, we may achieve an engineering improvement, but the contribution of cognitive science remains unclear. The research has greater value when the model’s weakness is first explained as a cognitive skill and the computational intervention then targets that precise weakness.

---

[← Table of contents](README.md) · [Next chapter: Cognitive Architectures, Memory, and Cognitive Load →](02-architecture-memory-load.md)
