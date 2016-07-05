#!/bin/bash
TEST_OUTPUT_FILE="/tmp/test-output"
cat - >$TEST_OUTPUT_FILE <<EOF
Gull 3 x64
id name Gull 3 x64
id author ThinkingALot
option name Hash type spin min 1 max 65536 default 16
option name Ponder type check default false
option name MultiPV type spin min 1 max 64 default 1
option name Clear Hash type button
option name PV Hash type check default true
option name Aspiration window type check default true
option name Threads type spin min 1 max 4 default 4
option name Large memory pages type check default true
uciok
EOF


#echo $TEST_OUTPUT > $TEST_OUTPUT_FILE
DIFF_OUTPUT="$(echo "uci\nquit" | ./Gull | diff - $TEST_OUTPUT_FILE)"
if [ "" != "$DIFF_OUTPUT" ]; then
    echo "Test failed"
    exit 1
fi
