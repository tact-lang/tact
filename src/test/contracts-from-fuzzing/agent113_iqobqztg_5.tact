message MyMessage {
    value: Int;
}

contract TestReceiveTypedBinary {
    // receiver for typed binary messages
    receive(msg: MyMessage) {
    }
}
