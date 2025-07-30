message MyMessage {
    value: Int;
}

contract TestTyped {
    // test case for typed binary messages receiver using message type
    receive(msg: MyMessage) {
        // minimal receiver for typed message
    }
}
