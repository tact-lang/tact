contract Test {
    // Multiple receivers with distinct types, testing matching priority order
    receive() {
        // empty message handler
    }
    receive("special") {
        // specific text handler
    }
    receive(str: String) {
        // arbitrary text handler
    }
    receive(msg: Slice) {
        // fallback binary message handler
    }
}
