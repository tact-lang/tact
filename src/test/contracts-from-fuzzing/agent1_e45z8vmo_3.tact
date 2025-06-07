message TestMsg {
    x: Int;
}

contract Test {
    // Valid usage: using _ as a discard parameter for a receiver expecting a message of type TestMsg
    receive(_: TestMsg) {
        // nothing needed here
    }
}
