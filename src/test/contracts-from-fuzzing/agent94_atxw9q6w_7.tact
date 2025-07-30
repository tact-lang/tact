message SomeMsg {
    x: Int;
}

contract Test {
    // Test 7: Using underscore to discard receiver parameter
    receive(_: SomeMsg) {
        // The receiver accepts a SomeMsg but discards the parameter
    }
}
