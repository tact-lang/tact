message Msg {
    amount: Int;
}

contract Test {
    receive(msg: Msg) {
        let x = msg.amount;
    }
}