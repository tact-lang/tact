message MyMessage {
    a: Int;
}

contract TypedReceiver {
    // This receiver handles typed binary messages matching MyMessage
    receive(msg: MyMessage) {
        // Minimal implementation
    }
}
