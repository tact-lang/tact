message MyMessage {
    value: Int;
}

contract TestBinaryReceiver {
    // receiver for binary message of type MyMessage
    receive(msg: MyMessage) {
        // empty implementation
    }
}
