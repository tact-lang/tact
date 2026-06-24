contract Test5 {
    // Test 5: Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // intended for unmatched binary messages
    }

    get fun test(): Int {
        return 42;
    }
}
