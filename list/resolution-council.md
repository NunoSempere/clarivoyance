Consider a "resolution council"
===============================

## Motivation

Many of the questions below ask about an objective numerical estimate—e.g., number of FLOPs used in the largest training run.

But we may not have direct access to that numerical quantity. So if we wanted to use these questions in a forecasting platform, like Metaculus, Manifold Markets, or Polymarket, it would be useful to specify a question's resolution as a subjective estimate of our quantity of interest instead.

For example, instead of asking "what will the number of FLOPs used in the largest training run by by Jan 1, 2024?", one can ask "What will be [resolution council]'s best estimate be for the number of FLOPs used in the largest training run by Jan 1, 2024?".

The alternative would be to ask questions which one doesn't plan to resolve. A few groups, like Samotsvety, would be able to do this, but it is less common.

## Specification

With this in mind, here is a small specification for a resolution council.

- The resolution council shall be composed of: Sylvain Chevalier, Nuño Sempere, Ozzie Gooen, Ege Erdil, at least one staff member from [Epoch](https://epochai.org/), one Metaculus moderator and one Samotsvety forecaster.
  - Note that these individuals haven't been asked. They would have to be asked.
- They are receiving [amount] in advance for agreeing to resolving this question, and will receive [some amount] upon question resolution. They have promised to resolve this question to the best of their abilities.
- If any of the resolution council members don't show up, the rest shall proceed as below.
- They shall spend [n hours] coming up with their best estimate, talk for [m hours amongst themselves], and update their estimates afterwards.
- Their aggregate estimate, according to [aggregation method], will be the resolution for this question.

Alternatively, it might be more convenient:
- for Open Philanthropy: ask Epoch whether they want to be the resolution council, maybe in a way which could survive the death of the organization, e.g., by asking individual employees.
- for Arb: think about whether providing a resolution council as a service is a profitable opportunity, and if so, instantiate one and present it to OP.

## Considerations about cost

Note that the resolution council, as specified above, is expensive: many hours would go into a resolution. This is by design: a half-assed estimate of the number of parameters in GPT-4 isn't worth much. 

But you can adapt the above specification to make it less costly. For example:

- reduce inputs: reduce number of hours that the jury spends deliberating, reduce number of jurors
- make resolution probabilistic: the resolution council is only convened some of the time, and the rest of the time the question resolves as ambiguous.
- make resolution staggered: the question resolves according to some cheaper method that attempts to predict the resolution of the more expensive method, and that can be challenge—this could be somewhat analogous to the a lower court/Supreme Court setup in the USA. 
