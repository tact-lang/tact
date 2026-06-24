message ComplexMessage {
    value1: Int;
    value2: String;
    value3: Bool;
}

contract MessageContract {
    receive(msg: ComplexMessage) {
        let x = msg.value1;
        let y = msg.value2;
        let z = msg.value3;
    }
}
