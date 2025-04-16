message MyMsg {
    a: Int;
}

contract Test {
    // Test case for typed binary message receiver using a user-defined message type
    receive(msg: MyMsg) {
        // simple logic
    }
}
