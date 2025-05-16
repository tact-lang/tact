message MyMsg {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMsg) {
        let _ = msg.value;
    }
}
