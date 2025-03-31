message MyMsg {
    a: Int;
}

contract TestTypedValid {
    // Receiver for a typed binary message using a message definition
    receive(msg: MyMsg) {
        // no-op
    }
}
