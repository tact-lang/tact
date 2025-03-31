message MyMsg {
    x: Int;
}

contract Test {
    // Test 4 revised: Typed binary message receiver using message type MyMsg
    receive(msg: MyMsg) {
        // Handle typed binary message
    }
}
