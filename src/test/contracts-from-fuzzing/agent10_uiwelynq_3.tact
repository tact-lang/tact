message MultipleFields {
    value1: Int;
    value2: Bool;
    value3: Address;
}

contract TestContract {
    receive(msg: MultipleFields) {
    }
}