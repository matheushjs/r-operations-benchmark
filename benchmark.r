require(microbenchmark)

x = seq(1, 10, length=1e5);
y = seq(1, 10, length=1e5);

options(width=150);

result = microbenchmark(
	log(x),
	exp(x),
	x**3,
	x**30,
	x**0.33,
	sqrt(x),
	x + y,
	x - y,
	x * y,
	x / y,
	times = 1e3,
	unit="ms",
	control = list(warmup=100)
);

print(summary(result));

x = rep(1, 1e5);
y = rep(100, 1e5);

result = microbenchmark(
	gamma(x),
	gamma(y),
	lgamma(x),
	lgamma(y),
	times = 1e3,
	unit="ms",
	control = list(warmup=100)
);
print(summary(result));


x = seq(1, 10, length=1e5);

result = microbenchmark(
	x**3.75,
	exp(3.75*log(x)),
	times = 1e3,
	unit="ms",
	control = list(warmup=100)
);
print(summary(result));
