message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages using underscore to discard the parameter
    receive(_: MyMessage) {
        // do nothing
    }
}
