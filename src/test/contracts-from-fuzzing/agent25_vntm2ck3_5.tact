message MyMsg {
    value: Int;
}

contract Test {
    // This receiver handles typed binary messages using a valid message type
    receive(msg: MyMsg) {
        // No operation
    }
}
