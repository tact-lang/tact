contract Test {
    receive(_: Slice) {
        // fallback receiver with discarded parameter
    }
}
