contract Test {
    receive() {
        // Test string literal containing escaped double quotes
        let s: String = "She said \"Hello, world!\"";
        dump(s);
    }
}
