message Msg {
    amount: Int = 5;
}

contract Test {
    receive(message: Msg) {
        // do nothing
    }
}