contract Test {
    // Test 5: Fallback receiver using Slice for unmatched binary messages
    receive(msg: Slice) {
    }

    fun dummy() {}
}
