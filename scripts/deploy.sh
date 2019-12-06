#!/bin/sh
# ligo compile-storage ./contracts/requester.ligo main "record param = 0; receiver=(\"tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx\": address); end"
# ligo compile-storage ./contracts/sender.ligo main "record param = 0; end"
granary client - originate contract requester for bootstrap1 transferring 0 from bootstrap1 running $PWD/build/requester.tz --init '" (Pair 0 \"tz1KqTpEZ7Yob7QbPE4Hy4Wo8fHG8LhKxZSx\")"' --burn-cap 20
granary client - originate contract sender for bootstrap1 transferring 0 from bootstrap1 running $PWD/build/sender.tz --init '" 0"' --burn-cap 8.200 
