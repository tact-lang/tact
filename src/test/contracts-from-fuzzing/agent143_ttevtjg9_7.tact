message MyMsg {
    value: Int;
}

contract TestUnderscore {
    // Receiver that discards the message using underscore
    receive(_: MyMsg) {}

    // Fallback empty message receiver
    receive() {}
}
