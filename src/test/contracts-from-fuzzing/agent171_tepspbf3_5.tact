contract Test {
    // fallback receiver for any unmatched binary messages
    receive(msg: Slice) {
        // ensure the parameter is used
        let s: Slice = msg;
    }
}
