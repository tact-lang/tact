contract Test {
    receive() {
        // Test valid escape sequences: \n, \t, \\, \" are already seen.
        // Here we test \u and \x escapes
        let s: String = "H\u0065llo, \x57orld!";
        if (s == "Hello, World!") {
            return;
        } else {
            throw(1);
        }
    }
}
