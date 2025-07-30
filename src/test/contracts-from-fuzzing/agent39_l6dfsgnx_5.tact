message Msg {
    amount: Int;
}

contract Test {
    receive(message: Msg) {
        // use message.amount
    }
}