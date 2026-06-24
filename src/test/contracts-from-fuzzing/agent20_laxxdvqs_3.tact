message MyMessage {
    value1: Int;
    value2: Bool;
}

contract Test {
    receive(msg: MyMessage) {
    }
}