#!/bin/sh
granary init
granary node start &
granary client - import secret key "activator" "unencrypted:edsk31vznjHSSpGExDMHYASz45VZqXN4DPxvsa4hAyY8dHM28cZzp6"
granary client - activate protocol Pt24m4xiPbLDhVgVfABUjirbmda3yohdN82Sp9FeuAXJ4eV9otd with fitness 1 and key activator and parameters $PWD/protocol_parameters.json --timestamp $(TZ='AAA+1' date +%FT%TZ)
granary client - import secret key "bootstrap1" "unencrypted:edsk3gUfUPyBSfrS9CCgmCiQsTCHGkviBDusMxDJstFtojtc1zcpsh"
granary client - bake for "bootstrap1"
granary client - rpc get "/chains/main/blocks/head"
