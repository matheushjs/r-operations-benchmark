Benchmark of R Expressions
===

In Statistics there is the common practice to calculate the logarithm of a probability distribution function, because this gets rid of most exponents
and you end up dealing with a bunch of logs, multiplications and sums. I wondered how this would impact program performance, so I'm doing this benchmark.

Suppose you have to calculate
```
	x^(k*a - 1)
```
which has **1 pow, 1 minus, 1 mult**, we could rather calculate its logarithm
```
	(k*a - 1) * log(x)
```
and then later take its exponential to undo the logarithms:
```
	exp((k*a - 1) * log(x))
```
which has **1 minus, 2 mult, 1 log, 1 exp**.

To see how performance changed, let us see how much time each expression takes.

Results for 1000 repetitions of each expression, using vectors `x, y, z` of size 10,000 each (I took the median):
