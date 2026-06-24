contract Test {
    receive() {
        // Test string literals with additional escape sequences: \b (backspace) and \f (form feed)
        let s: String = "Backspace: \b, Formfeed: \f";
    }
}
