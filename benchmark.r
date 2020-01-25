require(microbenchmark)

x = seq(100, 1000, length=1e5);
y = seq(100, 1000, length=1e5);
z = seq(100, 1000, length=1e5);

options(width=150);

result = microbenchmark(
	log(log(log(x))),
	exp(exp(exp(x))),
	((x**3)**3)**3,
	sqrt(sqrt(sqrt(x))),
	x + y + z,
	x - y - z,
	x * y * z,
	x / y / z,
	gamma(gamma(gamma(x))),
	lgamma(lgamma(lgamma(x))),
	times = 1e3
);

print(summary(result)[,c("expr", "median")]);
