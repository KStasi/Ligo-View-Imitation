type storageType is record [
    param: nat;
];

type actionRequest is record [
    param: nat;
];

type actionReplay is record [
    param: nat;
];

type action is
| Request of actionRequest
| Replay of actionReplay

type actionSend is record [
    receiver : address;
    param: nat;
]

type actionSender is
| Send of actionSend


function sendToContract(const action : actionSend ; const s : storageType) : (list(operation) * storageType) is
  block { 
    const param: nat = action.param;
    const params: action = Replay(record param=action.param; end);
    const contract : contract(action) = get_contract(action.receiver);
    const response : operation = transaction(params, 0tz, contract);
    const operations : list(operation) = list response end;
  } with (operations , s)

function main(const action : actionSender; const s : storageType) : (list(operation) * storageType) is 
 block {skip}  with
 case action of
 | Send (ac) -> sendToContract (ac, s)
end