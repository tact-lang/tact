contract Test {
    receive() {
        // Testing Unicode escape sequence with four hex digits
        let s: String = "Lightning: \u26A1";
    }
}
