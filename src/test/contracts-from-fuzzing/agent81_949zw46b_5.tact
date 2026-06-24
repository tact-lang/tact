message MyMsg {
    data: Int;
}

contract Test {
    // Test 4 revised: Typed binary message receiver using proper message type
    receive(msg: MyMsg) {
        // handling typed binary messages
    }
}
