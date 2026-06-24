message TestMsg {
    a: Int;
}

contract Test {
    // Using underscore with a typed binary message receiver; underscore should discard the parameter
    receive(_: TestMsg) {
    }
}
