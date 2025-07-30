message Msg {
    amount: Int
}

contract Test {
    receive(message: Msg) {
        // do nothing
    }
}