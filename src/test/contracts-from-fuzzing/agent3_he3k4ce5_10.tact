message MyMsg {
    val: Int;
}

contract Test {
    // Receiver for typed binary messages using a properly declared message type.
    receive(msg: MyMsg) {
        // No operation
    }
}
