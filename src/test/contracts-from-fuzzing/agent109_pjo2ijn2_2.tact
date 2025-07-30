contract Test2 {
    // Test 2: Specific text receiver for comment "hello"
    receive("hello") {
        // handle message 'hello'
    }

    get fun test(): Int {
        return 42;
    }
}
