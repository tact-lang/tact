message ComplexMessage {
    value1: Int;
    value2: Bool;
    value3: Address;
}

contract MessageContract {
    receive(msg: ComplexMessage) {
    }
}