#!/bin/bash
WRK="wrk -t8 -c400 -d30s"

HELLO_URL="http://localhost:8080/echo/hello-world"
PARAM_URL="http://localhost:8080/echo/plain/hello"
REGEX_URL="http://localhost:8080/echo/regex/42"

CHECK_HELLO=$(wget -qO- $HELLO_URL)
CHECK_PARAM=$(wget -qO- $PARAM_URL)
CHECK_NUM=$(wget -qO- $REGEX_URL)

if [[ "$CHECK_HELLO" != "Hello World" ]]; then
    echo "Invalid $HELLO_URL repsonse! Expected 'hello' got '$CHECK_HELLO' (Is the server running?)"
    exit 1
fi

if [[ "$CHECK_PARAM" != "hello" ]]; then
    echo "Invalid $PARAM_URL repsonse! Expected 'hello' got '$CHECK_PARAM' (Is the server running?)"
    exit 1
fi

if [[ "$CHECK_NUM" != "42" ]]; then
    echo "Invalid $REGEX_URL repsonse! Expected '42' got '$CHECK_NUM' (Is the server running?)"
    exit 1
fi

echo "Benchmarking $HELLO_URL (no regex, no captures)"
$WRK $HELLO_URL

echo "Benchmarking $PARAM_URL (simple captures, no regex)"
$WRK $PARAM_URL

echo "Benchmarking $REGEX_URL (regex captures)"
$WRK $REGEX_URL
