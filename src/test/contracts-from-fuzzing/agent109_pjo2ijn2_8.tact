contract Test7 {
    // Test 7: Receiver with unused string parameter using underscore
    receive(_: String) {
        // simply discarding the parameter
    }

    get fun test(): Int {
        return 42;
    }
}
