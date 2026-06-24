message MyMsg {
    value: Int;
}

contract Test {
    // Receiver with underscore to discard parameter value
    receive(_: MyMsg) {
        // No operation
    }
}
