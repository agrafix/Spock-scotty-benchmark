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

On Arch with an i5 (i5-3317U), requests in 30 seconds, higher is better

| Framework | GHC   | Version | no regex, no captures     | simple captures, no regex | regex captures |
|-----------|-------|---------|---------------------------|---------------------------|----------------|
| Spock     | 7.8.4 | 0.7.10.0 | **915515**                | **823222**                | **721531**     |
| scotty    | 7.8.4 | 0.10.1.0 | 868201                    | 639017                    | 520735         |

Spock
--------
```bash
> ./bench.sh
Benchmarking http://localhost:8080/echo/hello-world (no regex, no captures)
Running 30s test @ http://localhost:8080/echo/hello-world
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    12.78ms   11.14ms 690.72ms   99.74%
    Req/Sec     3.98k   461.52     6.25k    77.35%
  915515 requests in 30.00s, 135.33MB read
  Socket errors: connect 0, read 399, write 0, timeout 48
Requests/sec:  30521.68
Transfer/sec:      4.51MB
Benchmarking http://localhost:8080/echo/plain/hello (simple captures, no regex)
Running 30s test @ http://localhost:8080/echo/plain/hello
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    14.23ms    3.69ms 505.45ms   92.23%
    Req/Sec     3.54k   343.95     4.94k    74.31%
  823222 requests in 30.00s, 116.98MB read
name:                Spock-scotty-benchmark
version:             0.1.0.0
synopsis:            Benchmark comparison between Spock and scotty framework
description:
  Socket errors: connect 0, read 384, write 0, timeout 39
Requests/sec:  27441.24
Transfer/sec:      3.90MB
Benchmarking http://localhost:8080/echo/regex/42 (regex captures)
Running 30s test @ http://localhost:8080/echo/regex/42
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    16.19ms    5.06ms 334.34ms   92.47%
    Req/Sec     3.11k   345.15     5.78k    80.23%
  721531 requests in 30.00s, 100.46MB read
  Socket errors: connect 0, read 410, write 0, timeout 59
Requests/sec:  24050.96
Transfer/sec:      3.35MB
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
```
