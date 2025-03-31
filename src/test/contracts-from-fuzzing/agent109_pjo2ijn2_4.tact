contract Test3 {
    // Test 3: Receiver with string parameter for arbitrary text messages
    receive(str: String) {
        // empty body that simply accepts the message
    }

    get fun test(): Int {
        return 42;
    }
}
