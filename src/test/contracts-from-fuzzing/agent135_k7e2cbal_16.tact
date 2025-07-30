message MyMsg {
    value: Int;
}

contract TestAmbiguous {
    // Receiver for a typed binary message
    receive(msg: MyMsg) {}
    // Fallback receiver for binary messages
    receive(msg: Slice) {}
}
