message MyMsg {
    a: Int;
}

contract Test {
    // Test: Valid receiver with a typed binary message using a declared message type
    receive(msg: MyMsg) {
        // Compiled successfully
    }
}
