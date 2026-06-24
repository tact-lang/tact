message MyMsg {
    value: Int;
}

contract TestTypedReceiver {
    // Receiver for typed binary message MyMsg
    receive(msg: MyMsg) {
        // Use the message parameter
        let _ = msg.value;
    }
}
