message MyMessage {
    value: Int;
}

contract Test4 {
    receive(msg: MyMessage) {
        // Typed binary message receiver
    }
}
