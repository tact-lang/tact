message MyMsg {
    a: Int;
}

contract TestContract {
    // Typed binary message receiver with correctly declared message type
    receive(msg: MyMsg) {
        // Valid receiver; body intentionally empty
    }
}
