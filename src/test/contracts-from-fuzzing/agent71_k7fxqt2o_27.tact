message MyMsg {
    a: Int;
}

contract Test {
    // Test: Receiver using underscore for a typed binary message
    // Expecting the receiver to compile successfully and ignore the parameter value
    receive(_ : MyMsg) {
        // Receiver body intentionally ignores the message
    }
}
