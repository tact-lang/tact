message MyMsg {
    a: Int;
}

contract Test {
    // Test 5: Typed binary message receiver using a custom message type (declared using 'message')
    receive(msg: MyMsg) {
        // This receiver matches messages of type MyMsg
    }
}
