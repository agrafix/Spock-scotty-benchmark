Spock vs scotty benchmark
=================

Benchmark the two Haskell web frameworks [Spock](https://github.com/agrafix/Spock) and [scotty](https://github.com/scotty-web/scotty)

How to run
==========

```bash
> cabal update
> cabal install --only-dependencies
> cabal configure
> cabal build
> dist/build/Spock-scotty-benchmark/Spock-scotty-benchmark spock/scotty
> ./bench.sh
```

Results
=====

On my MacBook Pro retina (2012), requests in 30 seconds, higher is better

| Framework | GHC   | Version | no regex, no captures     | simple captures, no regex | regex captures |
|-----------|-------|---------|---------------------------|---------------------------|----------------|
| Spock     | 7.6.3 | 0.5.0.1 | 836875                    | **713503**                | **641898**     |
| scotty    | 7.6.3 | 0.6.2.0 | **868201**                | 639017                    | 520735         |

Spock
--------
```bash
> ./bench.sh
Benchmarking http://localhost:8080/echo/hello-world (no regex, no captures)
Running 30s test @ http://localhost:8080/echo/hello-world
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    13.85ms    3.73ms 388.48ms   94.06%
    Req/Sec     3.63k   398.97     5.58k    76.88%
  836875 requests in 30.00s, 123.71MB read
  Socket errors: connect 0, read 433, write 0, timeout 76
Requests/sec:  27896.08
Transfer/sec:      4.12MB
Benchmarking http://localhost:8080/echo/plain/hello (simple captures, no regex)
Running 30s test @ http://localhost:8080/echo/plain/hello
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    16.40ms    5.82ms 585.13ms   95.05%
    Req/Sec     3.04k   375.79     4.92k    74.19%
  713503 requests in 30.00s, 101.39MB read
  Socket errors: connect 0, read 400, write 0, timeout 0
Requests/sec:  23780.86
Transfer/sec:      3.38MB
Benchmarking http://localhost:8080/echo/regex/42 (regex captures)
Running 30s test @ http://localhost:8080/echo/regex/42
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    18.21ms    7.31ms 619.98ms   95.51%
    Req/Sec     2.75k   299.95     5.24k    75.91%
  641898 requests in 30.00s, 89.38MB read
  Socket errors: connect 0, read 431, write 0, timeout 0
Requests/sec:  21397.03
Transfer/sec:      2.98MB
```

scotty
--------
```bash
> ./bench.sh
Benchmarking http://localhost:8080/echo/hello-world (no regex, no captures)
Running 30s test @ http://localhost:8080/echo/hello-world
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    13.36ms    3.77ms 387.55ms   94.39%
    Req/Sec     3.78k   454.36     6.00k    77.51%
  868201 requests in 30.00s, 128.34MB read
  Socket errors: connect 0, read 433, write 0, timeout 76
Requests/sec:  28940.82
Transfer/sec:      4.28MB
Benchmarking http://localhost:8080/echo/plain/hello (simple captures, no regex)
Running 30s test @ http://localhost:8080/echo/plain/hello
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    18.14ms    5.23ms 507.33ms   94.48%
    Req/Sec     2.74k   311.43     5.41k    76.15%
  639017 requests in 30.00s, 90.80MB read
  Socket errors: connect 0, read 439, write 0, timeout 81
Requests/sec:  21300.84
Transfer/sec:      3.03MB
Benchmarking http://localhost:8080/echo/regex/42 (regex captures)
Running 30s test @ http://localhost:8080/echo/regex/42
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    22.41ms   11.64ms 798.38ms   97.71%
    Req/Sec     2.22k   249.89     4.28k    79.83%
  520735 requests in 30.00s, 72.51MB read
  Socket errors: connect 0, read 421, write 0, timeout 68
Requests/sec:  17357.70
Transfer/sec:      2.42MB
``
