struct Data {
    amount: Int;
}

message Msg {
    d: Data;
}

contract Test {
    receive(msg: Msg) {
        let val = msg.d.amount;
    }
}