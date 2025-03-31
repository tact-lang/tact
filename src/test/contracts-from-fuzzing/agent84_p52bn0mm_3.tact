contract TestContract {
    receive() {
        // Test 2: Escape sequences in string literals
        let s: String = "Escape sequences: newline:\n, tab:\t, backslash:\\, quote:\"";
        dump(s);
    }
}
