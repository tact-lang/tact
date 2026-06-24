contract Test {
    receive() {
        // Testing Unicode escape sequences, both fixed width and variable length
        dump("Unicode test: \u0041, \u{1F602}");
    }
}
