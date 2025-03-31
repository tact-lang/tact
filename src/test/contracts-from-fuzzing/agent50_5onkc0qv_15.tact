contract Test {
    // Test literal receiver with exactly maximum allowed length (123 bytes)
    receive("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa") {
        // empty body
    }

    // Fallback binary receiver
    receive(msg: Slice) {
    }
}
