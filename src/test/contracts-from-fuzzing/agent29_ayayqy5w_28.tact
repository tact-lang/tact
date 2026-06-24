contract Test {
    receive() {
        // Test that Unicode escape \u{1} produces the same string as hexadecimal escape \x01
        let s: String = "\u{1}";
        if (!(s == "\x01")) {
            throw(1);
        }
    }
}
