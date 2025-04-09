contract Test {
    receive(msg: Slice) { // fallback receiver for unmatched binary messages
        // intentionally empty
    }
}
