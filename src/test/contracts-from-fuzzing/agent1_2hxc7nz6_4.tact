message MyMessage {
    value: Int as uint32;
}

contract Test {
    receive(msg: MyMessage) {
        // Process msg
    }
}