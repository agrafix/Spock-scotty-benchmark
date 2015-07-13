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

| Framework | GHC   | Version  | no regex, no captures     | simple captures, no regex | regex captures |
|-----------|-------|----------|---------------------------|---------------------------|----------------|
| Spock     | 7.10.1 | 0.7.10.0 | 782906                    | **734979**                | **661227**     |
| scotty    | 7.10.1 | 0.10.1.0 | **835393**                | 692151                    | 524374         |

Spock
--------
```bash
> ./bench.sh
Benchmarking http://localhost:8080/echo/hello-world (no regex, no captures)
Running 30s test @ http://localhost:8080/echo/hello-world
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    16.85ms   27.80ms 847.75ms   99.31%
    Req/Sec     3.28k   627.05    12.67k    94.91%
  782906 requests in 30.02s, 127.67MB read
Requests/sec:  26077.42
Transfer/sec:      4.25MB
Benchmarking http://localhost:8080/echo/plain/hello (simple captures, no regex)
Running 30s test @ http://localhost:8080/echo/plain/hello
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    18.85ms   39.35ms   1.09s    99.13%
    Req/Sec     3.13k   706.56    10.78k    96.10%
  734979 requests in 30.02s, 115.65MB read
Requests/sec:  24480.10
Transfer/sec:      3.85MB
Benchmarking http://localhost:8080/echo/regex/42 (regex captures)
Running 30s test @ http://localhost:8080/echo/regex/42
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    22.38ms   55.12ms   1.30s    98.94%
    Req/Sec     2.77k   625.44    13.08k    94.20%
  661227 requests in 30.02s, 102.16MB read
Requests/sec:  22024.47
Transfer/sec:      3.40MB
```

scotty
--------
```bash
> ./bench.sh
Benchmarking http://localhost:8080/echo/hello-world (no regex, no captures)
Running 30s test @ http://localhost:8080/echo/hello-world
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    15.87ms   27.48ms 866.32ms   99.32%
    Req/Sec     3.53k   493.42    10.23k    95.83%
  835393 requests in 30.03s, 136.23MB read
Requests/sec:  27820.09
Transfer/sec:      4.54MB
Benchmarking http://localhost:8080/echo/plain/hello (simple captures, no regex)
Running 30s test @ http://localhost:8080/echo/plain/hello
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    19.07ms   30.67ms 955.54ms   99.25%
    Req/Sec     2.90k   550.93    10.98k    95.08%
  692151 requests in 30.02s, 108.91MB read
Requests/sec:  23054.96
Transfer/sec:      3.63MB
Benchmarking http://localhost:8080/echo/regex/42 (regex captures)
Running 30s test @ http://localhost:8080/echo/regex/42
  8 threads and 400 connections
  Thread Stats   Avg      Stdev     Max   +/- Stdev
    Latency    28.64ms   68.53ms   1.52s    98.73%
    Req/Sec     2.25k   589.30    10.99k    95.90%
  524374 requests in 30.02s, 81.01MB read
Requests/sec:  17465.17
Transfer/sec:      2.70MB
```
