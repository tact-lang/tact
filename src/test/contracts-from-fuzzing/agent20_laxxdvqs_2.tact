message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
    }
}