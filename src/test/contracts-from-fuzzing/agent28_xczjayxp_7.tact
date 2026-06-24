message MyMessage {
    x: Int;
}

contract Test {
    // Receiver for typed binary messages using underscore to discard parameter value
    receive(_: MyMessage) {
    }
}
