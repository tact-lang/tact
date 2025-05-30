message MyMessage {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    receive(msg: MyMessage) {
        let value1 = msg.value1;
        let value2 = msg.value2;
    }
}