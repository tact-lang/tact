message MyMsg {
    a: Int;
}

contract Test {
    receive(_: MyMsg) {
        // Receiver ignores the parameter
    }
}
