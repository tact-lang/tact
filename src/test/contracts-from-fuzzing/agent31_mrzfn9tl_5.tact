contract Test {
    receive() {
        // Testing valid hexadecimal escapes
        let s: String = "Hex: \x48\x65\x6C\x6C\x6F"; // Should yield 'Hex: Hello'
        dump(s);
    }
}
