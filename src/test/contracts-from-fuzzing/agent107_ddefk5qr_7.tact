message MyMsg {
    value: Int;
}

contract Test {
    // Receiver with underscore parameter to discard the message
    receive(_: MyMsg) {
        // Empty body
    }
}
