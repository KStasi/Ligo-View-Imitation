mkdir build/ && cd build
ligo compile-contract ./contracts/requester.ligo main > ./build/requester_tmp.tz 
ligo compile-contract ./contracts/sender.ligo main > ./build/sender_tmp.tz 
tr -d '\r' < ./build/requester_tmp.tz > ./build/requester.tz
tr -d '\r' < ./build/sender_tmp.tz > ./build/sender.tz
rm ./build/*_tmp.tz *.pp.ligo