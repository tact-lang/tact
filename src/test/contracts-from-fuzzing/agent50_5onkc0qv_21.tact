contract Test {
    // Test for reversed declaration order: fallback receiver declared before empty message receiver
    // According to documentation, order doesn't matter, so both receivers should co-exist
    receive(msg: Slice) {
        // fallback binary handler
    }

    receive() {
        // empty message handler
    }
}
