message TestMsg {
    a: Int;
}

contract Test {
    // Typed binary message receiver
    receive(msg: TestMsg) {
    }
}
