contract Test {
    // Test 12: Using underscore to discard fallback binary message (Slice) parameter
    receive(_: Slice) {
        // fallback handler discarding parameter
    }
}
