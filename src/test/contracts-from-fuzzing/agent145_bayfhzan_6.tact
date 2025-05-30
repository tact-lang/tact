contract Test {
    // Fallback receiver using underscore to discard message parameter
    receive(_: Slice) {
        return;
    }
}
