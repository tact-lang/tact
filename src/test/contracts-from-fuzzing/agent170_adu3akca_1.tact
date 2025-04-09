contract Test {
    // Basic empty receiver that handles empty messages
    receive() {}

    // Receiver with fixed comment text
    // Uncomment to test other types in isolation.
    // receive("hello") {}

    // receive(str: String) {}
    // message MyMsg { value: Int; }
    // receive(msg: MyMsg) {}
    // receive(msg: Slice) {}
    // message(42) MyCall {}
    // receive(_: MyCall) {}
    // Multiple empty receivers test:
    // receive() {}
    // Invalid receiver parameter type:
    // receive(x: Int) {}
}
