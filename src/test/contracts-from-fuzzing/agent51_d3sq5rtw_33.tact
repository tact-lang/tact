message M {
    addressField: Address;
}

contract Test {
    receive(msg: M) {
        // builtin type address in message
    }
}