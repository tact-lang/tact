message MyMsg {
    value: Int;
}

contract TestTypedBinary {
    // Test: Typed binary message receiver using 'message' keyword
    receive(msg: MyMsg) {
        if (msg.value > 10) {}
    }
}
