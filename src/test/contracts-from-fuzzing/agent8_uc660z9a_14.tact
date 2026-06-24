message ComplexMessage {
    value1: Int;
    value2: Bool;
}

contract MessageContract {
    receive(msg: ComplexMessage) {
        let x = msg.value1;
        let y = msg.value2;
    }
}
