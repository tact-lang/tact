message MyMessage {
    value: Int;
}

contract TypedReceiver {
    // Receiver for binary messages of type MyMessage
    receive(msg: MyMessage) {
        let x: Int = msg.value;
    }
}
