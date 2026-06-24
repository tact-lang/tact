message MyMessage {
    value: Int;
}

contract TestMsg {
    // receiver for binary message of type MyMessage
    receive(msg: MyMessage) {
        let x: Int = msg.value;
    }
}
