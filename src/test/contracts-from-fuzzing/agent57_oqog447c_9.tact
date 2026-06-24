message Payout {
    receiver: Address;
    amount: Int;
}

message Batch {
    payouts: map<Int, Payout>;
}

contract Test {
    receive(msg: Batch) {
        let p = msg.payouts.get(0);
    }
}