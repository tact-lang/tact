message Complex {
    value1: Int;
    value2: Bool;
    value3: Address;
}

contract TestContract {
    receive(msg: Complex) {
        let x = msg.value1;
        let y = msg.value2;
        let z = msg.value3;
    }
}