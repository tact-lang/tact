message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for typed binary messages based on a declared message type
    receive(msg: MyMsg) {
        // handler logic
    }
}
