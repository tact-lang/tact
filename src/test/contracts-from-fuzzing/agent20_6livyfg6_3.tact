message ComplexMessage {
    value1: Int;
    value2: Bool;
    value3: Address;
}

contract TestContract {
    receive(msg: ComplexMessage) {
        let x = msg.value1;
        let y = msg.value2;
        let z = msg.value3;
    }
}