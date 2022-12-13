message(0x7bdd97de) TokenBurned {
    amount: Int;
    owner: Address;
    cashback: Address?;
}

message(0x178d4519) TokenTransferInternal {
    queryId: Int as uint64;
    amount: Int;
    from: Address;
    responseAddress: Address;
    forwardTonAmount: Int as coins;
}

message(0xf8a7ea5) TokenTransfer {
    queryId: Int as uint64;
    amount: Int as coins;
    destination: Address;
    responseDestination: Address;
    customPayload: Cell?;
    forwardTonAmount: Int as coins;
}