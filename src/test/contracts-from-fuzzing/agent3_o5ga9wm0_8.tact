contract Test {
    receive() {
        // Valid Unicode escape with braces: should compile successfully
        let s: String = "Smile: \u{1F60A}";
    }
}
