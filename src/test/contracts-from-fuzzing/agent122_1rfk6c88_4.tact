message MyMessage {
    value: Int;
}

contract TestTypedBinary {
    receive(msg: MyMessage) {
        // minimal handling of typed binary message
        let x = msg.value;
    }
}