## How to define a floating point operation

In the clarivoyance doc, we define a floating point operation as one addition, subtraction, multiplication, or division of two decimal numbers, whatever their size. We do this following Ajeya Cotra's report on this topic (to do: find page).

However, not all FLOPs are made the same, because not all Ffloating points are the same. Some have lower precision: you typically have 8, 16, 32, 64-bit floats, and can have other sizes, e.g., NVIDIA's A100 uses a [custom](https://blogs.nvidia.com/blog/2020/05/14/tensorfloat-32-precision-format/) 19 bit format, to have the same range as a 32 bit float but take less space.

Naïvely, one might thing that a 16-bit operation operates on two floats, each half as small as a 32-bit float, and therefore the operation would take four times compute. Should we therefore count 16-bit operations to be 1/4th the size of 32 bit operations, and 8-bit operations to be 1/16th?

We could. However, in ML applications, my (Nuño's) impression is that if you are using 32 or 64 bit operations, you are being dumb; you aren't getting 4x oomph out of it.

Therefore, for the purpose of our forecasting questions, we decided to talk about FLOPs independent of bit-size anyways.

There is a complication, though, which is that current ML tasks aren't using individual addition, subtraction, multiplication, or division operations anyways. They are using fused [multiply-accumulate](https://wikiless.nunosempere.com/wiki/Multiply%E2%80%93accumulate_operation?lang=en) operations, which combine a multiplication and an addition more efficiently. 

I believe we could probably estimate the number of multiply-accumulate operations used in language models from: number of neurons in each layer, number of layers and the number of passes. But I haven't stopped to figure this out yet. Even if we did, though, GPT3's compute is generally computed in terms of FLOPs. but not in terms of multiply–accumulate operations.

A shortcut here might be to think in terms of number of processors × utilization × time, as in 10 A100s for five days. The problem is that this is machine dependent, and it would become more murky to compare to other types of GPU. However,e.g. A100-hours could still be useful for short-term questions before the next generation of NVIDIA GPUs come out.

These considerations might also be of interest if thinking through how many FLOPs the brain has. In page 35 of [this draft report on AI timelines](https://docs.google.com/document/d/1IJ6Sr-gPeXdSJugFulwIpvavc0atjHGM82QjIfUSBGQ/edit), Cotra writes:

> It seems plausible that a “firing event” could be represented with ~1 FLOP per “downstream” neuron that receives the signal, that the “decision-making” about whether to fire could be represented with <100,000 FLOP per neuron per second, and that these computations dominate other computations which may be necessary to represent. This results in ~1,000-100,000 FLOP/neuron/sec, or in other words ~1-10 FLOP / synapse / sec. This is roughly equivalent to the amount of computation it would take to run a model of the brain in which we had perfect knowledge of the connectome (the pattern of neuronal connections) and simply replaced every biological neuron with a standard artificial neuron.

The 1k to 100k FLOPs per neuron has room for error here, depending on the definition of a "FLOP". It might be worth digging more into this, e.g., actually modelling what the number of low-precision is that one needs to model a biological neuron. And the general high-level point is that there seems to be room for error in this calculations. 

As a last and least relevant point of curiosity, some rough experimentation in C and assembly with the help of GPT-4 revealed that in my 64 bit machine, you don't get that much of a speed up from operating on fewer bits.
