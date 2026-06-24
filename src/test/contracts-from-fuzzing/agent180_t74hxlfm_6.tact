contract Test6 {
    // Test for arbitrary text message receiver using underscore to discard parameter
    receive(_: String) {
        // Minimal implementation
    }

    get fun dummy(): Int {
        return 6;
    }
}
