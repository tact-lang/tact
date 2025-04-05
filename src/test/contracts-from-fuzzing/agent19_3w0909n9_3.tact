message MyMessage {
    value1: Int;
    value2: Bool;
    value3: Address;
}

contract TestContract {
    receive(msg: MyMessage) {
        let x = msg.value1;
        let y = msg.value2;
        let z = msg.value3;
    }
}
