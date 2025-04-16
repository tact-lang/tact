message MyMessage {
    value: Int;
}

contract TestTypedReceiverFixed {
    // Receiver for typed binary message using a message type
    receive(msg: MyMessage) {
        // simple handling of typed message
    }

    // Getter for compilation inclusion
    get fun test(): Int {
        return 0;
    }
}
