message MyMsg {
    field: Int;
}

contract TypedBinaryReceiver {
    // Receiver for typed binary messages using MyMsg
    receive(msg: MyMsg) {
        // No-op
    }
}
