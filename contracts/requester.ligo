type storageType is record [
    param: nat;
    senderAddress: address;
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

function requestContract(const action : actionRequest ; const s : storageType) : (list(operation) * storageType) is
  block { 
    const param: nat = action.param;
    const params: actionSender = Send(record receiver=sender; param=param end) ;
    const contract : contract(actionSender) = get_contract(s.senderAddress);
    const request : operation = transaction(params, 0tz, contract);
    const operations : list(operation) = list request end;
  } with (operations , s)

function reseiveResponse(const action : actionReplay ; const s : storageType) : (list(operation) * storageType) is
  block { 
    s.param := action.param;
  } with ((nil:list(operation)), s)

function main(const action : action ; const s : storageType) : (list(operation) * storageType) is 
 block {skip}  with
 case action of
 | Request (ac) -> requestContract (ac, s)
 | Replay (ac) -> reseiveResponse (ac, s)
end