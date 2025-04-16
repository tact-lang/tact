message MyMsg {
    a: Int;
}

contract Test {
    // Receiver for typed binary messages using a message type
    receive(msg: MyMsg) {
        // Handle MyMsg
    }
}
