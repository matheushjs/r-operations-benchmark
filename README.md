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

### Results for 1000 repetitions of each expression, using vectors `x, y, z` of size 10,000 each:

```
      expr      min        lq      mean    median        uq       max neval
1   log(x) 1.819953 1.8577800 2.1650245 2.2767785 2.2916820 24.338881  1000
2   exp(x) 1.587450 1.6163235 1.8796187 1.8077890 1.9970915 24.321640  1000
3      x^3 5.968563 6.0805930 6.8032727 6.4217625 7.5031155 10.486003  1000
4     x^30 5.928863 6.0427375 6.7747431 6.5404795 7.4472245  9.103976  1000
5   x^0.33 5.438551 5.5291655 6.2070750 5.8927680 6.8272300  8.309900  1000
6  sqrt(x) 0.253896 0.2590230 0.3428353 0.2756280 0.3200665  1.284116  1000
7    x + y 0.109737 0.1306620 0.2230134 0.1420365 0.1562770 23.243488  1000
8    x - y 0.110684 0.1318775 0.2740433 0.1436630 0.1586115 22.946328  1000
9    x * y 0.109994 0.1314105 0.2307636 0.1423680 0.1573130 24.830373  1000
10     x/y 0.154427 0.1632675 0.2444909 0.1903360 0.1974670  1.209109  1000
```

### Results for the gamma and lgamma, using vectors with 10,000 elements. `x` has only elements 1, and `y` has elements 100.

```
       expr      min       lq     mean   median       uq       max neval
1  gamma(x) 5.340907 5.651044 6.314696 5.941509 7.013518  8.142349  1000
2  gamma(y) 5.443762 5.534220 6.211292 6.031789 6.842596  7.772424  1000
3 lgamma(x) 6.665740 7.013576 7.858095 7.361581 8.684974 29.598779  1000
4 lgamma(y) 4.085211 4.159750 4.686736 4.414302 5.126442 26.679643  1000
```

### Results for 2 equivalent expressions, using a vector of size 10,000.

```
                expr      min       lq     mean   median       uq       max neval
1             x^3.75 5.926340 6.020688 6.760989 6.507962 7.449057  8.474639  1000
2 exp(3.75 * log(x)) 3.454261 3.538726 4.044099 3.887621 4.347392 28.232200  1000
```
