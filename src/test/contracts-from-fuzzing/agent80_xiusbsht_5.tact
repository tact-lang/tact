message MyMsg {
    value: Int;
}

contract Test {
    // Valid usage of underscore for discarding a message parameter of a message type
    receive(_: MyMsg) {
        // Correctly discarding the message parameter
    }
}
