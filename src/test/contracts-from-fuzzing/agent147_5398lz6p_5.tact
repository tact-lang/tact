message(1) MyMsg {
    a: Int;
}

contract TestTypedReceiver {
    // Receiver function for typed binary messages
    receive(msg: MyMsg) {
        // No operation
    }
}
